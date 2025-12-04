package util;

import modeloDAO.CitaDAO;
import modelo.mdCita;
import util.reportePDF;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ReportePDFServlet")
public class ReportePDFServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        response.setHeader(
                "Content-Disposition",
                "inline; filename=reporte_citas.pdf"
        );

        try {
            // 1. Obtener todas las citas
            CitaDAO dao = new CitaDAO();
            ArrayList<mdCita> citas = dao.listarTodasLasCitas();

            // 2. Obtener ruta física del logo en la carpeta /imagenes
            // Cambia el nombre del archivo si tu logo se llama diferente
            String logoPath = getServletContext().getRealPath("/imagenes/logo.png");

            // 3. Generar PDF
            reportePDF generador = new reportePDF();
            generador.generarReporteCitas(citas, response.getOutputStream(), logoPath);

        } catch (Exception e) {
            e.printStackTrace();
            response.reset();
            response.setContentType("text/plain; charset=UTF-8");
            response.getWriter().println("Error generando PDF: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}
