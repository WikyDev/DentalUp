
package controlador;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;
import modelo.mdAdmin;
import modelo.mdSecretario;
import modelo.mdOdontologo;
import modelo.mdUsuarios;
import util.conexion;

/**
 * Controlador lógico para manejar las operaciones del Administrador:
 *  - Registrar administrador
 *  - Registrar secretario
 *  - Registrar odontólogo
 *  - Listar usuarios
 *  - Eliminar usuario (cascade en BD eliminará su tabla asociada)
 * Maneja CRUD de administradores, secretarios, odontólogos y usuarios.
 * @author Anthony
 */
public class ctRegistroAdmin {

     /* ======================= REGISTRAR ADMINISTRADOR ======================= */
    public boolean registrarAdministrador(mdAdmin admin, String nombre_user, String password) {
        boolean ok = false;

        String sqlUsuario = "INSERT INTO usuarios (nombre_user, password, rol) VALUES (?, ?, 'admin')";
        String sqlAdmin = "INSERT INTO administradores (cedula_admin, nombre_completo, correo, id_user) VALUES (?, ?, ?, ?)";

        try (Connection con = conexion.getConexion();
             PreparedStatement psUser = con.prepareStatement(sqlUsuario, Statement.RETURN_GENERATED_KEYS);
             PreparedStatement psAdmin = con.prepareStatement(sqlAdmin)) {

            // Insertar en usuarios
            psUser.setString(1, nombre_user);
            psUser.setString(2, password);
            int filasUser = psUser.executeUpdate();

            if (filasUser == 0) {
                System.out.println("⚠ No se insertó usuario en tabla usuarios.");
                return false;
            }

            // Obtener id_user generado
            ResultSet rs = psUser.getGeneratedKeys();
            int idUser = rs.next() ? rs.getInt(1) : 0;

            if (idUser == 0) {
                System.out.println("⚠ No se pudo obtener id_user del administrador.");
                return false;
            }

            // Insertar en administradores
            psAdmin.setInt(1, admin.getCedulaAdmin());
            psAdmin.setString(2, admin.getNombreCompleto());
            psAdmin.setString(3, admin.getCorreo());
            psAdmin.setInt(4, idUser);

            ok = psAdmin.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("❌ Error registrarAdministrador(): " + e.getMessage());
        }

        return ok;
    }


    /* ======================= REGISTRAR SECRETARIO ========================== */
    public boolean registrarSecretario(mdSecretario sec, String nombre_user, String password) {
        boolean ok = false;

        String sqlUsuario = "INSERT INTO usuarios (nombre_user, password, rol) VALUES (?, ?, 'secretario')";
        String sqlSec = "INSERT INTO secretarios (cedula_secretario, nombre_completo, telefono, correo, id_user) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = conexion.getConexion();
             PreparedStatement psUser = con.prepareStatement(sqlUsuario, Statement.RETURN_GENERATED_KEYS);
             PreparedStatement psSec = con.prepareStatement(sqlSec)) {

            // Insertar usuario
            psUser.setString(1, nombre_user);
            psUser.setString(2, password);
            psUser.executeUpdate();

            ResultSet rs = psUser.getGeneratedKeys();
            int idUser = rs.next() ? rs.getInt(1) : 0;

            if (idUser == 0) return false;

            // Insertar secretario
            psSec.setInt(1, sec.getCedulaSecretario());
            psSec.setString(2, sec.getNombreCompleto());
            psSec.setString(3, sec.getTelefono());
            psSec.setString(4, sec.getCorreo());
            psSec.setInt(5, idUser);

            ok = psSec.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("❌ Error registrarSecretario(): " + e.getMessage());
        }

        return ok;
    }


    /* ======================= REGISTRAR ODONTOLOGO
    * IMPORTANTE: primero debe CREAR PERFIL → luego insertar en BD *
    ========================== */
    public boolean registrarOdontologo(mdOdontologo odo, String nombre_user, String password) {
        boolean ok = false;

        //AQUÍ ES DONDE IRÁ LA VALIDACIÓN DEL PERFIL
        //validar si ya existe la foto y descripción en otra tabla.
        //
        // if (!perfilCompletado(session, odo.getCedulaOdontologo())) {
        //     return false;
        // }
        
        String sqlUsuario = "INSERT INTO usuarios (nombre_user, password, rol) VALUES (?, ?, 'odontologo')";
        String sqlOdo = "INSERT INTO odontologos (cedula_odontologo, nombre_completo, especialidad, correo, id_user) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = conexion.getConexion();
             PreparedStatement psUser = con.prepareStatement(sqlUsuario, Statement.RETURN_GENERATED_KEYS);
             PreparedStatement psOdo = con.prepareStatement(sqlOdo)) {

            // Insertar usuario
            psUser.setString(1, nombre_user);
            psUser.setString(2, password);
            psUser.executeUpdate();

            ResultSet rs = psUser.getGeneratedKeys();
            int idUser = rs.next() ? rs.getInt(1) : 0;

            if (idUser == 0) return false;

            // Insertar odontólogo
            psOdo.setInt(1, odo.getCedulaOdontologo());
            psOdo.setString(2, odo.getNombreCompleto());
            psOdo.setString(3, odo.getEspecialidad());
            psOdo.setString(4, odo.getCorreo());
            psOdo.setInt(5, idUser);

            ok = psOdo.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("❌ Error registrarOdontologo(): " + e.getMessage());
        }

        return ok;
    }
    
    public boolean registrarOdontologoCompleto(
            int cedula, String nombre, String especialidad, String correo,
            String usuario, String password, String descripcion, Part foto) {

        boolean ok = false;

        String sqlUsuario = "INSERT INTO usuarios (nombre_user, password, rol) VALUES (?, ?, 'odontologo')";
        String sqlOdonto = "INSERT INTO odontologos (cedula_odontologo, nombre_completo, especialidad, correo, id_user) "
                + "VALUES (?, ?, ?, ?, ?)";
        String sqlPerfil = "INSERT INTO perfiles_odontologos (cedula_odontologo, descripcion, ruta_foto) VALUES (?, ?, ?)";

        try (Connection con = conexion.getConexion(); PreparedStatement psUser = con.prepareStatement(sqlUsuario, Statement.RETURN_GENERATED_KEYS); PreparedStatement psOdo = con.prepareStatement(sqlOdonto); PreparedStatement psPerfil = con.prepareStatement(sqlPerfil)) {

            // Insert usuario
            psUser.setString(1, usuario);
            psUser.setString(2, password);
            psUser.executeUpdate();

            ResultSet rs = psUser.getGeneratedKeys();
            int idUser = 0;

            if (rs.next()) {
                idUser = rs.getInt(1);
            }

            // Insert odontólogo
            psOdo.setInt(1, cedula);
            psOdo.setString(2, nombre);
            psOdo.setString(3, especialidad);
            psOdo.setString(4, correo);
            psOdo.setInt(5, idUser);
            psOdo.executeUpdate();

            // Guardar foto en carpeta
            String ruta = guardarArchivoFoto(cedula, foto);

            // Insert perfil
            psPerfil.setInt(1, cedula);
            psPerfil.setString(2, descripcion);
            psPerfil.setString(3, ruta);
            psPerfil.executeUpdate();

            ok = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ok;
    }
    
    private String guardarArchivoFoto(int cedula, Part foto) throws Exception {
        String nombreArchivo = "odo_" + cedula + ".jpg";
        String ruta = "perfiles_odontologos/" + nombreArchivo;

        foto.write("C:\\Users\\Anthony\\Documents\\ProjectFinalDSI\\DentalUp" + ruta);
        return ruta;
    }

    public boolean registrarOdontologoCompleto(mdOdontologo odo, String user, String pass,
            String descripcion, String fotoNombre) {

        boolean ok = false;

        String sqlUser = "INSERT INTO usuarios (nombre_user, password, rol) VALUES (?, ?, 'odontologo')";
        String sqlOdo = "INSERT INTO odontologos (cedula_odontologo, nombre_completo, especialidad, correo, id_user) VALUES (?, ?, ?, ?, ?)";
        String sqlPerfil = "INSERT INTO perfiles_odontologos (cedula_odontologo, descripcion, foto) VALUES (?, ?, ?)";

        try (Connection con = conexion.getConexion(); PreparedStatement psUser = con.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS); PreparedStatement psOdo = con.prepareStatement(sqlOdo); PreparedStatement psPerfil = con.prepareStatement(sqlPerfil)) {

            // 1. Insertar usuario
            psUser.setString(1, user);
            psUser.setString(2, pass);
            psUser.executeUpdate();

            ResultSet rs = psUser.getGeneratedKeys();
            int idUser = (rs.next()) ? rs.getInt(1) : 0;

            // 2. Insertar odontólogo
            psOdo.setInt(1, odo.getCedulaOdontologo());
            psOdo.setString(2, odo.getNombreCompleto());
            psOdo.setString(3, odo.getEspecialidad());
            psOdo.setString(4, odo.getCorreo());
            psOdo.setInt(5, idUser);
            psOdo.executeUpdate();

            // 3. Insertar perfil
            psPerfil.setInt(1, odo.getCedulaOdontologo());
            psPerfil.setString(2, descripcion);
            psPerfil.setString(3, fotoNombre);
            psPerfil.executeUpdate();

            ok = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ok;
    }



    /* ============================ LISTAR USUARIOS ========================== */
    public List<mdUsuarios> listarUsuarios() {
        List<mdUsuarios> lista = new ArrayList<>();

        try {
            Connection cn = conexion.getConexion();
            String sql = "SELECT id_user, nombre_user, rol FROM usuarios";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdUsuarios u = new mdUsuarios();
                u.setId_user(rs.getInt("id_user"));
                u.setNombre_user(rs.getString("nombre_user"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }

        } catch (Exception e) {
            System.out.println("Error listando usuarios: " + e.getMessage());
        }

        return lista;
    }


    /* ============================ ELIMINAR USUARIO ========================= */
    public boolean eliminarUsuario(int id_user) {
        boolean ok = false;

        String sql = "DELETE FROM usuarios WHERE id_user = ?";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id_user);
            ok = ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("❌ Error eliminarUsuario(): " + e.getMessage());
        }

        return ok;
    }
    
    /* ============================ BUSCAR USUARIOS POR ROL ========================= */
    public List<mdUsuarios> listarUsuariosPorRol(String rol) {
        List<mdUsuarios> lista = new ArrayList<>();

        try {
            Connection cn = conexion.getConexion();
            String sql = "SELECT id_user, nombre_user, rol FROM usuarios WHERE rol = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, rol);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdUsuarios u = new mdUsuarios();
                u.setId_user(rs.getInt("id_user"));
                u.setNombre_user(rs.getString("nombre_user"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }

        } catch (Exception e) {
            System.out.println("Error listando usuarios por rol: " + e.getMessage());
        }

        return lista;
    }

}

