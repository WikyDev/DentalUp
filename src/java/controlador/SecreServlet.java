/*
 * Este servlet actúa como el "controlador" para el módulo del secretario.
 * Recibe las solicitudes (GET o POST) desde las vistas JSP, 
 * decide qué operación realizar (listar, buscar o eliminar citas),
 * llama a la clase lógica (ctSecre), 
 * y redirige la respuesta hacia la vista correspondiente.
 */
package controlador;

// Importa las clases necesarias del API de servlets
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

// Anotación que define la URL que activará este servlet
// Por ejemplo: http://localhost:8080/tuApp/ctSecre
@WebServlet("/ctSecre")
public class SecreServlet extends HttpServlet {

    // Método principal que responde a las peticiones GET (desde enlaces o formularios con method="get")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtiene el parámetro "op" de la URL, que indica qué acción se debe ejecutar
        // Ejemplo: /ctSecre?op=listarCitas
        String op = request.getParameter("op");

        // Se crea un objeto del controlador lógico (ctSecre)
        // Este controlador contiene los métodos para interactuar con la base de datos
        ctSecre secreCtrl = new ctSecre();

        // Objeto usado para redirigir a una vista JSP
        RequestDispatcher rd;

        // Si no se envió ningún parámetro "op", por defecto se va al menú
        if (op == null) op = "menu";

        // Estructura switch que evalúa la acción solicitada
        switch (op) {

            // 🔹 Caso 1: Listar todas las citas
            case "listarCitas":
                // Llama al método del controlador que consulta todas las citas
                ArrayList<String> citas = secreCtrl.listarCitas();

                // Guarda la lista obtenida como atributo de la solicitud
                // (para que pueda ser accedida desde el JSP con request.getAttribute)
                request.setAttribute("listaCitas", citas);

                // Redirige hacia la vista JSP encargada de mostrar las citas
                rd = request.getRequestDispatcher("/vistas/vs_listarCitas.jsp");
                rd.forward(request, response);  // Envía la información a la vista
                break;

            // 🔹 Caso 2: Buscar cita por paciente
            case "buscarCita":
                // Obtiene el ID del paciente desde el formulario o la URL
                String idPaciente = request.getParameter("idPaciente");

                // Llama al método que busca las citas de ese paciente
                ArrayList<String> citasPaciente = secreCtrl.buscarCitasPorPaciente(idPaciente);

                // Envía el resultado a la vista
                request.setAttribute("listaCitas", citasPaciente);
                rd = request.getRequestDispatcher("/vistas/vs_listarCitas.jsp");
                rd.forward(request, response);
                break;

            // 🔹 Caso 3: Eliminar cita
            case "eliminarCita":
                // Toma el id de la cita que se desea eliminar
                String idCita = request.getParameter("idCita");

                // Llama al método que ejecuta el DELETE en la base de datos
                boolean eliminado = secreCtrl.eliminarCita(idCita);

                // Crea un mensaje para mostrar en la vista según el resultado
                if (eliminado) {
                    request.setAttribute("mensaje", "Cita eliminada correctamente");
                } else {
                    request.setAttribute("mensaje", "Error al eliminar la cita");
                }

                // Después de eliminar, se vuelve a listar las citas actualizadas
                ArrayList<String> citasActualizadas = secreCtrl.listarCitas();
                request.setAttribute("listaCitas", citasActualizadas);

                // Manda los datos nuevamente a la vista de listado
                rd = request.getRequestDispatcher("/vistas/vs_listarCitas.jsp");
                rd.forward(request, response);
                break;

            // 🔹 Caso por defecto: redirige al menú principal del secretario
            default:
                rd = request.getRequestDispatcher("/vistas/vs_menuSecre.jsp");
                rd.forward(request, response);
                break;
        }
    }

    // Este método se ejecuta cuando la vista envía datos por POST (formularios)
    // Aquí simplemente redirige al mismo método doGet para manejar ambas formas igual
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

