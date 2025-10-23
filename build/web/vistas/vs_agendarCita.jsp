<%@ page import="modelo.Paciente, modelo.Responsable, modelo.Cita, controlador.ControladorAgendarCita" %>
<%-- Procesamiento mínimo al enviar el formulario: crea objetos y llama al controlador --%>
<%
    String _method = request.getMethod();
    if ("POST".equalsIgnoreCase(_method)) {
        // leer parámetros
        String id_paciente = request.getParameter("id_paciente");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edad_s = request.getParameter("edad");
        int edad = 0;
        try { edad = Integer.parseInt(edad_s); } catch(Exception e){}
        String telefono = request.getParameter("telefono");
        String fecha_nac = request.getParameter("fecha_nac");
        String tiene_os = request.getParameter("tiene_os");
        String tipo_sangre = request.getParameter("tipo_sangre");
        String email = request.getParameter("email");

        String fecha_cita = request.getParameter("fecha_cita");
        String id_odontologo = request.getParameter("id_odontologo");
        String motivo = request.getParameter("motivo");

        // crear objetos modelo
        Paciente p = new Paciente(id_paciente, nombre, apellido, edad, telefono, fecha_nac, tiene_os, tipo_sangre, email, null);
        Responsable r = null;
        if (edad < 18) {
            String cedula_resp = request.getParameter("cedula_responsable");
            if (cedula_resp != null && !cedula_resp.isEmpty()) {
                r = new Responsable(cedula_resp, request.getParameter("nombre_resp"), request.getParameter("apellido_resp"),
                                   Integer.parseInt(request.getParameter("edad_resp")==null? "0": request.getParameter("edad_resp")),
                                   request.getParameter("telefono_resp"), request.getParameter("fecha_nac_resp"),
                                   request.getParameter("email_resp"), request.getParameter("tipo_resp"));
            }
        }
        Cita cita = new Cita(id_paciente, id_odontologo, fecha_cita, motivo);

        ControladorAgendarCita ctrl = new ControladorAgendarCita();
        boolean ok = ctrl.registrarCita(p, r, cita);
        request.setAttribute("mensaje", ok? "Cita registrada correctamente":"Error al registrar la cita");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Agendar Cita</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/agendar.css">
</head>
<body>
    <div class="form-container" style=" border: 1px solid #ccc; padding: 10px; margin-top: 10px;">
        <h3>Agendar Nueva Cita</h3>
        <form action="/control/ct_agendarCita.jsp" method="post">
            <label>Número de identificación del paciente:</label>
            <input type="text" name="id_paciente" required><br>
            <label>Edad del paciente:</label>
            <input type="number" name="edad" id="edadPaciente" required><br>
            <label>Nombre del paciente:</label>
            <input type="text" name="nombre" required><br>
            <label>Apellido del paciente:</label>
            <input type="text" name="apellido" required><br>
            <label>Telefono del paciente:</label>
            <input type="text" name="telefono" required><br>
            <label>Email del paciente:</label>
            <input type="email" name="email" required><br>
            <label>¿Tiene seguro social?:</label>
            <select name="tiene_os">
                
                <option value="SI">Sí</option>
                <option value="NO">No</option>
            </select><br>
            <label>Fecha de nacimiento:</label>
            <input type="date" name="fecha_nac" required><br>
            <label>Seleccione la fecha y hora de la cita:</label>
            <input type="datetime-local" name="fecha_cita" required><br>
            <label>Seleccione el tipo de sangre:</label>
            <select name="tipo_sangre">
                
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select><br>
            <label>Seleccione un odontologo:</label>
            <select name="id_odontologo">
            
                <option value=""></option>
            
            </select><br>
            <label>Redacte el motivo de la cita:</label>
            <textarea name="motivo" placeholder="Motivo de la cita" required></textarea>
            <button type="submit">Agendar</button>
            <a><b>Si el paciente es menor de edad indique los datos del 
                    responsable en el siguiente formulario↓</b></a>
        <!--</form>-->
    </div>
                <!-- FORMULARIO DEL RESPONSABLE EN CASO DE SER MENOR DE EDAD-->
                <!-- Formulario del responsable (oculto inicialmente) -->
    <div id="formResponsable" style="display:none; border: 1px solid #ccc; padding: 10px; margin-top: 10px;">
        <h3>Datos del Responsable</h3>
        <label>Cedúla responsable:</label>
        <input type="text" name="cedula_responsable"><br>
        
        <label>Nombre:</label>
        <input type="text" name="nombre_resp"><br>

        <label>Apellido:</label>
        <input type="text" name="apellido_resp"><br>

        <label>Edad:</label>
        <input type="number" name="edad_resp"><br>

        <label>Teléfono:</label>
        <input type="text" name="telefono_resp"><br>

        <label>Fecha de Nacimiento:</label>
        <input type="date" name="fecha_nac_resp"><br>

        <label>Email:</label>
        <input type="email" name="email_resp"><br>

        <label>Tipo de relación:</label>
        <select name="tipo_resp">
            
            <option value="Padre">Padre</option>
            <option value="Madre">Madre</option>
            <option value="Herman@">Hermano/a</option>
            <option value="Tí@">Tío/a</option>
            <option value="Padrino/Madrina">Padrino/Madrina</option>
        </select>
            
        <input type="hidden" name="id_paciente" value="">    

        </div>
</form>
            
            <!-- Script para mostrar/ocultar el formulario del responsable -->
<script>
    document.getElementById("edadPaciente").addEventListener("input", function () {
        const edad = parseInt(this.value);
        const formResponsable = document.getElementById("formResponsable");

        if (!isNaN(edad) && edad < 18) {
            formResponsable.style.display = "block";
        } else {
            formResponsable.style.display = "none";
        }
    });
</script>
                <!--<div class="form-container" >
                    <h2>Responsable</h2>
                    <form action="ct_agendarCita.jsp" method="post">
                        <input type="text" name="id_responsable" placeholder="Número de identificación del responsable" required>
                        <input type="text" name="edad_resp" placeholder="Edad del responsable" required>
                        <input type="text" name="nombre_resp" placeholder="Nombre del responsable" required>
                        <input type="text" name="apellido_resp" placeholder="Apellido del responsable" required>
                        <input type="text" name="telefono_resp" placeholder="Telefono del responsable" required>
                        <i>Fecha de nacimiento:</i>
                        <input type="date" name="fecha_nac_resp" placeholder="Fecha de nacimiento" required>
                        <input type="text" name="email_resp" placeholder="Ingrese un Email válido" required>
                        <i>Seleccione el tipo de relación del responsable:</i>
                        <select name="tipo_resp">
                            
                            <option value="Padre">Padre</option>
                            <option value="Madre">Madre</option>
                            <option value="Herman@">Hermano/a</option>
                            <option value="Tí@">Tío/a</option>
                            <option value="Padrino/Madrina">Padrino/Madrina</option>
                        </select>
                        <input type="text" name="id_paciente" placeholder="Número de identificación del paciente" required>
                    </form>
                </div>  -->    
                            
                            <a href="../vista/vs_inicio.jsp" class="option-card">Regresar</a>                         
</body>
</html>
