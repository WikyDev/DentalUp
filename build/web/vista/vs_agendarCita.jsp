<%-- 
    Document   : vs_agendarCita
    Created on : 15/05/2025, 11:35:22 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Agendar Cita</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/agendar.css">
    <style>
        .hidden { display: none; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Agendar Nueva Cita</h2>
        <form action="CitaController" method="post">
            <input type="text" name="id_paciente" placeholder="Número de identificación del paciente" required>
            <input type="text" name="edad" placeholder="Edad del paciente" required>
            <input type="text" name="nombre" placeholder="Nombre del paciente" required>
            <input type="text" name="apellido" placeholder="Apellido del paciente" required>
            <input type="text" name="telefono" placeholder="Telefono del paciente" required>
            <input type="text" name="email" placeholder="Ingrese un Email válido" required>
            <i>¿Tiene seguro social?:</i>
            <select name="tiene_os">
                <%-- opciones dinámicas de seguro social --%>
                <option value="1">Sí</option>
                <option value="2">No</option>
            </select>
            <i>Fecha de nacimiento:</i>
            <input type="date" name="fecha_nac" placeholder="Fecha de nacimiento" required>
            <i>Seleccione la fecha y hora de la cita:</i>
            <input type="datetime-local" name="fecha_cita" required>
            <i>Seleccione el tipo de sangre:</i>
            <select name="tipo_sangre">
                <%-- opciones dinámicas de tipos de sangre --%>
                <option value="1">A+</option>
                <option value="2">A-</option>
                <option value="3">B+</option>
                <option value="4">B-</option>
                <option value="5">O+</option>
                <option value="6">O-</option>
                <option value="7">AB+</option>
                <option value="8">AB-</option>
            </select>
            <i>Seleccione un odontologo:</i>
            <select name="id_odontologo">
                <%-- opciones dinámicas de odontólogos --%>
                <option value="1">Lucas Hernandes</option>
                <option value="2">María Sanchez</option>
                <option value="3">Carlos Pino</option>
            </select>
            <textarea name="afeccion" placeholder="Afección" required></textarea>
            <button type="submit">Agendar</button>
            <a><b>Si el paciente es menor de edad indique los datos del 
                    responsable en el siguiente formulario↓</b></a>
        </form>
    </div>
    
                <!-- FORMULARIO DEL RESPONSABLE EN CASO DE SER MENOR DE EDAD-->
                <div class="form-container" >
                    <h2>Responsable</h2>
                    <form action="CitaController" method="post">
                        <input type="text" name="id_paciente" placeholder="Número de identificación del responsable" required>
                        <input type="text" name="edad" placeholder="Edad del responsable" required>
                        <input type="text" name="nombre" placeholder="Nombre del responsable" required>
                        <input type="text" name="apellido" placeholder="Apellido del responsable" required>
                        <input type="text" name="telefono" placeholder="Telefono del responsable" required>
                        <i>Fecha de nacimiento:</i>
                        <input type="date" name="fecha_nac" placeholder="Fecha de nacimiento" required>
                        <input type="text" name="email" placeholder="Ingrese un Email válido" required>
                        <i>Seleccione el tipo de relación del responsable:</i>
                        <select name="tipo_resp">
                            <%-- opciones dinámicas de familiares --%>
                            <option value="1">Padre</option>
                            <option value="2">Madre</option>
                            <option value="3">Hermano/a</option>
                            <option value="4">Tío/a</option>
                            <option value="5">Padrino/Madrina</option>
                        </select>
                        <button type="submit">Ingresar</button>
                    </form>
                </div>
                
                
</body>
</html>
