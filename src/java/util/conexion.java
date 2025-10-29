/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Anthony
 */
public class conexion {
    
    Connection conn; // Objeto para la conexion
    String mensaje; // asignar mensajes posibles mensajes de error
    public Statement st;
    

    //constructor
    public conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/consulprueba", "root", "");
            st = conn.createStatement();
        } catch (Exception e) {
            System.out.println("Error de conexión: " + e);
        }
    }
    
    //metodo de conexion a la base de datos
    public void conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/consulprueba", "root", "");
            st = conn.createStatement();
        } catch (Exception e) {
            System.out.println("Error de conexión: " + e);
        }
    }
    
    public String getMensaje() {
        return mensaje;
    }

    //metodo para cerrar la conexion a la base de datos
    public void cerrar() {
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            mensaje = "Error al cerrar la conexión: " + e.getMessage();
        }
    }
    
    //metodo para la insercion de datos a la base de datos 
    public boolean insertar(String tabla, String columnas, ArrayList datos) {
    try {
        String valores = "";
        for (int i = 0; i < datos.size(); i++) {
            valores += "'" + datos.get(i).toString() + "'";
            if (i < datos.size() - 1) valores += ", "; 
        }

        String sql = "INSERT INTO " + tabla + " (" + columnas + ") VALUES (" + valores + ")";
        System.out.println("SQL: " + sql);
        st.executeUpdate(sql);
        return true;
    } catch (Exception e) {
        System.out.println("Error al insertar en " + tabla + ": " + e.getMessage());
        e.printStackTrace(); //Imprime la traza completa en consola
        return false;
    }
    }
    
    
    // Consulta directa
    public ResultSet consultar(String sql) {
        try {
            Statement st = conn.createStatement();
            return st.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // Consulta para crear el PDF
    public ResultSet consultarScrollable(String sql) {
    try {
        if (conn == null || conn.isClosed()) {
            conexion(); 
        }
        Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        return st.executeQuery(sql);
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    }
}

    // Consulta por ID
    public ResultSet consultarPorID(String sql, int id) {
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/consulprueba", "root", "");
        } catch (Exception e) {
            System.out.println("Error en la conexión: " + e.getMessage());
        }
        return con;
    }
}
