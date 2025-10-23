<%@ page import="controlador.ControladorSecre, java.util.ArrayList" %>
<%
    ControladorSecre ctrl = new ControladorSecre();
    ArrayList<String> citas = ctrl.listarCitas();
    request.setAttribute("listaCitas", citas);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Citas Agendadas</title>
</head>
<body>
    <h2>Listado de todas las citas</h2>
    <table border="1">
        <tr>
            <th>ID Cita</th>
            <th>Paciente</th>
            <th>Odontólogo</th>
            <th>Fecha</th>
            <th>Motivo</th>
        </tr>
        
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        
    </table>
    
    <div>
        <br>
        <a href="/vista/vs_menuSecre.jsp">Volver al menú</a>
    </div>
</body>
</html>
