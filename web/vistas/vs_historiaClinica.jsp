<%-- 
    Document   : vs_historiaClinica
    Created on : 14/11/2025, 10:50:22 a. m.
    Author     : Anthony
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.mdHistoriaClinica" %>
<%
    ArrayList<mdHistoriaClinica> listaHistorias = 
        (ArrayList<mdHistoriaClinica>) request.getAttribute("listaHistorias");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Historias Clínicas</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
    <style>
        /* Contenedor más amplio para tablas */
        .container {
            width: 95%;
            max-width: 1200px;
        }

        /* Tabla estilizada */
        .table-container {
            background: rgba(255, 255, 255, 0.98);
            padding: 24px;
            border-radius: 16px;
            margin: 25px 0;
            overflow-x: auto;
            border: 1px solid rgba(255, 255, 255, 0.6);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            animation: fadeInUp 0.6s ease-out 0.1s backwards;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        th {
            background: linear-gradient(135deg, #647CF5 0%, #73A6F2 100%);
            color: white;
            padding: 16px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95em;
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }

        td {
            padding: 14px 12px;
            border-bottom: 1px solid #e2e8f0;
            color: #2d3748;
            font-size: 0.95em;
            vertical-align: top;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tbody tr:hover {
            background: #f7fafc;
            transition: background 0.2s ease;
        }
        
        /* Boton de acción */
        .btn-ds {
            display: inline-block;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .btn-ds {
            background: linear-gradient(135deg, #f56565 0%, #fc8181 100%);
        }

        .btn-ds:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(100, 124, 245, 0.3);
        }

        /* Mensaje de no encontrado */
        .no-results {
            background: rgba(255, 255, 255, 0.95);
            color: #718096;
            padding: 30px;
            border-radius: 16px;
            border: 2px dashed #e2e8f0;
            margin: 25px 0;
            text-align: center;
            font-size: 1.05em;
            animation: fadeInUp 0.5s ease-out;
        }
    </style>
</head>
<body>
    <div id="img-fondo"></div>
    
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
        
        <h2>Mis Historias Clínicas</h2>
        
        <!-- Mensajes -->
        <% if (request.getAttribute("mensaje") != null) { %>
            <div class="mensaje">
                <%= request.getAttribute("mensaje") %>
            </div>
        <% } %>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <!-- Verificar si hay historias -->
        <% if (listaHistorias == null || listaHistorias.isEmpty()) { %>
            <div class="no-results">
                No se encontraron historias clínicas registradas.
            </div>
        <% } else { %>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Fecha de Registro</th>
                            <th>Diagnóstico</th>
                            <th>Tratamiento</th>
                            <th>Observaciones</th>
                            <th>Odontólogo</th>
                            <th>PDF</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <% for (mdHistoriaClinica h : listaHistorias) {%>
                        <tr>
                            <td><%= h.getIdHistoria()%></td>
                            <td><%= h.getFecha()%></td>
                            <td><%= h.getDiagnostico()%></td>
                            <td><%= h.getTratamiento()%></td>
                            <td><%= h.getObservaciones()%></td>
                            <td><%= h.getNombreOdontologo()%></td>
                            <td><a 
                                    href="HistoriaServlet?accion=pdf&id_historia=<%= h.getIdHistoria()%>" 
                                    class="btn-ds"
                                    style="padding:6px 10px; font-size:0.9em;"
                                    >
                                    Descargar PDF
                                </a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
        
        <a href="${pageContext.request.contextPath}/vistas/vs_menuPaciente.jsp" class="btn">Volver al menú</a>
    </div>
</body>
</html>