<%-- 
    Document   : vs_historiaClinicaOdontologo
    Author     : Jhoon
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.mdHistoriaClinica" %>
<%
    // Recuperar atributos del controlador
    ArrayList<mdHistoriaClinica> lista = 
        (ArrayList<mdHistoriaClinica>) request.getAttribute("listaHistorias");
    mdHistoriaClinica seleccionada = 
        (mdHistoriaClinica) request.getAttribute("historiaSeleccionada");
    // ID del paciente enviado desde el servlet
    String idPaciente = (request.getAttribute("cedula_paciente") != null)
            ? request.getAttribute("cedula_paciente").toString()
            : "";
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historia Clínica - Odontólogo</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
    <style>
        /* Contenedor más amplio para tablas */
        .container {
            width: 95%;
            max-width: 800px;
        }

        /* Sección de búsqueda */
        .search-section {
            background: rgba(255, 255, 255, 0.95);
            padding: 22px 26px;
            border-radius: 16px;
            margin-bottom: 28px;
            border: 1px solid rgba(255, 255, 255, 0.6);
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
            animation: fadeInUp 0.5s ease-out;
        }

        .search-section label {
            margin-top: 0;
            color: #2d3748;
        }

        .search-section input {
            margin-bottom: 0;
        }

        .search-section button {
            margin-top: 14px;
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

        .table-container h3 {
            margin: 0 0 20px 0;
            color: #2d3748;
            font-size: 1.4em;
            font-weight: 700;
            padding-bottom: 12px;
            border-bottom: 2px solid #e2e8f0;
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

        tr:hover {
            background: #f7fafc;
            transition: background 0.2s ease;
        }

        /* Enlaces de acción en tabla */
        td a {
            display: inline-block;
            padding: 8px 16px;
            background: linear-gradient(135deg, #647CF5 0%, #73A6F2 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.9em;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(100, 124, 245, 0.2);
        }

        td a:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(100, 124, 245, 0.3);
        }

        /* Formulario de edición */
        .edit-section {
            background: rgba(255, 255, 255, 0.98);
            padding: 28px;
            border-radius: 16px;
            margin: 25px 0;
            border: 1px solid rgba(255, 255, 255, 0.6);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            animation: fadeInUp 0.6s ease-out 0.2s backwards;
        }

        .edit-section h3 {
            margin: 0 0 22px 0;
            color: #2d3748;
            font-size: 1.4em;
            font-weight: 700;
            padding-bottom: 14px;
            border-bottom: 2px solid #e2e8f0;
        }

        .edit-section label {
            color: #2d3748;
            margin-top: 14px;
        }

        .edit-section textarea {
            margin-bottom: 8px;
        }

        /* Mensaje de no encontrado */
        .no-results {
            background: #fff5f5;
            color: #c53030;
            padding: 16px 20px;
            border-radius: 12px;
            border: 2px solid #fc8181;
            margin: 20px 0;
            font-weight: 600;
            text-align: center;
            animation: slideDown 0.4s ease-out;
        }

        /* Separadores */
        hr {
            display: none;
        }

        /* Ajuste del título principal */
        h2 {
            color: #e2e8f0;
            font-size: 2em;
            margin-bottom: 28px;
        }
    </style>
</head>
<body>
    <div id="img-fondo"></div>
    
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
        
        <h2>Historia Clínica del Paciente</h2>
        
        <!-- Buscar por ID de paciente -->
        <div class="search-section">
            <form method="get" action="ctHistoriaOdontologo">
                <label>ID Paciente:</label>
                <input type="number" name="cedula_paciente" required value="<%= idPaciente %>">
                <button type="submit" class="btn">Buscar</button>
            </form>
        </div>
        
        <!-- Tabla de historias encontradas -->
        <% if (lista != null && !lista.isEmpty()) { %>
            <div class="table-container">
                <h3>Registros encontrados:</h3>
                <table>
                    <thead>
                        <tr>
                            <th>ID Historia</th>
                            <th>Fecha</th>
                            <th>Motivo</th>
                            <th>Diagnóstico</th>
                            <th>Tratamiento</th>
                            <th>Odontólogo</th>
                            <th>Observaciones</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (mdHistoriaClinica h : lista) { %>
                            <tr>
                                <td><%= h.getIdHistoria() %></td>
                                <td><%= h.getFecha() %></td>
                                <td><%= h.getMotivoConsulta()%></td>
                                <td><%= h.getDiagnostico()%></td>
                                <td><%= h.getTratamiento()%></td>
                                <td><%= h.getNombreOdontologo()%></td>
                                <td><%= h.getObservaciones()%></td>
                                <td>
                                    <a href="ctHistoriaOdontologo?accion=editar&id_historia=<%= h.getIdHistoria() %>&cedula_paciente=<%= idPaciente %>">
                                        Editar
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else if (!idPaciente.equals("")) { %>
            <div class="no-results">
                No se encontraron historias para este paciente.
            </div>
        <% } %>
        
        <!-- Formulario para editar una historia -->
        <% if (seleccionada != null) { %>
            <div class="edit-section">
                <h3>Editar historia clínica</h3>
                <form method="post" action="ctHistoriaOdontologo">
                    <input type="hidden" name="accion" value="actualizar">
                    <input type="hidden" name="id_historia" value="<%= seleccionada.getIdHistoria() %>">
                    <input type="hidden" name="cedula_paciente" value="<%= seleccionada.getCedulaPaciente()%>">
                    
                    <label>Motivo de consulta:</label>
                    <textarea name="motivoConsulta" rows="2"><%= seleccionada.getMotivoConsulta() %></textarea>
                    
                    <label>Diagnóstico:</label>
                    <textarea name="diagnostico" rows="2"><%= seleccionada.getDiagnostico() %></textarea>
                    
                    <label>Tratamiento:</label>
                    <textarea name="tratamiento" rows="2"><%= seleccionada.getTratamiento() %></textarea>
                    
                    <label>Observaciones:</label>
                    <textarea name="observaciones" rows="3"><%= seleccionada.getObservaciones() %></textarea>
                    
                    <button type="submit" class="btn">Guardar cambios</button>
                </form>
            </div>
        <% } %>
        
        <a href="${pageContext.request.contextPath}/vistas/vs_menuOdonto.jsp" class="btn">Volver al menú</a>
    </div>
</body>
</html>