<%-- 
    Document   : vs_listarUsuariosDROP
    Created on : 29/11/2025, 4:09:57 p. m.
    Author     : Anthony
--%>

<%@ page import="java.util.*, modelo.mdUsuarios" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Usuarios</title>
    <script>
        function confirmarEliminacion() {
            return confirm("¿Estás seguro de eliminar este usuario? Esta acción es irreversible y borrará toda su información asociada.");
        }
    </script>
</head>
<body>

<h2>Lista de Usuarios</h2>

<form method="GET" action="<%=request.getContextPath()%>/AdminServlet">
    <input type="hidden" name="accion" value="listarUsuarios">

    <label>Filtrar por rol:</label>
    <select name="rol">
        <% 
            String filtroActual = (String) request.getAttribute("filtroActual");
            if(filtroActual == null) filtroActual = "todos";
        %>

        <option value="todos" <%= filtroActual.equals("todos") ? "selected" : "" %>>Todos</option>
        <option value="admin" <%= filtroActual.equals("admin") ? "selected" : "" %>>Administrador</option>
        <option value="secretario" <%= filtroActual.equals("secretario") ? "selected" : "" %>>Secretario</option>
        <option value="odontologo" <%= filtroActual.equals("odontologo") ? "selected" : "" %>>Odontólogo</option>
        <option value="paciente" <%= filtroActual.equals("paciente") ? "selected" : "" %>>Paciente</option>
    </select>

    <button type="submit">Buscar</button>
</form>

<br>

<%
    String msg = request.getParameter("msg");
    String err = request.getParameter("error");
%>

<!-- Mensajes -->
<% if (msg != null) { %>
    <div class="msg-ok"><%= msg %></div>
<% } %>

<% if (err != null) { %>
    <div class="msg-error"><%= err %></div>
<% } %>

<%
    List<mdUsuarios> lista = (List<mdUsuarios>) request.getAttribute("listaUsuarios");
%>

<table border="1" cellpadding="6">
    <tr>
        <th>ID user</th>
        <th>Nombre usuario</th>
        <th>Rol</th>
        <th>Acciones</th>
    </tr>

<%
    if (lista != null && !lista.isEmpty()) {

        for (mdUsuarios u : lista) {
%>
            <tr>
                <td><%= u.getId_user() %></td>
                <td><%= u.getNombre_user()%></td>
                <td><%= u.getRol() %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/AdminServlet?accion=eliminarUsuario&id_user=<%= u.getId_user() %>"
                       onclick="return confirmarEliminacion();">
                        Eliminar
                    </a>
                </td>
            </tr>
<%
        }

    } else {
%>
        <tr>
            <td colspan="4">No hay usuarios registrados.</td>
        </tr>
<%
    }
%>

</table>

<br>
<a href="<%= request.getContextPath() %>/vistas/vs_menuAdmin.jsp">Volver al menú</a>

</body>
</html>
