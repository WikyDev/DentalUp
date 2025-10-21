<%@ page import="java.sql.*, java.util.*" %>
<%
    // Comprobación de sesión (opcional pero recomendado)
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !"odontologo".equals(rol)) {
        response.sendRedirect(request.getContextPath() + "/vista/vs_login.jsp");
        return;
    }

    Map<String, Map<String, Integer>> datos = new LinkedHashMap<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/consulprueba", "root", ""
        );

        // CORREGIDO: usamos JOIN con odontologos para obtener el nombre completo
        String sql = "SELECT o.nombre_completo, c.motivo, COUNT(*) AS total " +
                     "FROM citas c " +
                     "JOIN odontologos o ON c.id_odontologo = o.id_odontologo " +
                     "GROUP BY o.nombre_completo, c.motivo";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String nombreOdontologo = rs.getString("nombre_completo");
            String motivo = rs.getString("motivo");
            int total = rs.getInt("total");

            if (!datos.containsKey(nombreOdontologo)) {
                datos.put(nombreOdontologo, new LinkedHashMap<String, Integer>());
            }
            datos.get(nombreOdontologo).put(motivo, total);
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    session.setAttribute("datosGrafica", datos);
    response.sendRedirect(request.getContextPath() + "/vista/vs_grafica.jsp");
%>
