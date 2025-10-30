package controlador;

import modelo.mdCita;
import util.conexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author Anthony
 */

/*
Clase que se comunica con el control de las citas y la vista
*/
@WebServlet("/CitaServlet")
public class CitaServlet extends HttpServlet {
    
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
}



