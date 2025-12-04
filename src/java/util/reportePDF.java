package util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import modelo.mdCita;

import java.io.OutputStream;
import java.util.List;

public class reportePDF {

    /**
     * Versión principal: genera un PDF con el logo (si se pasa la ruta).
     *
     * @param citas    Lista de citas a mostrar
     * @param out      OutputStream donde se escribirá el PDF
     * @param logoPath Ruta absoluta del logo en el servidor (puede ser null)
     */
    public void generarReporteCitas(List<mdCita> citas,
                                    OutputStream out,
                                    String logoPath) throws Exception {

        Document document = new Document(PageSize.A4.rotate(), 36, 36, 36, 36);
        PdfWriter.getInstance(document, out);
        document.open();

        // ---------- ENCABEZADO CON LOGO + TÍTULO ----------
        PdfPTable headerTable = new PdfPTable(2);
        headerTable.setWidthPercentage(100);
        headerTable.setWidths(new float[]{15, 85});

        // Celda del logo
        PdfPCell logoCell;
        if (logoPath != null) {
            try {
                Image logo = Image.getInstance(logoPath);
                logo.scaleToFit(80, 80);
                logoCell = new PdfPCell(logo, false);
            } catch (Exception e) {
                // Si falla el logo, dejamos la celda vacía
                logoCell = new PdfPCell(new Phrase(""));
            }
        } else {
            logoCell = new PdfPCell(new Phrase(""));
        }
        logoCell.setBorder(Rectangle.NO_BORDER);
        logoCell.setHorizontalAlignment(Element.ALIGN_LEFT);
        logoCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        headerTable.addCell(logoCell);

        // Celda del título
        Font tituloFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.DARK_GRAY);
        Font subFont = new Font(Font.FontFamily.HELVETICA, 11, Font.NORMAL, BaseColor.GRAY);

        Paragraph pTitulo = new Paragraph("Reporte General de Citas - DentalUp", tituloFont);
        pTitulo.setAlignment(Element.ALIGN_LEFT);
        pTitulo.setSpacingAfter(4);

        Paragraph pSub = new Paragraph("Generado desde el módulo Secretario", subFont);
        pSub.setAlignment(Element.ALIGN_LEFT);

        PdfPCell titleCell = new PdfPCell();
        titleCell.addElement(pTitulo);
        titleCell.addElement(pSub);
        titleCell.setBorder(Rectangle.NO_BORDER);
        titleCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        headerTable.addCell(titleCell);

        document.add(headerTable);

        // Separador
        LineSeparator ls = new LineSeparator();
        ls.setLineColor(new BaseColor(148, 163, 184));
        ls.setLineWidth(1f);
        document.add(new Chunk(ls));
        document.add(Chunk.NEWLINE);

        // ---------- TABLA DE CITAS ----------
        PdfPTable table = new PdfPTable(8);
        table.setWidthPercentage(100);
        table.setWidths(new float[]{6, 11, 18, 11, 18, 14, 30, 10});

        Font headerFont = new Font(Font.FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.WHITE);
        BaseColor azul = new BaseColor(37, 99, 235);

        addHeader(table, "ID", headerFont, azul);
        addHeader(table, "Céd. Pac.", headerFont, azul);
        addHeader(table, "Paciente", headerFont, azul);
        addHeader(table, "Céd. Odonto.", headerFont, azul);
        addHeader(table, "Odontólogo", headerFont, azul);
        addHeader(table, "Fecha", headerFont, azul);
        addHeader(table, "Motivo", headerFont, azul);
        addHeader(table, "Estado", headerFont, azul);

        Font cellFont = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL, BaseColor.BLACK);
        BaseColor grisClaro = new BaseColor(248, 250, 252); // zebra
        boolean zebra = false;

        for (mdCita c : citas) {
            String paciente = ((c.getNombrePaciente() != null) ? c.getNombrePaciente() : "") +
                    " " +
                    ((c.getApellidoPaciente() != null) ? c.getApellidoPaciente() : "");
            paciente = paciente.trim();

            BaseColor rowBg = zebra ? grisClaro : BaseColor.WHITE;
            zebra = !zebra;

            addCell(table, String.valueOf(c.getIdCita()), cellFont, rowBg);
            addCell(table, String.valueOf(c.getCedulaPaciente()), cellFont, rowBg);
            addCell(table, paciente, cellFont, rowBg);
            addCell(table, String.valueOf(c.getCedulaOdontologo()), cellFont, rowBg);
            addCell(table, c.getNombreOdontologo() != null ? c.getNombreOdontologo() : "", cellFont, rowBg);
            addCell(table, c.getFechaCita(), cellFont, rowBg);
            addCell(table, c.getMotivo(), cellFont, rowBg);
            addCell(table, c.getEstado(), cellFont, rowBg);
        }

        document.add(table);
        document.close();
    }

    // Overload por si en algún futuro quieres llamar sin logo
    public void generarReporteCitas(List<mdCita> citas, OutputStream out) throws Exception {
        generarReporteCitas(citas, out, null);
    }

    private void addHeader(PdfPTable t, String txt, Font f, BaseColor bg) {
        PdfPCell cell = new PdfPCell(new Phrase(txt, f));
        cell.setBackgroundColor(bg);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setPadding(6);
        t.addCell(cell);
    }

    private void addCell(PdfPTable t, String txt, Font f, BaseColor bg) {
        PdfPCell cell = new PdfPCell(new Phrase(txt != null ? txt : "", f));
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setPadding(4);
        cell.setBackgroundColor(bg);
        t.addCell(cell);
    }
}
