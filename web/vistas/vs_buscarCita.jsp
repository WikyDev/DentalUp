<%@ page import="controlador.ControladorSecre, java.util.ArrayList" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String idPaciente = request.getParameter("id_paciente");
        ControladorSecre ctrl = new ControladorSecre();
        ArrayList<String> resultado = ctrl.buscarCitasPorPaciente(idPaciente);
        request.setAttribute("resultadoBuscar", resultado);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Buscar Cita</title>
</head>
<body>
    <h2>Buscar cita por ID</h2>

    <form method="get">
        <input type="number" name="id_cita" required placeholder="ID de cita">
        <button type="submit">Buscar</button>
    </form>

    
        <h3>Resultado:</h3>
        <p><b>Paciente:</b> </p>
        <p><b>Odontólogo:</b> </p>
        <p><b>Fecha:</b> </p>
        <p><b>Motivo:</b> </p>
    
        <p style="color:red;">No se encontró una cita con ese ID.</p>
    
        <p style="color:red;">Error: </p>
    
    
    <div>
        <br>
        <a href="/vista/vs_menuSecre.jsp">Volver al menú</a>
    </div>
</body>
</html>
