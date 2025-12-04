<%-- 
    Document   : vs_listarCitasPaciente
    Created on : 29/10/2025, 10:01:40 p. m.
    Author     : Anthony
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.mdCita" %>
<!DOCTYPE html>
<!-- Vista que muestra el listado de las citas para el paciente que se encuentre logueado -->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Citas</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
    <style>
        /* Contenedor más amplio para tablas */
        .container {
            width: 95%;
            max-width: 1200px;
        }

        /* Título con emoji */
        h2 {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
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
            vertical-align: middle;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tbody tr:hover {
            background: #f7fafc;
            transition: background 0.2s ease;
        }

        /* Columna de acciones */
        td:last-child {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            border-bottom: none;
        }

        /* Botones de acción */
        .btn-edit,
        .btn-delete {
            display: inline-block;
            padding: 8px 16px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.9em;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .btn-edit {
            background: linear-gradient(135deg, #647CF5 0%, #73A6F2 100%);
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(100, 124, 245, 0.3);
        }

        .btn-delete {
            background: linear-gradient(135deg, #f56565 0%, #fc8181 100%);
        }

        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(245, 101, 101, 0.3);
        }

        /* Texto de no disponible */
        .no-disponible {
            color: #a0aec0;
            font-style: italic;
            font-weight: 500;
            text-align: center;
        }

        /* Mensaje de sin citas */
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

        /* Contenedor de botones */
        .button-container {
            text-align: center;
            margin-top: 25px;
        }

        /* Botón volver personalizado */
        .btn-volver {
            display: inline-block;
            padding: 14px 28px;
            background: linear-gradient(135deg, #718096 0%, #a0aec0 100%);
            color: white;
            text-decoration: none;
            border-radius: 14px;
            font-weight: 600;
            font-size: 1em;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(113, 128, 150, 0.2);
        }

        .btn-volver:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(113, 128, 150, 0.3);
            background: linear-gradient(135deg, #a0aec0 0%, #718096 100%);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                width: 98%;
                padding: 20px 16px;
            }

            table {
                font-size: 0.85em;
            }

            th, td {
                padding: 10px 8px;
            }

            .table-container {
                padding: 18px;
            }

            td:last-child {
                flex-direction: column;
            }

            .btn-edit,
            .btn-delete {
                width: 100%;
            }
        }

        @media (max-width: 600px) {
            th {
                font-size: 0.8em;
                padding: 12px 6px;
            }

            td {
                font-size: 0.85em;
                padding: 10px 6px;
            }

            .btn-edit,
            .btn-delete {
                padding: 6px 12px;
                font-size: 0.85em;
            }
        }
    </style>
</head>
<body>
    <div id="img-fondo"></div>
    
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
        
        <h2>🗓 Mis Citas Agendadas</h2>
        
        <!-- Mostrar mensajes de estado -->
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
        %>
            <div class="<%= mensaje.contains("Error") ? "error" : "mensaje" %>">
                <%= mensaje %>
            </div>
        <% } %>
        
        <!-- Tabla de citas -->
        <%
            List<mdCita> lista = (List<mdCita>) request.getAttribute("listaCitas");
            if (lista != null && !lista.isEmpty()) {
        %>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID Cita</th>
                            <th>Odontólogo</th>
                            <th>Fecha y Hora</th>
                            <th>Motivo</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (mdCita c : lista) { %>
                            <tr>
                                <td><%= c.getIdCita()%></td>
                                <td><%= c.getNombreOdontologo()%></td>
                                <td><%= c.getFechaCita()%></td>
                                <td><%= c.getMotivo() %></td>
                                <td><%= c.getEstado() %></td>
                                <td>
                                    <% if (!"ATENDIDA".equalsIgnoreCase(c.getEstado())) { %>
                                        <a href="${pageContext.request.contextPath}/CitaServlet?accion=editar&id=<%= c.getIdCita() %>" class="btn-edit">Editar</a>
                                        <a href="${pageContext.request.contextPath}/CitaServlet?accion=eliminar&id=<%= c.getIdCita() %>"
                                           onclick="return confirm('¿Seguro que deseas eliminar esta cita?');" class="btn-delete">Eliminar</a>
                                    <% } else { %>
                                        <span class="no-disponible">No disponible</span>
                                    <% } %>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <div class="no-results">
                No tienes citas agendadas actualmente.
            </div>
        <% } %>
        
        <div class="button-container">
            <!-- Boton para volver al menu-->
            <a href="${pageContext.request.contextPath}/vistas/vs_menuPaciente.jsp" class="btn-volver">Volver al Menú</a>
        </div>
    </div>
</body>
</html>