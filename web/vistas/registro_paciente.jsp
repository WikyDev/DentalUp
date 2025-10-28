<%-- 
    Document   : registro_paciente
    Created on : 28/10/2025, 11:25:45?a. m.
    Author     : WikyLix
--%>

<form action="${pageContext.request.contextPath}/ctRegistroPaciente" method="post">
    <div class="input-group">
        <input type="text" name="usuario" placeholder="Nombre de usuario" required><br>
    </div>
    <div class="input-group">
        <input type="password" name="password" placeholder="Contraseña" required><br>
    </div>

    <button type="submit" class="btn-login">Registrar</button>
</form>


