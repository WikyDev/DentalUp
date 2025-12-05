<%-- 
    Document   : vs_citasOdontologo
    Created on : 14/11/2025, 11:07:40 a. m.
    Author     : Anthony
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.mdCita" %>
<%
    List<mdCita> lista = (List<mdCita>) request.getAttribute("listaCitas");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Citas del Odontólogo</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
    <style>
        /* Estilos adicionales para la tabla */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: white;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        table th {
            background: linear-gradient(135deg, #647CF5 0%, #73A6F2 100%);
            color: white;
            padding: 14px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95em;
        }
        
        table td {
            padding: 12px 14px;
            border-bottom: 1px solid #e2e8f0;
            color: #2d3748;
            font-size: 0.95em;
        }
        
        table tr:last-child td {
            border-bottom: none;
        }
        
        table tr:hover {
            background: #f7fafc;
        }
        
        table a {
            color: #647CF5;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
            padding: 8px 16px;
            background: #f0f4ff;
            border-radius: 8px;
            display: inline-block;
        }
        
        table a:hover {
            color: #73A6F2;
            background: #e0e8ff;
        }
        
        .msg-success {
            color: #2c7a7b;
            background: #e6fffa;
            border: 2px solid #81e6d9;
            font-size: 0.95em;
            text-align: center;
            margin-bottom: 18px;
            padding: 14px 18px;
            border-radius: 12px;
            font-weight: 600;
            animation: slideDown 0.4s ease-out;
        }
        
        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .no-data {
            text-align: center;
            padding: 20px;
            color: #718096;
            font-size: 1em;
        }
    </style>
</head>
<body>
<div id="img-fondo"></div>
<div class="container">
    <div class="logo-container">
        <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
    </div>
    <h2>Mis Citas</h2>
    <!-- mensaje de exito cuando una historia clinica haya sido registrada -->
    <% if ("ok".equals(request.getParameter("msg"))) { %>
        <p class="msg-success">✔ Historia clínica registrada y cita marcada como atendida.</p>
    <% } %>
    <% if (lista == null || lista.isEmpty()) { %>
        <p class="no-data">No hay citas registradas.</p>
    <% } else { %>
    <table>
        <thead>
            <tr>
                <th>Fecha y Hora</th>
                <th>Paciente</th>
                <th>Motivo</th>
                <th>Estado</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
        <% for (mdCita c : lista) { %>
            <tr>
                <td><%= c.getFechaCita() %></td>
                <td><%= c.getNombrePaciente() %></td> 
                <td><%= c.getMotivo() %></td>
                <td>
                    <% if (mdCita.ESTADO_ATENDIDA.equalsIgnoreCase(c.getEstado())){ %>
                        Atendida
                    <% }else{ %>
                        Pendiente
                    <%  } %>
                </td>
                <td>
                    <% if (mdCita.ESTADO_PENDIENTE.equalsIgnoreCase(c.getEstado())) { %>
                    <a href="${pageContext.request.contextPath}/HistoriaServlet?accion=cargarDesdeCita&id_cita=<%= c.getIdCita() %>&cedula_paciente=<%= c.getCedulaPaciente()%>&cedula_odontologo=<%= c.getCedulaOdontologo()%>&fecha=<%= java.net.URLEncoder.encode(c.getFechaCita(), "UTF-8")%>&motivo=<%= java.net.URLEncoder.encode(c.getMotivo(), "UTF-8")%>">
                        Registrar Historia
                    </a>
                    <% } else { %>
                    <span style="color:green; font-weight:bold; ">Finalizada</span>
                    <% } %>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <% } %>
    <br>
    <a href="${pageContext.request.contextPath}/vistas/vs_menuOdonto.jsp" class="btn">Volver al Menú</a>
</div>
</body>
</html>