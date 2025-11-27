
package controlador;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import modelo.mdHistoriaClinica;
import modeloDAO.CitaDAO;
import modeloDAO.HistoriaClinicaDAO;
/**
 *
 * @author Anthony
 */
@WebServlet("/HistoriaServlet")
public class HistoriaServlet extends HttpServlet {

    private HistoriaClinicaDAO dao = new HistoriaClinicaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // VALIDACIÓN UNIVERSAL DE ROL
        String rol = (session != null) ? (String) session.getAttribute("rol") : null;

        if (rol == null) {
            response.sendRedirect("vistas/vs_login.jsp");
            return;
        }

        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        RequestDispatcher rd;

        switch (accion) {

            // --------------------------------------------------------------------
            // VER HISTORIAS DEL PACIENTE LOGUEADO
            // --------------------------------------------------------------------
            case "verHistoriasPaciente":
                Integer cedulaPaciente = (Integer) session.getAttribute("cedula_paciente");

                if (cedulaPaciente == null) {
                    response.sendRedirect("vistas/vs_login.jsp");
                    return;
                }

                request.setAttribute("listaHistorias", dao.obtenerPorPaciente(cedulaPaciente));
                System.out.println("Historias encontradas: " + dao.obtenerPorPaciente(cedulaPaciente).size());

                rd = request.getRequestDispatcher("vistas/vs_historiaClinica.jsp");
                rd.forward(request, response);
                break;

            // --------------------------------------------------------------------
            // CARGAR DATOS DE LA CITA SELECCIONADA (odontólogo)
            // --------------------------------------------------------------------
            case "cargarDesdeCita":
                request.setAttribute("id_cita", request.getParameter("id_cita"));
                request.setAttribute("cedula_paciente", request.getParameter("cedula_paciente"));
                request.setAttribute("cedula_odontologo", request.getParameter("cedula_odontologo"));
                request.setAttribute("fecha", request.getParameter("fecha"));
                request.setAttribute("motivo", request.getParameter("motivo"));
                rd = request.getRequestDispatcher("vistas/vs_registrarHistoria.jsp");
                rd.forward(request, response);
                break; 

            default:
            // POR DEFECTO, SE ENVIA SEGÚN EL ROL
            if (rol.equalsIgnoreCase("odontologo")) {
                response.sendRedirect("vistas/vs_menuOdonto.jsp");
            } else if (rol.equalsIgnoreCase("paciente")) {
                response.sendRedirect("vistas/vs_menuPaciente.jsp");
            } else {
                response.sendRedirect("vistas/vs_login.jsp");
            }
        }
    }

    // ------------------------------------------------------------------------
    // REGISTRAR HISTORIA CLÍNICA (POST)
    // ------------------------------------------------------------------------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("registrar".equals(accion)) {

            int idCita = Integer.parseInt(request.getParameter("id_cita"));
            int cedulaPaciente = Integer.parseInt(request.getParameter("cedula_paciente"));
            int cedulaOdontologo = Integer.parseInt(request.getParameter("cedula_odontologo"));
            String fechaStr = request.getParameter("fecha");
            String motivo = request.getParameter("motivoConsulta");
            String diagnostico = request.getParameter("diagnostico");
            String tratamiento = request.getParameter("tratamiento");
            String observaciones = request.getParameter("observaciones");
            
            // VALIDACIÓN DE FECHA
            if (fechaStr != null && fechaStr.contains(" ")) {
                fechaStr = fechaStr.substring(0, fechaStr.indexOf(" "));
            }

            java.sql.Date fechaSQL = java.sql.Date.valueOf(fechaStr);
            

            // Validación básica
            if (diagnostico == null || diagnostico.trim().isEmpty()
                    || tratamiento == null || tratamiento.trim().isEmpty()) {

                request.setAttribute("error", "Debe completar diagnóstico y tratamiento.");
                request.getRequestDispatcher("vistas/vs_registrarHistoria.jsp").forward(request, response);
                return;
            }

            mdHistoriaClinica h = new mdHistoriaClinica();
            h.setCedulaPaciente(cedulaPaciente);
            h.setCedulaOdontologo(cedulaOdontologo);
            h.setFecha(fechaSQL);
            h.setMotivoConsulta(motivo);
            h.setDiagnostico(diagnostico);
            h.setTratamiento(tratamiento);
            h.setObservaciones(observaciones);

            boolean ok = dao.insertar(h);

            if (ok) {

                // Cambiar estado de la cita
                CitaDAO citaDAO = new CitaDAO();
                citaDAO.marcarComoAtendida(idCita);

                // Evitar re-envío del formulario
                response.sendRedirect("CitaServlet?accion=listarOdontologo&msg=ok");
                return;

            } else {
                request.setAttribute("error", "❌ Error al registrar la historia clínica.");
                request.getRequestDispatcher("vistas/vs_registrarHistoria.jsp").forward(request, response);
            }
        }
    }

    
    private void listarHistoriasPaciente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer cedulaPaciente = (Integer) session.getAttribute("cedula_paciente");

        if (cedulaPaciente == null) {
            request.setAttribute("error", "Debe iniciar sesión.");
            request.getRequestDispatcher("vistas/vs_login.jsp").forward(request, response);
            return;
        }

        ArrayList<mdHistoriaClinica> lista = dao.obtenerPorPaciente(cedulaPaciente);

        request.setAttribute("listaHistorias", lista);
        request.getRequestDispatcher("vistas/vs_historiaClinica.jsp").forward(request, response);
    }
    

}
