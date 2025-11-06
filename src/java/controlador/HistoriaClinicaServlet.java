/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import modelo.mdHistoriaClinica;
import util.conexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/HistoriaClinicaServlet")
public class HistoriaClinicaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer idPaciente = (Integer) session.getAttribute("id_paciente");

        if (idPaciente == null) {
            request.setAttribute("mensaje", "⚠️ Debe iniciar sesión para ver su historia clínica.");
            request.getRequestDispatcher("vistas/vs_login.jsp").forward(request, response);
            return;
        }

        ArrayList<mdHistoriaClinica> listaHistoria = new ArrayList<>();

        String sql = "SELECT id_historia, id_paciente, diagnostico, tratamiento, fecha_registro "
                   + "FROM historia_clinica WHERE id_paciente = ? ORDER BY fecha_registro DESC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idPaciente);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdHistoriaClinica h = new mdHistoriaClinica(
                    rs.getInt("id_historia"),
                    rs.getInt("id_paciente"),
                    rs.getString("diagnostico"),
                    rs.getString("tratamiento"),
                    rs.getDate("fecha_registro")
                );
                listaHistoria.add(h);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "❌ Error al cargar la historia clínica: " + e.getMessage());
        }

        request.setAttribute("listaHistoria", listaHistoria);
        RequestDispatcher rd = request.getRequestDispatcher("/vistas/vs_historiaClinica.jsp");

        rd.forward(request, response);
    }
}
