<%@page import="java.util.ArrayList"%>
<%-- 
    ? vs_listarCitas.jsp
    Vista encargada de mostrar en una tabla las citas obtenidas desde el controlador.
    ? Este JSP NO accede directamente a la base de datos.
    ? Recibe la lista de citas como atributo del request ("listaCitas"),
       que fue enviada por el Servlet (SecreServlet) tras ejecutar ctSecre.listarCitas().
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Citas</title>
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
            vertical-align: middle;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tbody tr:hover {
            background: #f7fafc;
            transition: background 0.2s ease;
        }

        /* Botón eliminar */
        .btn-delete {
            display: inline-block;
            padding: 8px 16px;
            background: linear-gradient(135deg, #f56565 0%, #fc8181 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.9em;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(245, 101, 101, 0.2);
        }

        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(245, 101, 101, 0.3);
        }

        /* Mensaje de sin citas */
        .no-results {
            text-align: center;
            padding: 20px;
            color: #718096;
            font-style: italic;
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
        
        <h2>Listado de Citas</h2>
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID Cita</th>
                        <th>Paciente</th>
                        <th>Odontólogo</th>
                        <th>Fecha</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // ? Recupera la lista de citas que el servlet colocó en el request
                        // En el servlet: request.setAttribute("listaCitas", citas);
                        ArrayList<String> citas = (ArrayList<String>) request.getAttribute("listaCitas");
                        // ? Verifica si existe la lista (puede ser null si no hay resultados)
                        if (citas != null) {
                            // ? Recorre cada elemento de la lista
                            // Cada elemento es una cadena separada por comas: "id, paciente, odontologo, fecha"
                            for (String fila : citas) {
                                // ? Divide esa cadena en partes usando la coma como separador
                                String[] datos = fila.split(",");
                    %>
                                <tr>
                                    <%-- Muestra cada dato en una columna de la tabla --%>
                                    <td><%= datos[0] %></td>  <%-- ID Cita --%>
                                    <td><%= datos[1] %></td>  <%-- Paciente --%>
                                    <td><%= datos[2] %></td>  <%-- Odontólogo --%>
                                    <td><%= datos[3] %></td>  <%-- Fecha --%>
                                    <%-- Columna con un enlace de acción para eliminar la cita --%>
                                    <td>
                                        <%-- 
                                            Este enlace llama nuevamente al Servlet (controlador)
                                            y le pasa:
                                            - op=eliminarCita ? indica la operación a realizar
                                            - idCita=valor ? identifica qué cita eliminar
                                        --%>
                                        <a href="${pageContext.request.contextPath}/ctSecre?op=eliminarCita&idCita=<%= datos[0] %>" class="btn-delete">Eliminar</a>
                                    </td>
                                </tr>
                    <%
                            }
                        } else {
                            // ? Si no hay citas registradas, muestra un mensaje informativo
                    %>
                        <tr>
                            <td colspan="5" class="no-results">No hay citas registradas</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        
        <%-- Enlace para regresar al menú principal del secretario --%>
        <a href="${pageContext.request.contextPath}/vistas/vs_menuSecre.jsp" class="btn">Volver al menú</a>
    </div>
</body>
</html>