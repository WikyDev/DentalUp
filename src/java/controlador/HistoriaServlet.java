
package controlador;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.function.BiConsumer;
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
                
            // --------------------------------------------------------------------
            // GENERAR PDF DESCARGABLE (PACIENTE)
            // --------------------------------------------------------------------    
            case "pdf":
                generarPDF(request, response);
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
    
    
    // METODO QUE CREA EL PDF 
    private void generarPDF(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id_historia");
        if (idStr == null) {
            response.sendRedirect("HistoriaServlet?accion=verHistoriasPaciente&error=ID inválido");
            return;
        }

        int idHistoria = Integer.parseInt(idStr);

        // Obtener la historia a imprimir
        mdHistoriaClinica h = dao.obtenerPorId(idHistoria);
        if (h == null) {
            response.sendRedirect("HistoriaServlet?accion=verHistoriasPaciente&error=No encontrada");
            return;
        }

        // Configurar respuesta como PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition",
                "attachment; filename=HistoriaClinica_" + idHistoria + ".pdf");

        try {
            Document pdf = new Document(PageSize.A4, 40, 40, 80, 40); // márgenes
            PdfWriter writer = PdfWriter.getInstance(pdf, response.getOutputStream());

            pdf.open();

            // ===========================
            // PALETA DE COLORES
            // ===========================
            BaseColor azulPrincipal = new BaseColor(0x4D, 0x7F, 0xFF);
            BaseColor azulSuave = new BaseColor(0x73, 0xA6, 0xF2);
            BaseColor azulMedio = new BaseColor(0x64, 0x7C, 0xF5);
            BaseColor naranja = new BaseColor(0xFD, 0xB8, 0x66);
            BaseColor amarillo = new BaseColor(0xF4, 0xC7, 0x4A);
            BaseColor salmón = new BaseColor(0xFF, 0x87, 0x87);

            // ===========================
            // FUENTES
            // ===========================
            Font titulo = new Font(Font.FontFamily.HELVETICA, 17, Font.BOLD, BaseColor.WHITE);
            Font seccion = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD, BaseColor.BLACK);
            Font campo = new Font(Font.FontFamily.HELVETICA, 11, Font.BOLD, BaseColor.BLACK);
            Font texto = new Font(Font.FontFamily.HELVETICA, 11, 0, BaseColor.BLACK);

            // ===========================
            // ENCABEZADO CON LOGO
            // ===========================
            PdfPTable header = new PdfPTable(2);
            header.setWidthPercentage(100);
            header.setWidths(new float[]{1, 4});
            try {
                //ruta interna del proyecto web
                String pathLogo = getServletContext().getRealPath("/imagenes/logo.png");
                Image logo = Image.getInstance(pathLogo);
                logo.scaleToFit(60, 60);
                
                PdfPCell cellLogo = new PdfPCell(logo);
                cellLogo.setBorder(Rectangle.NO_BORDER);
                cellLogo.setHorizontalAlignment(Element.ALIGN_LEFT);
                header.addCell(cellLogo);

            } catch (Exception e) {
                System.out.println("⚠ No se pudo cargar el logo: " + e.getMessage());
                PdfPCell cellLogoFallback = new PdfPCell(new Phrase(" "));
                cellLogoFallback.setBorder(Rectangle.NO_BORDER);
                header.addCell(cellLogoFallback);
            }

            PdfPCell tituloHeader = new PdfPCell(new Phrase("HISTORIA CLÍNICA", titulo));
            tituloHeader.setBorder(Rectangle.NO_BORDER);
            tituloHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            tituloHeader.setVerticalAlignment(Element.ALIGN_MIDDLE);
            tituloHeader.setBackgroundColor(azulPrincipal);
            tituloHeader.setPadding(15);

            header.addCell(tituloHeader);
            pdf.add(header);

            pdf.add(new Paragraph("\n"));

            // ===========================
            // CAJA: DATOS GENERALES
            // ===========================
            PdfPTable boxGeneral = new PdfPTable(1);
            boxGeneral.setWidthPercentage(100);

            PdfPCell tituloCaja1 = new PdfPCell(new Phrase("Datos Generales", seccion));
            tituloCaja1.setBackgroundColor(azulSuave);
            tituloCaja1.setPadding(8);
            boxGeneral.addCell(tituloCaja1);

            PdfPCell contenido1 = new PdfPCell();
            contenido1.setPadding(10);
            contenido1.setBorderColor(naranja);

            // ===========================
            // Tabla interna con 2 columnas
            // ===========================
            PdfPTable tablaDatos = new PdfPTable(2);
            tablaDatos.setWidthPercentage(100);
            tablaDatos.setSpacingBefore(5);
            tablaDatos.setSpacingAfter(5);
            tablaDatos.setWidths(new float[]{1.5f, 3f});  // ajusta proporción etiqueta/valor

            // Helper
            final java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
            java.util.function.BiConsumer<String, String> addRowSafe = (label, value) -> {
                PdfPCell c1 = new PdfPCell(new Phrase(label == null ? "" : label, campo));
                c1.setBorder(Rectangle.NO_BORDER);
                c1.setPadding(4);

                PdfPCell c2 = new PdfPCell(new Phrase(value == null ? "" : value, texto));
                c2.setBorder(Rectangle.NO_BORDER);
                c2.setPadding(4);

                tablaDatos.addCell(c1);
                tablaDatos.addCell(c2);
            };

            
            // Obtener y formatear valores con control de nulls 
            String idHist = String.valueOf(h.getIdHistoria());

            String fechaRegistro = (h.getFecha() != null) ? sdf.format(new java.util.Date(h.getFecha().getTime())) : "";
            String nombrePaciente = (h.getNombrePaciente() != null) ? h.getNombrePaciente() : "";
            String documento = String.valueOf(h.getCedulaPaciente());

            // edad es int; si tu modelo puede devolver 0 cuando no existe, controla eso si lo necesitas
            String edad = (h.getEdad() != 0) ? String.valueOf(h.getEdad()) : "";

            // fecha_nac (java.sql.Date)
            String fechaNac = (h.getFechaNac()!= null) ? sdf.format(new java.util.Date(h.getFechaNac().getTime())) : "";

            String telefono = (h.getTelefono() != null) ? h.getTelefono() : "";
            String email = (h.getEmail() != null) ? h.getEmail() : "";

            String nombreOdonto = (h.getNombreOdontologo() != null) ? h.getNombreOdontologo() : "";
            
            // Añadir filas (etiqueta, valor)
            addRowSafe.accept("ID Historia:", idHist);
            addRowSafe.accept("Fecha Registro:", fechaRegistro);

            addRowSafe.accept("Paciente:", nombrePaciente);
            addRowSafe.accept("Documento:", documento);

            addRowSafe.accept("Edad:", edad);
            addRowSafe.accept("Fecha Nac:", fechaNac);

            addRowSafe.accept("Teléfono:", telefono);
            addRowSafe.accept("Email:", email);
            
            addRowSafe.accept("Odontólogo:", nombreOdonto);

            // Agregamos la tabla al contenido
            contenido1.addElement(tablaDatos);

            // Añadimos la caja al PDF
            boxGeneral.addCell(contenido1);
            pdf.add(boxGeneral);

            pdf.add(new Paragraph("\n"));

            // ===========================
            // CAJA: DIAGNÓSTICO
            // ===========================
            pdf.add(crearCaja("Diagnóstico", h.getDiagnostico(), azulSuave, amarillo, seccion, campo, texto));

            pdf.add(new Paragraph("\n"));

            // ===========================
            // CAJA: TRATAMIENTO
            // ===========================
            pdf.add(crearCaja("Tratamiento", h.getTratamiento(), azulSuave, salmón, seccion, campo, texto));

            pdf.add(new Paragraph("\n"));

            // ===========================
            // CAJA: OBSERVACIONES
            // ===========================
            pdf.add(crearCaja("Observaciones", h.getObservaciones(), azulSuave, azulMedio, seccion, campo, texto));

            pdf.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("HistoriaServlet?accion=verHistoriasPaciente&error=PDF_Error");
        }
    }

    /**
     * Método auxiliar para generar cajas de contenido
     */
    private PdfPTable crearCaja(String titulo, String contenido,
            BaseColor fondoTitulo, BaseColor borde,
            Font fTitulo, Font fCampo, Font fTexto) {

        PdfPTable table = new PdfPTable(1);
        table.setWidthPercentage(100);

        PdfPCell cTitulo = new PdfPCell(new Phrase(titulo, fTitulo));
        cTitulo.setBackgroundColor(fondoTitulo);
        cTitulo.setPadding(8);
        table.addCell(cTitulo);

        PdfPCell cContenido = new PdfPCell();
        cContenido.setPadding(10);
        cContenido.setBorderColor(borde);
        cContenido.addElement(new Phrase(contenido, fTexto));

        table.addCell(cContenido);

        return table;
    }

}
