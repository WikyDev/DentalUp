<%-- 
    Document   : vs_listarUsuariosDROP
    Created on : 29/11/2025, 4:09:57 p. m.
    Author     : Anthony
--%>
<%@ page import="java.util.*, modelo.mdUsuarios" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Usuarios</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
    <script>
        function confirmarEliminacion() {
            return confirm("¿Estás seguro de eliminar este usuario? Esta acción es irreversible y borrará toda su información asociada.");
        }
    </script>
    <style>
        /* Estilos adicionales para la tabla */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: white;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        table th {
            background: linear-gradient(135deg, #647CF5 0%, #73A6F2 100%);
            color: white;
            padding: 14px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95em;
        }
        
        table td {
            padding: 12px 14px;
            border-bottom: 1px solid #e2e8f0;
            color: #2d3748;
            font-size: 0.95em;
        }
        
        table tr:last-child td {
            border-bottom: none;
        }
        
        table tr:hover {
            background: #f7fafc;
        }
        
        table a {
            color: #647CF5;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        
        table a:hover {
            color: #73A6F2;
            text-decoration: underline;
        }
        
        .msg-ok {
            color: #2c7a7b;
            background: #e6fffa;
            border: 2px solid #81e6d9;
            font-size: 0.95em;
            text-align: center;
            margin-bottom: 18px;
            padding: 14px 18px;
            border-radius: 12px;
            font-weight: 600;
            animation: slideDown 0.4s ease-out;
        }
        
        .msg-error {
            color: #c53030;
            background: #fff5f5;
            border: 2px solid #fc8181;
            font-size: 0.95em;
            text-align: center;
            margin-bottom: 18px;
            padding: 14px 18px;
            border-radius: 12px;
            font-weight: 600;
            animation: slideDown 0.4s ease-out;
        }
        
        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div id="img-fondo"></div>
      <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
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
            <button type="submit" class="btn">Buscar</button>
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
        <table>
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
        <a href="<%= request.getContextPath() %>/vistas/vs_menuAdmin.jsp" class="btn">Volver al menú</a>
    </div>    
</body>
</html>