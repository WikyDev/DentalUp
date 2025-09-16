<%-- 
    Document   : vs_consultaHistoria
    Created on : 15/05/2025, 11:34:47 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Historias Clínicas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/consul_hist.css">
</head>
<body>
    <h1>Historias Clínicas</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Paciente</th>
                <th>Fecha</th>
                <th>Resumen</th>
            </tr>
        </thead>
        <tbody>
            <%-- Aquí se itera la lista de historias con JSTL o scriptlet --%>
        </tbody>
    </table>
</body>
</html>
