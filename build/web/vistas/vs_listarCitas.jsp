<%@page import="java.util.ArrayList"%>
<%-- 
    ? vs_listarCitas.jsp
    Vista encargada de mostrar en una tabla las citas obtenidas desde el controlador.

    ? Este JSP NO accede directamente a la base de datos.
    ? Recibe la lista de citas como atributo del request ("listaCitas"),
       que fue enviada por el Servlet (SecreServlet) tras ejecutar ctSecre.listarCitas().
--%>

<table border="1">
    <tr>
        <th>ID Cita</th>
        <th>Paciente</th>
        <th>Odontólogo</th>
        <th>Fecha</th>
        <th>Acciones</th>
    </tr>

    <%
        // ? Recupera la lista de citas que el servlet colocó en el request
        // En el servlet: request.setAttribute("listaCitas", citas);
        ArrayList<String> citas = (ArrayList<String>) request.getAttribute("listaCitas");

        // ? Verifica si existe la lista (puede ser null si no hay resultados)
        if (citas != null) {

            // ? Recorre cada elemento de la lista
            // Cada elemento es una cadena separada por comas: "id, paciente, odontologo, fecha"
            for (String fila : citas) {

                // ? Divide esa cadena en partes usando la coma como separador
                String[] datos = fila.split(",");
    %>
                <tr>
                    <%-- Muestra cada dato en una columna de la tabla --%>
                    <td><%= datos[0] %></td>  <%-- ID Cita --%>
                    <td><%= datos[1] %></td>  <%-- Paciente --%>
                    <td><%= datos[2] %></td>  <%-- Odontólogo --%>
                    <td><%= datos[3] %></td>  <%-- Fecha --%>

                    <%-- Columna con un enlace de acción para eliminar la cita --%>
                    <td>
                        <%-- 
                            Este enlace llama nuevamente al Servlet (controlador)
                            y le pasa:
                            - op=eliminarCita ? indica la operación a realizar
                            - idCita=valor ? identifica qué cita eliminar
                        --%>
                        <a href="${pageContext.request.contextPath}/ctSecre?op=eliminarCita&idCita=<%= datos[0] %>">Eliminar</a>
                    </td>
                </tr>
    <%
            }
        } else {
            // ? Si no hay citas registradas, muestra un mensaje informativo
    %>
        <tr><td colspan="5">No hay citas registradas</td></tr>
    <%
        }
    %>
</table>

<br>

<%-- Enlace para regresar al menú principal del secretario --%>
<a href="${pageContext.request.contextPath}/vistas/vs_menuSecre.jsp">Volver al menú</a>
