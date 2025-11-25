/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Jhoon
 */
package controlador;

import modeloDAO.HistoriaClinicaDAO;
import modelo.mdHistoriaClinica;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ctHistoriaOdontologo")
public class ctHistoriaOdontologo extends HttpServlet {

    HistoriaClinicaDAO dao = new HistoriaClinicaDAO();

   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

    String idPacienteParam = req.getParameter("id_paciente");
    String accion = req.getParameter("accion");

    // Cargar la vista por defecto sin errores
    if (idPacienteParam == null || idPacienteParam.isEmpty()) {
        req.getRequestDispatcher("/vistas/vs_historiaClinicaOdontologo.jsp").forward(req, resp);
        return;
    }

    int idPaciente = Integer.parseInt(idPacienteParam);

    // ----- LISTAR -----
    if (accion == null) {
        req.setAttribute("listaHistorias", dao.obtenerPorPaciente(idPaciente));
    }

    // ----- EDITAR -----
    else if (accion.equals("editar")) {

        String idHistoriaParam = req.getParameter("id_historia");

        if (idHistoriaParam != null && !idHistoriaParam.isEmpty()) {
            int idHistoria = Integer.parseInt(idHistoriaParam);

            req.setAttribute("historiaSeleccionada", dao.obtenerPorId(idHistoria));
        }

        req.setAttribute("listaHistorias", dao.obtenerPorPaciente(idPaciente));
    }

    req.setAttribute("id_paciente", idPaciente);
    req.getRequestDispatcher("/vistas/vs_historiaClinicaOdontologo.jsp").forward(req, resp);
}


    // -----------------------------------------------------------
    // POST: ACTUALIZAR LA INFORMACIÓN DE UNA HISTORIA CLÍNICA
    // -----------------------------------------------------------
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");

        if (accion != null && accion.equals("actualizar")) {

            mdHistoriaClinica h = new mdHistoriaClinica();

            h.setIdHistoria(Integer.parseInt(req.getParameter("id_historia")));
            h.setMotivoConsulta(req.getParameter("motivo"));
            h.setDiagnostico(req.getParameter("diagnostico"));
            h.setTratamiento(req.getParameter("tratamiento"));
            h.setObservaciones(req.getParameter("observaciones"));

            // ejecutar DAO
            dao.actualizar(h);

            // redirigir a la lista del paciente
            resp.sendRedirect("ctHistoriaOdontologo?id_paciente=" + req.getParameter("id_paciente"));
        }
    }
}
