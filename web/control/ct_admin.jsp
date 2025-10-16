<%-- 
    Document   : ct_admin
    Created on : 23/06/2025, 2:14:32 p. m.
    Author     : Anthony
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="com.mysql.cj.jdbc.PreparedStatementWrapper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    
  String op = request.getParameter("op");
  String accion = request.getParameter("accion");

  if ("registrarOdontologo".equals(op)) {
      response.sendRedirect(request.getContextPath() + "/vista/vs_registrarOdonto.jsp");
      return;
  } else if ("registrarSecretario".equals(op)) {
      response.sendRedirect(request.getContextPath() + "/vista/vs_registrarSecre.jsp");
      return;
  } else if ("guardarOdontologo".equals(accion)) {
      // Guardar odontólogo
      String usuario = request.getParameter("nombre_user");
      String clave = request.getParameter("password");
      String nombre = request.getParameter("nombre_completo");
      String especialidad = request.getParameter("especialidad");
      String correo = request.getParameter("correo");

      Connection con = null;

      try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/consulPrueba", "root", "");
          con.setAutoCommit(false);

          PreparedStatement ps1 = con.prepareStatement(
              "INSERT INTO usuarios(nombre_user, password, rol) VALUES (?, ?, 'odontologo')",
              Statement.RETURN_GENERATED_KEYS
          );

          ps1.setString(1, usuario);
          ps1.setString(2, clave);
          ps1.executeUpdate();

          ResultSet rs = ps1.getGeneratedKeys();
          int cod_usuario = 0;
          if (rs.next()) cod_usuario = rs.getInt(1);

          PreparedStatement ps2 = con.prepareStatement(
              "INSERT INTO odontologos(id_usuario, nombre_completo, especialidad, correo) VALUES (?, ?, ?, ?)"
          );

          ps2.setInt(1, cod_usuario);
          ps2.setString(2, nombre);
          ps2.setString(3, especialidad);
          ps2.setString(4, correo);
          ps2.executeUpdate();
          
          out.print("Usuario creado y almacenado con exito!");

          con.commit();
          response.sendRedirect(request.getContextPath() + "/vista/vs_menuAdmin.jsp");

      } catch (Exception e) {
          if (con != null) con.rollback();
          out.println("Error: " + e.getMessage());
      } finally {
          if (con != null) con.close();
      }
  } else if ("guardarSecretario".equals(accion)) {
      // Guardar secretario
      String usuario = request.getParameter("nombre_user");
      String clave = request.getParameter("password");
      String nombre = request.getParameter("nombre_completo");
      String telefono = request.getParameter("telefono");
      String correo = request.getParameter("correo");

      Connection con = null;
      try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/consulPrueba", "root", "");
          con.setAutoCommit(false);

          PreparedStatement ps1 = con.prepareStatement("INSERT INTO usuarios(nombre_user, password, rol) VALUES (?, ?, 'secretario')", Statement.RETURN_GENERATED_KEYS);
          ps1.setString(1, usuario);
          ps1.setString(2, clave);
          ps1.executeUpdate();

          ResultSet rs = ps1.getGeneratedKeys();
          int cod_usuario = 0;
          if (rs.next()) cod_usuario = rs.getInt(1);

          PreparedStatement ps2 = con.prepareStatement("INSERT INTO secretarios(id_usuario, nombre_completo, telefono, correo) VALUES (?, ?, ?, ?)");
          ps2.setInt(1, cod_usuario);
          ps2.setString(2, nombre);
          ps2.setString(3, telefono);
          ps2.setString(4, correo);
          ps2.executeUpdate();
          
          out.print("Usuario creado y almacenado con exito!");

          con.commit();
          response.sendRedirect(request.getContextPath() + "/vista/vs_menuAdmin.jsp");
      } catch (Exception e) {
          if (con != null) con.rollback();
          out.println("Error al registrar secretario: " + e.getMessage());
      } finally {
          if (con != null) con.close();
      }
  }
%>
