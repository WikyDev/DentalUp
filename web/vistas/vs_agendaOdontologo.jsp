<%-- Vista limpia: sin lógica embebida --%>

<!DOCTYPE html>
<html>
<head>
    <title>Agenda por Odontólogo</title>
</head>
<body>
    <h2>Consultar agenda de odontólogo</h2>
    <form method="get">
        <label>Seleccione odontólogo:</label>
        <select name="id_odontologo">
            
                <option value="">
                    
                </option>
            
        </select>
        <button type="submit">Ver agenda</button>
    </form>

    
    <h3>Agenda:</h3>
    <table border="1">
        <tr><th>ID</th><th>Paciente</th><th>Fecha</th><th>Motivo</th></tr>
        
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    
    <tr><td colspan="3" style="color:red;">Error al consultar la agenda del odontólogo.</td></tr>
    
    
    </table>
    
    <div>
        <br>
        <a href="/vista/vs_menuOdonto.jsp">Volver al menú</a>
    </div>
</body>
</html>
