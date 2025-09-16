/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

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
public class Conexion {
    Connection conn; // Objeto para la conexion
    String mensaje; // asignar mensajes posibles mensajes de error

    // datos de conexion 
    String bd = "consultoriobd";//nombre de la base de datos
    String login = "root";
    String password = "";
    String host = "127.0.0.1";//direccion ip del host 

    public Conexion() {
        conn = null;
        mensaje = "";
    }

    public String getMensaje() {
        return mensaje;
    }

    //metodo de conexion a la base de datos 
    public boolean conectarMySQL() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            conn = DriverManager.getConnection("jdbc:mysql://" + host + ":3306/" + bd, login, password);
        } catch (ClassNotFoundException e) {
            mensaje = "No se encuentra la referencia del conector de MySQL.<br/>";
            return false;
        } catch (SQLException ex) {
            mensaje = "Error al tratar de conectar con la base de datos '" + bd + "'.<br/>";
            return false;
        }
        return true;
    }

    //metodo para desconectarse a la base de datos
    private boolean desconectar() {
        try {
            conn.close();
            return true;
        } catch (SQLException sqle) {
            mensaje = "Error al tratar de conectar con la base de datos '" + bd + "'.<br/>";
            return false;
        }
    }

    //metodo de insercion de datos a la base de datos
    public boolean insertar(String tabla, ArrayList<String> datos) {
        if(conectarMySQL()){
            String sql = "INSERT INTO " + tabla + " VALUES('";
            for (String campo : datos) {
                sql += campo + "','";
            }
            sql = sql.substring(0, sql.length() - 2);
            sql += ");";
            return actualizar(sql);
        }return false;
    }
    
    //metodo de update de datos 
    private boolean actualizar(String sql) {
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
            int resultado = stmt.executeUpdate(sql);
            stmt.close();
            desconectar();
            return true;
        } catch (SQLException sqle) {
            mensaje = "Error al realizar la actualización. <br/>" + sqle + "<br/>";
            return false;
        }
    }
    
    public boolean actualizar(String tabla, String nomCampos[], ArrayList<String> datos, String condicion) {
        if(conectarMySQL()){
            String sql = "UPDATE " + tabla + " SET ";
            int i = 0;
            for (String campo : nomCampos) {
                sql += campo + " = '" + datos.get(i) + "', ";
                i++;
            }
            sql = sql.substring(0, sql.length() - 2);
            sql += " " + condicion + ";";
            System.out.println(sql);
            return actualizar(sql);
        }else return false;
    }

    public String[] consultaFila(String tabla, String campo, String valor) {
        Statement stmt = null; // Objeto para ejecutar la consulta
        ResultSet rs = null; // Objeto para recuperar los resultados de la consulta
        String fila[] = null;
        if(conectarMySQL()){
            try {
                stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = stmt.executeQuery("SELECT * FROM " + tabla + " WHERE " + campo + " = '" + valor + "'");
                int c = getSizeQuery(rs); // obtener cantidad de registros de la consulta                	
                if (c > 0) {//si la cantidad de filas (registros) resultantes de la consulta es mayor a cero, es porque el valor a buscar existe

                    int cantColumnas = rs.getMetaData().getColumnCount();//obtener cantidad de columnas (campos) resultantes de la consulta									
                    fila = new String[cantColumnas];//dar tama�o al array dependiendo de la cantidad de columnas (campos) resultantes de la consulta

                    while (rs.next()) {//recorrer la consulta
                        for (int i = 1; i <= cantColumnas; i++) {
                            fila[i - 1] = rs.getString(i);//y llenar el array String con los campos a retornar
                        }
                        break;
                    }
                } else mensaje = "No hay registros que cumplan la condición.<br/>";
                rs.close();
            } catch (SQLException sqle) {
                mensaje = "Error al realizar la consulta.<br/>" + sqle + "<br/>";
                return null;
            }
            desconectar();
            return fila;
        }else return null;
    }

    public String[][] consultaMatriz(String sql) {
        Statement stmt = null; // Objeto para ejecutar la consulta
        ResultSet rs = null; // Objeto para recuperar los resultados de la consulta
        String matrizRegistros[][] = null;
        if(conectarMySQL()){
            try {
                stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = stmt.executeQuery(sql);
                int canFilas = getSizeQuery(rs);
                if (canFilas > 0) {
                    int canColumnas = rs.getMetaData().getColumnCount();
                    matrizRegistros = new String[canFilas][canColumnas];
                    int f = 0;
                    while (rs.next()) {
                        for (int c = 0; c < canColumnas; c++) {
                            matrizRegistros[f][c] = rs.getString(c + 1);
                        }
                        f++;
                    }
                } else mensaje = "No hay registros que cumplan con la condición.<br/>";
                rs.close();
            } catch (SQLException sqle) {
                mensaje = "Error al ejecutar la consulta.<br/>";
            }
            desconectar();
            return matrizRegistros;
        }else return null;
    }

    private int getSizeQuery(ResultSet rs) {
        int cantFilas = -1;
        try {
            rs.last(); //Desplazar el puntero de lectura a la ultima fila (registro)
            cantFilas = rs.getRow(); //Calcular la cantidad de filas (registros) que arroja la consulta
            rs.beforeFirst(); //Desplazar el puntero de lectura a la primera fila (registro)
        } catch (SQLException sqle) { }
        return cantFilas;
    }

    public ResultSet consulta(String sql) {
        Statement stmt = null; // Objeto para ejecutar la consulta
        ResultSet rs = null; // Objeto para recuperar los resultados de la consulta
        try {
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stmt.executeQuery(sql);
        } catch (SQLException sqle) { }
        return rs;
    }
    
    // contar cuantos registros tiene una tabla
    public int contar(String tabla) {
        int cont = -1;
        if(conectarMySQL()){
            ResultSet rs = consulta("SELECT COUNT(*) FROM " + tabla);
            try {
                while (rs.next()) {
                    cont = Integer.parseInt(rs.getString(1));
                }
                rs.close();   
                desconectar();
            } catch (SQLException sqle) { 
                cont = -1;
                mensaje = "Error al realizar la consulta. <br/>" + sqle + "<br/>";
            }
        }
        return cont;
    }
    
    // contar por algun tipo de condicion
    public int contar(String tabla, String sql) {
        int cont = -1;
        ResultSet rs = consulta("SELECT COUNT(*) FROM " + tabla + " WHERE " + sql);
        try {
            while (rs.next()) {
                cont = Integer.parseInt(rs.getString(1));
            }
            rs.close();
        } catch (SQLException sqle) { 
            cont = -1;
            mensaje = "Error al realizar la consulta. <br/>" + sqle + "<br/>";
        }
        return cont;
    }
    
    // sumar por algun tipo de condicion
    public int sumar(String tabla, String campo) {
        int suma = -1;
        ResultSet rs = consulta("SELECT sum(" + campo + ") FROM " + tabla);
        try {
            while (rs.next()) {
                suma = Integer.parseInt(rs.getString(1));
            }
            rs.close();
        } catch (SQLException sqle) {
            suma = -1;
            mensaje = "Error al realizar la consulta. <br/>" + sqle + "<br/>";
        }
        return suma;
    }
}
