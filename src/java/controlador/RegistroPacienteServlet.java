package controlador;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import modelo.mdPaciente;
/*
 * Este servlet actúa como el intermediario entre la
   clase logica (ctRegistroPaciente) y la vista JSP (vs_registro_paciente)
 * Recibe las solicitudes (POST) desde las vistas JSP, 
 * decide qué operación realizar (CRUD),
 * y redirige la respuesta hacia la vista correspondiente.
 */
@WebServlet("/RegistroPacienteServlet")
public class RegistroPacienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Parámetros desde el formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edadStr = request.getParameter("edad");
        String telefono = request.getParameter("telefono");
        String fecha_nac = request.getParameter("fecha_nac");
        String tiene_os = request.getParameter("tiene_OS");
        String tipo_sangre = request.getParameter("tipo_sangre");
        String email = request.getParameter("email");
        String nombre_user = request.getParameter("usuario");
        String password = request.getParameter("password");

        int edad = 0;
        try {
            edad = Integer.parseInt(edadStr);
        } catch (Exception e) {
            edad = 0;
        }

        // Crear el objeto paciente (modelo)
        mdPaciente paciente = new mdPaciente();
        paciente.setNombre(nombre);
        paciente.setApellido(apellido);
        paciente.setEdad(edad);
        paciente.setTelefono(telefono);
        paciente.setFechaNac(fecha_nac);
        paciente.setTieneOS(tiene_os);
        paciente.setTipoSangre(tipo_sangre);
        paciente.setEmail(email);

        // Controlador lógico
        ctRegistroPaciente ctrl = new ctRegistroPaciente();
        boolean ok = ctrl.registrarPaciente(paciente, nombre_user, password);

        if (ok) {
            request.setAttribute("mensaje", "✅ Registro exitoso. Ya puedes iniciar sesión.");
        } else {
            request.setAttribute("mensaje", "❌ Error al registrar al paciente.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/vistas/vs_registro_paciente.jsp");
        rd.forward(request, response);
    }
}