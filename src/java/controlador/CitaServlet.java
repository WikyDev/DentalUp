package controlador;

import modelo.mdCita;
import modeloDAO.CitaDAO;
import modelo.mdOdontologo;
import util.conexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
/**
 *
 * @author Anthony
 */

/*
Clase que se comunica con el control de las citas y la vista
*/
@WebServlet("/CitaServlet")
public class CitaServlet extends HttpServlet {
    
    private CitaDAO citaDAO = new CitaDAO();
    /*
    Metodo para obtener las citas del paciente que este logueado
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "listar":
                listarCitasPaciente(request, response);
                break;
            case "listarOdontologo":
                listarCitasOdontologo(request, response);
                break;
            case "editar":
                mostrarFormularioEditar(request, response);
                break;
            case "eliminar":
                eliminarCita(request, response);
                break;
            case "agendar":
                mostrarFormularioAgendar(request, response);
                break;
            default:
                response.sendRedirect("vistas/vs_menuPaciente.jsp");
                break;
        }
    }

    /*
    Metodo que envia los datos de la cita para almacenarla
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("registrar".equals(accion)) {
            registrarCita(request, response);
        }else if("actualizar".equals(accion)){
            actualizarCita(request, response);
        } else {
            doGet(request, response);
        }
    }
    
    /*
    Metodo que hace la incersion de la cita en la base de datos 
    */
    private void registrarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idPaciente = Integer.parseInt(request.getParameter("id_paciente"));
        int idOdontologo = Integer.parseInt(request.getParameter("id_odontologo"));
        String fechaCita = request.getParameter("fecha_cita");
        String motivo = request.getParameter("motivo");

        String sql = "INSERT INTO citas (id_paciente, id_odontologo, fecha_cita, motivo) VALUES (?, ?, ?, ?)";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idPaciente);
            ps.setInt(2, idOdontologo);
            ps.setString(3, fechaCita);
            ps.setString(4, motivo);
            ps.executeUpdate();

            request.setAttribute("mensaje", "✅ Cita agendada correctamente");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "❌ Error al registrar la cita: " + e.getMessage());
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("vistas/vs_agendarCita.jsp");
        rd.forward(request, response);
    }
    
    private void mostrarFormularioAgendar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Obtener lista de odontólogos desde ctOdonto
        controlador.ctOdonto ctrl = new controlador.ctOdonto();
        ArrayList<mdOdontologo> lista = ctrl.obtenerTodos();

        // 2. Enviar la lista a la vista
        request.setAttribute("listaOdontologos", lista);

        // 3. Redirigir a la vista
        RequestDispatcher rd = request.getRequestDispatcher("vistas/vs_agendarCita.jsp");
        rd.forward(request, response);
    }

    /*
    Metodo que obtiene los datos de la cita para despues mostrarla 
    (Para el paciente que este logueado)
    */
    private void listarCitasPaciente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer idPaciente = (Integer) session.getAttribute("id_paciente");

        if (idPaciente == null) {
            request.setAttribute("mensaje", "⚠️ Debe iniciar sesión para ver sus citas.");
            request.getRequestDispatcher("vistas/vs_login.jsp").forward(request, response);
            return;
        }

        ctAgendarCita ctrl = new ctAgendarCita();
        ArrayList<mdCita> listaCitas = ctrl.obtenerCitasPorPaciente(idPaciente);

        request.setAttribute("listaCitas", listaCitas);
        RequestDispatcher rd = request.getRequestDispatcher("vistas/vs_listarCitasPaciente.jsp");
        rd.forward(request, response);
    }
    
    /*
    Metodo que obtiene los datos de la cita para despues mostrarla 
    (Para el odontologo que este logueado)
    */
    private void listarCitasOdontologo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer idOdontologo = (Integer) session.getAttribute("id_odontologo");

        if (idOdontologo == null) {
            request.setAttribute("mensaje", "⚠️ Debe iniciar sesión como odontólogo.");
            request.getRequestDispatcher("vistas/vs_login.jsp").forward(request, response);
            return;
        }

        ctOdonto ctrl = new ctOdonto();
        ArrayList<mdCita> listaCitas = ctrl.obtenerCitasPorOdontologo(idOdontologo);

        request.setAttribute("listaCitas", listaCitas);
        RequestDispatcher rd = request.getRequestDispatcher("vistas/vs_citasOdontologo.jsp");
        rd.forward(request, response);
    }
    
    // --- Mostrar formulario de editar ---
    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer idPacienteSesion = (Integer) session.getAttribute("id_paciente");

        String idStr = request.getParameter("id");
        if (idStr == null) {
            request.setAttribute("mensaje", "Error: ID de cita no proporcionado.");
            listarCitasPaciente(request, response);
            return;
        }

        int idCita = Integer.parseInt(idStr);
        mdCita cita = citaDAO.obtenerCitaPorId(idCita);

        if (cita == null) {
            request.setAttribute("mensaje", "Error: cita no encontrada.");
            listarCitasPaciente(request, response);
            return;
        }

        // Verificar que el paciente en sesión sea el dueño de la cita
        if (idPacienteSesion == null || idPacienteSesion != cita.getIdPaciente()) {
            request.setAttribute("mensaje", "No tienes permiso para editar esta cita."); 
            listarCitasPaciente(request, response);
            return;
        }

        // No permitir editar si ya fue atendida
        if (mdCita.ESTADO_ATENDIDA.equalsIgnoreCase(cita.getEstado())) {
            request.setAttribute("mensaje", "No es posible editar una cita que ya fue atendida.");
            listarCitasPaciente(request, response);
            return;
        }

        // Obtener lista de odontólogos (id, nombre) para el select
        Map<Integer, String> odontologos = new LinkedHashMap<>();
        String sql = "SELECT id_odontologo, nombre_completo FROM odontologos ORDER BY nombre_completo ASC";
        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                odontologos.put(rs.getInt("id_odontologo"), rs.getString("nombre_completo"));
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo odontólogos: " + e.getMessage());
        }

        request.setAttribute("cita", cita);
        request.setAttribute("odontologos", odontologos);
        RequestDispatcher rd = request.getRequestDispatcher("vistas/vs_editarCita.jsp");
        rd.forward(request, response);
    }

    // --- Actualizar cita (POST) ---
    private void actualizarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer idPacienteSesion = (Integer) session.getAttribute("id_paciente");

        try {
            int idCita = Integer.parseInt(request.getParameter("id_cita"));
            int idOdontologo = Integer.parseInt(request.getParameter("id_odontologo"));
            String fecha = request.getParameter("fecha"); // yyyy-MM-dd
            String hora = request.getParameter("hora");   // HH:mm
            String motivo = request.getParameter("motivo");

            // Combina fecha + hora en el mismo formato que usas en BD
            String fechaCita = fecha + " " + hora;

            mdCita citaExistente = citaDAO.obtenerCitaPorId(idCita);
            if (citaExistente == null) {
                request.setAttribute("mensaje", "Cita no encontrada.");
                listarCitasPaciente(request, response);
                return;
            }

            // Verificar permisos
            if (idPacienteSesion == null || idPacienteSesion != citaExistente.getIdPaciente()) {
                request.setAttribute("mensaje", "No tienes permiso para actualizar esta cita.");
                listarCitasPaciente(request, response);
                return;
            }

            // No permitir actualizar si ya fue atendida
            if (mdCita.ESTADO_ATENDIDA.equalsIgnoreCase(citaExistente.getEstado())) {
                request.setAttribute("mensaje", "No es posible actualizar una cita que ya fue atendida.");
                listarCitasPaciente(request, response);
                return;
            }

            mdCita nueva = new mdCita();
            nueva.setIdCita(idCita);
            nueva.setIdPaciente(citaExistente.getIdPaciente());
            nueva.setIdOdontologo(idOdontologo);
            nueva.setFechaCita(fechaCita);
            nueva.setMotivo(motivo);
            nueva.setEstado(citaExistente.getEstado());

            boolean ok = citaDAO.actualizar(nueva);
            if (ok) {
                request.setAttribute("mensaje", "✅ Cita actualizada correctamente.");
            } else {
                request.setAttribute("mensaje", "❌ Error al actualizar la cita.");
            }

        } catch (Exception e) {
            request.setAttribute("mensaje", "❌ Error en los datos: " + e.getMessage());
        }

        listarCitasPaciente(request, response);
    }

    // --- Eliminar cita (GET) ---
    private void eliminarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer idPacienteSesion = (Integer) session.getAttribute("id_paciente");

        String idStr = request.getParameter("id");
        if (idStr == null) {
            request.setAttribute("mensaje", "Error: ID de cita no proporcionado.");
            listarCitasPaciente(request, response);
            return;
        }

        int idCita = Integer.parseInt(idStr);
        mdCita cita = citaDAO.obtenerCitaPorId(idCita);
        if (cita == null) {
            request.setAttribute("mensaje", "Cita no encontrada.");
            listarCitasPaciente(request, response);
            return;
        }

        // Verificar que el paciente en sesión sea el dueño
        if (idPacienteSesion == null || idPacienteSesion != cita.getIdPaciente()) {
            request.setAttribute("mensaje", "No tienes permiso para eliminar esta cita.");
            listarCitasPaciente(request, response);
            return;
        }

        // No permitir eliminar si ya fue atendida
        if (mdCita.ESTADO_ATENDIDA.equalsIgnoreCase(cita.getEstado())) {
            request.setAttribute("mensaje", "No es posible eliminar una cita que ya fue atendida.");
            listarCitasPaciente(request, response);
            return;
        }

        boolean ok = citaDAO.eliminar(idCita);
        if (ok) {
            request.setAttribute("mensaje", "✅ Cita eliminada correctamente.");
        } else {
            request.setAttribute("mensaje", "❌ Error al eliminar la cita.");
        }

        listarCitasPaciente(request, response);
    }

}



