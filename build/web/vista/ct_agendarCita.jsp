<%-- 
    Document   : ct_agendarCita
    Created on : 16/06/2025, 9:41:38 a. m.
    Author     : Anthony
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Agendar Cita</title>
</head>
<body>
    <%
        String idPaciente = request.getParameter("id_paciente");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edad = request.getParameter("edad");
        String telefono = request.getParameter("telefono");
        String fechaNac = request.getParameter("fecha_nac");
        String tieneOS = request.getParameter("tiene_os");
        String tipoSangre = request.getParameter("tipo_sangre");
        String email = request.getParameter("email");
        
        String fechaCita = request.getParameter("fecha_cita");
        String idOdontologo = request.getParameter("id_odontologo");
        String motivo = request.getParameter("motivo");

        ArrayList<String> datosPaciente = new ArrayList<>();
        datosPaciente.add(idPaciente);
        datosPaciente.add(nombre);
        datosPaciente.add(apellido);
        datosPaciente.add(edad);
        datosPaciente.add(telefono);
        datosPaciente.add(fechaNac);
        datosPaciente.add(tieneOS);
        datosPaciente.add(tipoSangre);
        datosPaciente.add(email);

        ArrayList<String> datosCita = new ArrayList<>();
        datosCita.add(idPaciente);
        datosCita.add(idOdontologo);
        datosCita.add(fechaCita);
        datosCita.add(motivo);

        session.setAttribute("datosPaciente", datosPaciente);
        session.setAttribute("datosCita", datosCita);
        
        // Si es menor de edad, agregar datos del responsable
        if (Integer.parseInt(edad) < 18) {
            String cdResp = request.getParameter("cedula_responsable");
            String edadResp = request.getParameter("edad_resp");
            String nombreResp = request.getParameter("nombre_resp");
            String apellidoResp = request.getParameter("apellido_resp");
            String telefonoResp = request.getParameter("telefono_resp");
            String fechaNacResp = request.getParameter("fecha_nac_resp");
            String emailResp = request.getParameter("email_resp");
            String tipoRelacion = request.getParameter("tipo_resp");

            ArrayList<String> datosResponsable = new ArrayList<>();
            datosResponsable.add(cdResp);
            datosResponsable.add(nombreResp);
            datosResponsable.add(apellidoResp);
            datosResponsable.add(edadResp);
            datosResponsable.add(telefonoResp);
            datosResponsable.add(fechaNacResp);
            datosResponsable.add(emailResp);
            datosResponsable.add(tipoRelacion); 

            session.setAttribute("datosResponsable", datosResponsable);
        }
    
    out.print("<script>location.href='../modelo/md_agendarCita.jsp';</script>");
    
    %>
</body>
</html>
