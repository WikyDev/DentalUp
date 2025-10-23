<%-- Vista limpia: sin lógica embebida --%>

<!DOCTYPE html>
<html>
<head>
    <title>Generar Reporte de Agenda</title>
</head>
<body>
    <h2>Generar Reporte de Agenda del Odontólogo</h2>
    <h4>
        Cree un reporte con la agenda de citas para el odontólogo y fecha seleccionados<br>
    </h4>
    <form method="get" action="/ReportePDFServlet" target="_blank">
        <label for="id_odontologo">Selecciona Odontólogo:</label>
        <select name="id_odontologo" required>
            <option value="1">Jose Pérez</option>
            <option value="2">Pablo Torre</option>
            <!-- se agregan más según la base de datos -->
        </select><br><br>

        <label for="fecha">Fecha de agenda:</label>
        <input type="date" name="fecha" required><br><br>

        <input type="submit" value="Generar PDF">
        <p>Al hacer clic en <b>Generar PDF</b>, el reporte se descargará en su equipo.</p>
    </form>
        
        <div>
        <br>
        <a href="/vista/vs_menuSecre.jsp">Volver al menú</a>
    </div>
</body>
</html>
