<%-- 
    Document   : md_login.jsp
    Created on : 16/05/2025
    Author     : Daniel Martinez 
--%>
<%@ page language="java"
         import="java.sql.*"
         session="false" %>
<%
    String usuario = (String) request.getAttribute("nombre_user");
    String clave   = (String) request.getAttribute("password");

    boolean userValid = false;
    int     userId    = 0;
    String  storedRol = null;

    String url    = "jdbc:mysql://localhost:3306/consulPrueba?useSSL=false&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
             PreparedStatement ps = conn.prepareStatement(
               "SELECT id_user, rol FROM usuarios WHERE nombre_user=? AND password=?"
             )) {

            ps.setString(1, usuario);
            ps.setString(2, clave);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userValid = true;
                    userId    = rs.getInt("id_user");
                    storedRol = rs.getString("rol");
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        //System.err.println("[md_login] Error: " + e.getMessage());
    }

    request.setAttribute("userValid",  userValid);
    request.setAttribute("userId",     userId);
    request.setAttribute("storedRol",  storedRol);
%>
