/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author Anthony
 */
import util.reportePDF;
import util.conexion;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet("/ReportePDFServlet")
public class ReportePDFServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id_odontologo"));
        String fecha = request.getParameter("fecha");

        try {
            System.out.println("👉 Inició generación de PDF...");
            conexion c = new conexion();
            ResultSet rs = c.consultarScrollable(
                "SELECT ci.id_cita, p.nombre AS paciente, p.apellido, TIME(ci.fecha_cita) AS hora, ci.motivo, o.nombre_completo AS odontologo " +
                "FROM citas ci " +
                "JOIN pacientes p ON ci.id_paciente = p.id_paciente " +
                "JOIN odontologos o ON ci.id_odontologo = o.id_odontologo " +
                "WHERE DATE(ci.fecha_cita) = '" + fecha + "' AND o.id_odontologo = " + id
            );

            String nombre = "";
            if (rs != null && rs.next()) {
                nombre = rs.getString("odontologo");
                rs.beforeFirst();
            }

            // Lógica del PDF
            reportePDF pdf = new reportePDF();
            pdf.generarAgendaDiaria(response, rs, fecha, nombre);
            System.out.println("✅ PDF generado correctamente.");

            rs.close();
            c.cerrar();
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/plain");
            response.getWriter().write("Error al generar PDF: " + e.getMessage());
        }
    }
}
