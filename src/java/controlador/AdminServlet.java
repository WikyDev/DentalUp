
package controlador;

import com.itextpdf.text.pdf.parser.clipper.Paths;
import java.io.File;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.List;
import java.io.IOException;
import modelo.mdAdmin;
import modelo.mdSecretario;
import modelo.mdOdontologo;
import modelo.mdUsuarios;
/**
 *
 * @author Anthony
 */

/*Clase que controla las acciones para la correcta funcionalidad del menú del administrador*/
@WebServlet("/AdminServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 15    // 15 MB
)
public class AdminServlet extends HttpServlet{
    
    ctRegistroAdmin ct = new ctRegistroAdmin();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null || accion.isEmpty()) {
            request.setAttribute("mensaje", "No se recibió la acción del formulario.");
            request.getRequestDispatcher("/vistas/vs_menuAdmin.jsp").forward(request, response);
            return;
        }
        
        
        
        switch (accion) {

            case "crearAdmin":
                registrarAdministrador(request, response);
                break;

            case "crearSecretario":
                registrarSecretario(request, response);
                break;

            case "crearOdontologo":
                registrarOdontologo(request, response);
                break;
                
            case "paso2PerfilOdontologo":
                pasarAPerfilOdontologo(request, response);
                break;  
                
            case "registrarOdontologoFinal":
                registrarOdontologoFinal(request, response);
                break;   

            default:
                request.setAttribute("mensaje", "❌ Acción desconocida.");
                request.getRequestDispatcher("/vistas/vs_menuAdmin.jsp")
                       .forward(request, response);
        }
    }

    /* LISTAR ACCIONES GET */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "menu"; // por si no se envía nada
        }

        switch (accion) {

            case "listarUsuarios":
                String filtroRol = request.getParameter("rol");
                List<mdUsuarios> lista;

                if (filtroRol != null && !filtroRol.equals("todos")) {
                    lista = ct.listarUsuariosPorRol(filtroRol);
                    request.setAttribute("filtroActual", filtroRol);
                } else {
                    lista = ct.listarUsuarios();
                    request.setAttribute("filtroActual", "todos");
                }

                request.setAttribute("listaUsuarios", lista);
                request.getRequestDispatcher("vistas/vs_listarUsuariosDROP.jsp").forward(request, response);
                break;

            case "formNuevoAdmin":
                request.getRequestDispatcher("/vistas/vs_crear_admin.jsp")
                       .forward(request, response);
                break;

            case "formNuevoSecretario":
                request.getRequestDispatcher("/vistas/vs_crear_secretario.jsp")
                       .forward(request, response);
                break;

            case "formNuevoOdontologo":
                request.getRequestDispatcher("/vistas/vs_crear_odontologo.jsp")
                       .forward(request, response);
                break;

            case "eliminarUsuario":
                int id = Integer.parseInt(request.getParameter("id_user"));
                boolean eliminado = ct.eliminarUsuario(id);

                if (eliminado) {
                    response.sendRedirect(request.getContextPath() + "/AdminServlet?accion=listarUsuarios&msg=Usuario eliminado correctamente");
                } else {
                    response.sendRedirect(request.getContextPath() + "/AdminServlet?accion=listarUsuarios&error=No se pudo eliminar el usuario");
                }
            break;
            
            default:
                response.sendRedirect("vistas/vs_menuAdmin.jsp");
        }
    }


    /* ------------------------- ACCIONES POST -------------------------------- */

    private void registrarAdministrador(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener datos del formulario
        String cedulaStr = request.getParameter("cedula_admin");
        String nombre = request.getParameter("nombre_completo");
        String correo = request.getParameter("correo");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        long cedula = 0;
        try {
            cedula = Long.parseLong(cedulaStr);
        } catch (Exception e) {
            cedula = 0;
        }

        if (cedula <= 0) {
            request.setAttribute("mensaje", "❌ La cédula no es válida.");
            request.getRequestDispatcher("/vistas/vs_crear_admin.jsp").forward(request, response);
            return;
        }

        // Crear modelo
        mdAdmin admin = new mdAdmin();
        admin.setCedulaAdmin(cedula);
        admin.setNombreCompleto(nombre);
        admin.setCorreo(correo);

        // Controlador lógico
        ctRegistroAdmin ctrl = new ctRegistroAdmin();
        boolean ok = ctrl.registrarAdministrador(admin, usuario, password);

        if (ok) {
            request.setAttribute("mensaje", "✅ Administrador registrado exitosamente.");
        } else {
            request.setAttribute("mensaje", "❌ Error al registrar administrador.");
        }

        request.getRequestDispatcher("/vistas/vs_crear_admin.jsp").forward(request, response);
    }

    private void registrarSecretario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cedulaStr = request.getParameter("cedula_secretario");
        String nombre = request.getParameter("nombre_completo");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        long cedula = 0;
        try { cedula = Long.parseLong(cedulaStr); } catch (Exception e) { cedula = 0; }

        if (cedula <= 0) {
            request.setAttribute("mensaje", "❌ Cédula inválida.");
            request.getRequestDispatcher("/vistas/vs_crear_secretario.jsp").forward(request, response);
            return;
        }

        mdSecretario sec = new mdSecretario();
        sec.setCedulaSecretario(cedula);
        sec.setNombreCompleto(nombre);
        sec.setTelefono(telefono);
        sec.setCorreo(correo);

        ctRegistroAdmin ctrl = new ctRegistroAdmin();
        boolean ok = ctrl.registrarSecretario(sec, usuario, password);

        if (ok) {
            request.setAttribute("mensaje", "✅ Secretario registrado.");
        } else {
            request.setAttribute("mensaje", "❌ Error al registrar secretario.");
        }

        request.getRequestDispatcher("/vistas/vs_crear_secretario.jsp").forward(request, response);
    }

    private void registrarOdontologo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cedulaStr = request.getParameter("cedula_odontologo");
        String nombre = request.getParameter("nombre_completo");
        String especialidad = request.getParameter("especialidad");
        String correo = request.getParameter("correo");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        long cedula = 0;
        try { cedula = Long.parseLong(cedulaStr); } catch (Exception e) { cedula = 0; }

        if (cedula <= 0) {
            request.setAttribute("mensaje", "❌ Cédula inválida.");
            request.getRequestDispatcher("/vistas/vs_crear_odontologo.jsp").forward(request, response);
            return;
        }

        mdOdontologo odo = new mdOdontologo();
        odo.setCedulaOdontologo(cedula);
        odo.setNombreCompleto(nombre);
        odo.setEspecialidad(especialidad);
        odo.setCorreo(correo);

        ctRegistroAdmin ctrl = new ctRegistroAdmin();
        boolean ok = ctrl.registrarOdontologo(odo, usuario, password);

        if (ok) {
            request.setAttribute("mensaje", "✅ Odontólogo registrado.");
        } else {
            request.setAttribute("mensaje", "❌ Error al registrar odontólogo.");
        }

        request.getRequestDispatcher("/vistas/vs_crear_odontologo.jsp").forward(request, response);
    }
    
    private void pasarAPerfilOdontologo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("cedula", request.getParameter("cedula_odontologo"));
        request.setAttribute("nombre", request.getParameter("nombre_completo"));
        request.setAttribute("especialidad", request.getParameter("especialidad"));
        request.setAttribute("correo", request.getParameter("correo"));
        request.setAttribute("usuario", request.getParameter("usuario"));
        request.setAttribute("password", request.getParameter("password"));

        request.getRequestDispatcher("/vistas/vs_crear_odontologo_perfil.jsp")
                .forward(request, response);
    }
    
    private void registrarOdontologoFinal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Datos del paso 1
        long cedula = Long.parseLong(request.getParameter("cedula_odontologo"));
        String nombre = request.getParameter("nombre_completo");
        String especialidad = request.getParameter("especialidad");
        String correo = request.getParameter("correo");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        // paso 2
        String descripcion = request.getParameter("descripcion");
        
        //Foto
        Part archivoFoto = request.getPart("foto");
        String nombreFoto;
        if (archivoFoto == null || archivoFoto.getSubmittedFileName() == null || archivoFoto.getSubmittedFileName().isEmpty()) {
            nombreFoto = "foto_" + cedula + ".jpg";
        } else {
            String submitted = archivoFoto.getSubmittedFileName();
            // quitar posibles rutas y quedarnos solo con el nombre de archivo
            nombreFoto = submitted.replaceAll(".*[\\\\/]", "");
            // Guardar la foto en disco
            String rutaFotos = request.getServletContext().getRealPath("/perfiles_odontologos/");
            File carpeta = new File(rutaFotos);
            if (!carpeta.exists()) {
                carpeta.mkdirs();
            }
            archivoFoto.write(rutaFotos + File.separator + nombreFoto);
        }

        // Crear objeto odontólogo
        mdOdontologo odo = new mdOdontologo();
        odo.setCedulaOdontologo(cedula);
        odo.setNombreCompleto(nombre);
        odo.setEspecialidad(especialidad);
        odo.setCorreo(correo);

        // Ejecutar registro completo
        ctRegistroAdmin ctrl = new ctRegistroAdmin();
        boolean ok = ctrl.registrarOdontologoCompleto(
                odo, usuario, password, descripcion, nombreFoto
        );

        if (ok) {
            request.setAttribute("mensaje", "Odontólogo registrado exitosamente.");
            request.getRequestDispatcher("/vistas/vs_crear_odontologo.jsp")
                    .forward(request, response);
        } else {
            request.setAttribute("mensaje", "Ocurrió un error al registrar el odontólogo.");
            request.getRequestDispatcher("/vistas/vs_crear_odontologo.jsp")
                    .forward(request, response);
        }
    }


    /* --------------------------- GET functions ------------------------------ */

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String idStr = request.getParameter("id_user");

        int id = 0;
        try { id = Integer.parseInt(idStr); } catch (Exception e) {}

        ctRegistroAdmin ctrl = new ctRegistroAdmin();
        request.setAttribute("listaUsuarios", ctrl.listarUsuarios());

        request.getRequestDispatcher("/vistas/vs_listarUsuariosDROP.jsp").forward(request, response);
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id_user");

        int id = 0;
        try { id = Integer.parseInt(idStr); } catch (Exception e) {}

        ctRegistroAdmin ctrl = new ctRegistroAdmin();
        boolean ok = ctrl.eliminarUsuario(id);

        response.sendRedirect("AdminServlet?accion=listarUsuariosDROP&msg=" + (ok ? "ok" : "error"));
    }

}

