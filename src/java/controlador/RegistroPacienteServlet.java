package controlador;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/ctRegistroPaciente")
public class RegistroPacienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        ctRegistroPaciente registroCtrl = new ctRegistroPaciente();
        boolean exito = registroCtrl.registrarPaciente(usuario, password);

        if (exito) {
            response.sendRedirect("vistas/vs_login.jsp?registro=ok");
        } else {
            request.setAttribute("mensajeError", "Error al registrar el paciente.");
            RequestDispatcher rd = request.getRequestDispatcher("vistas/vs_registro_paciente.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("vistas/vs_registro_paciente.jsp");
        rd.forward(request, response);
    }
}