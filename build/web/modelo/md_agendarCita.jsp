<%-- 
    Document   : md_agendarCita
    Created on : 16/06/2025, 9:28:45 a. m.
    Author     : Anthony
--%>

<%@page import="util.conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Resultado Agendar Cita</title>
</head>
<body>
    <h2>Resultado del Registro</h2>
    <%
try {
    conexion c = new conexion();

    ArrayList datosPaciente = (ArrayList) session.getAttribute("datosPaciente");
    ArrayList datosCita = (ArrayList) session.getAttribute("datosCita");
    ArrayList datosResponsable = (ArrayList) session.getAttribute("datosResponsable");

    // Las columnas deben coincidir exactamente con las que existen en la tabla
    String columnasPaciente = "id_paciente, nombre, apellido, edad, telefono, fecha_nac, tiene_OS, tipo_sangre, email";
    String columnasCita = "id_paciente, id_odontologo, fecha_cita, motivo";
    String columnasResponsable = "cedula_responsable, nombre, apellido, edad, telefono, fecha_nac, email, tipo_relacion"; // ajusta según tu tabla

    boolean exitoPaciente = c.insertar("pacientes", columnasPaciente, datosPaciente);
    boolean exitoResponsable = true;

    if (datosResponsable != null) {
        /*for (int i = 0; i < datosResponsable.size(); i++) {
            out.println("Campo " + i + ": " + datosResponsable.get(i) + "<br>");
        }*/
        exitoResponsable = c.insertar("responsables", columnasResponsable, datosResponsable);
        // ACTUALIZAR PACIENTE CON EL ID DEL RESPONSABLE
        if (exitoResponsable) {
            String cdResponsable = datosResponsable.get(0).toString(); // cedula del responsable
            String idPaciente = datosPaciente.get(0).toString();     // id del paciente
            String sqlUpdate = "UPDATE pacientes SET cedula_responsable = '" + cdResponsable + "' WHERE id_paciente = '" + idPaciente + "'";
        c.st.executeUpdate(sqlUpdate);
    }
    }
    
    boolean exitoCita = c.insertar("citas", columnasCita, datosCita);

    if (exitoPaciente && exitoResponsable  && exitoCita) {
%>
    <h1>✅ Registro Exitoso</h1>
    <p>Los datos fueron guardados correctamente.</p>
<%
    } else {
%>
    <h1>❌ Error al registrar los datos</h1>
    <p>Paciente: <%= exitoPaciente %></p>
    <p>Cita: <%= exitoCita %></p>
    <p>Responsable: <%= exitoResponsable %></p>
<%
    }
} catch (Exception e) {
%>
    <h1>❌ Error al registrar los datos:</h1>
    <p><%= e.getMessage() %></p>
    <pre><%= e %></pre>
<%
}
%>

<a href="../vista/vs_agendarCita.jsp">Regresar</a>
</body>
</html>
