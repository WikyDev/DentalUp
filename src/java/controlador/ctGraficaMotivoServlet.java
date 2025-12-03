/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/datosMotivo")
public class ctGraficaMotivoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ctGrafica ctrl = new ctGrafica();
        Map<String, Integer> datos = ctrl.conteoCitasPorMotivo();

        // Construir JSON
        StringBuilder json = new StringBuilder("{ \"labels\": [");
        StringBuilder values = new StringBuilder("\"values\": [");

        int i = 0;
        for (Map.Entry<String, Integer> e : datos.entrySet()) {
            json.append("\"").append(e.getKey()).append("\"");
            values.append(e.getValue());

            if (i < datos.size() - 1) {
                json.append(",");
                values.append(",");
            }
            i++;
        }

        json.append("],").append(values).append("]}");

        response.setContentType("application/json");
        response.getWriter().write(json.toString());
    }
}
