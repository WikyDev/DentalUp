/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author Anthony
 */
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.io.OutputStream;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletResponse;

public class reportePDF {

    public void generarAgendaDiaria(HttpServletResponse response, ResultSet rs, String fecha, String nombreOdontologo) throws Exception {
        
        try {
            Document documento = new Document();
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=agenda_" + fecha + ".pdf");
            
            PdfWriter.getInstance(documento, response.getOutputStream());
            documento.open();
            
            
            // ... [código para agregar contenido al PDF]
            // Título
            Font fontTitulo = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLUE);
            Paragraph titulo = new Paragraph("Agenda Diaria del Odontólogo", fontTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            documento.add(titulo);

            documento.add(new Paragraph("Odontólogo: " + nombreOdontologo));
            documento.add(new Paragraph("Fecha: " + fecha));
            documento.add(Chunk.NEWLINE);

            // Tabla
            PdfPTable tabla = new PdfPTable(5);
            tabla.setWidthPercentage(100);
            tabla.setWidths(new int[]{1, 3, 3, 3, 3});

            tabla.addCell("ID");
            tabla.addCell("Paciente");
            tabla.addCell("Apellidos paciente");
            tabla.addCell("Hora");
            tabla.addCell("Motivo");
            
            if (rs != null && rs.next()) {
                rs.beforeFirst(); // Importante para reiniciar ResultSet
                documento.add(new Paragraph("Inicio de reporte..."));
                while (rs.next()) {
                    tabla.addCell(String.valueOf(rs.getInt("id_cita")));
                    tabla.addCell(rs.getString("paciente"));
                    tabla.addCell(rs.getString("apellido"));
                    tabla.addCell(rs.getString("hora"));
                    tabla.addCell(rs.getString("motivo"));
                }
            } else {
                PdfPCell celda = new PdfPCell(new Phrase("No hay citas agendadas para esta fecha."));
                celda.setColspan(4);
                celda.setHorizontalAlignment(Element.ALIGN_CENTER);
                tabla.addCell(celda);
            }

            documento.add(tabla);
            documento.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
} 
