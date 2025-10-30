<%-- 
    Document   : vs_registro_paciente
    Created on : 28/10/2025, 11:25:45?a. m.
    Author     : WikyLix

    Reacondicionado: Anthony
    Se agregó HTML y se formuló de manera distanta dado que ahora envia los datos asia las 
    tablas usuario y pacientes, por la relación que estas tienen 
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Paciente</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/registro.css">

</head>
<body>
    <div class="form-container">
        <h2>Registro de Paciente</h2>

        <% String mensaje = (String) request.getAttribute("mensaje");
           if (mensaje != null) { %>
            <p><%= mensaje %></p>
        <% } %>

        <!-- Formulario que pide los datos necesarios para almacenar un paciente -->
        <form action="../RegistroPacienteServlet" method="post">
            <label>Usuario:</label>
            <input type="text" name="usuario" placeholder="Cree nombre de usuario" required >

            <label>Contraseña:</label>
            <input type="password" name="password" placeholder="Cree una contraseña" required>

            <label>Nombre:</label>
            <input type="text" name="nombre" required>

            <label>Apellido:</label>
            <input type="text" name="apellido" required>

            <label>Edad:</label>
            <input type="number" name="edad" required>

            <label>Teléfono:</label>
            <input type="text" name="telefono" required>

            <label>Fecha de nacimiento:</label>
            <input type="date" name="fecha_nac" required>

            <label>¿Tiene seguro social?</label>
            <select name="tiene_os" required>
                <option value="SI">Sí</option>
                <option value="NO">No</option>
            </select>

            <label>Tipo de sangre:</label>
            <select name="tipo_sangre" required>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select>

            <label>Email:</label>
            <input type="email" name="email" required>

            <button type="submit" class="btn">Registrar</button>
            <a href="logout.jsp" class="btn" style="background:#ccc;">Volver</a>
        </form>
    </div>
</body>
</html>



