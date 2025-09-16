<%-- 
    Document   : ct_agenda
    Created on : 16/05/2025, 2:31:10 p. m.
    Author     : Anthony
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Controlador Agenda</title>
</head>
<body>
<%
    String id_paciente = request.getParameter("id_paciente");
    String edadPac = request.getParameter("edad");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fecha_cita = request.getParameter("fecha_cita");
    String id_odontologo = request.getParameter("id_odontologo");
    String afeccion = request.getParameter("afeccion");
    String responsable = request.getParameter("responsable");

    int edad = 0;
    boolean error = false;

    try {
        edad = Integer.parseInt(edadPac);
    } catch (NumberFormatException e) {
        error = true;
        out.print("<script>alert('Edad inválida'); history.back();</script>");
    }

    if (!error && edad < 18 && (responsable == null || responsable.trim().isEmpty())) {
        error = true;
        out.print("<script>alert('Si el paciente es menor de edad, se requiere el nombre del responsable.'); history.back();</script>");
    }

    if (!error) {
        ArrayList datos = new ArrayList<String>();
        datos.add(id_paciente);
        datos.add(edadPac);
        datos.add(nombre);
        datos.add(apellido);
        datos.add(fecha_cita);
        datos.add(id_odontologo);
        datos.add(afeccion);
        datos.add(responsable != null ? responsable : ""); // Evitar null

        session.setAttribute("datosCita", datos);
        out.print("<script>location.href='../modelo/md_agendar.jsp';</script>");
    }
%>
</body>
</html>
