/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package VNpay;

import Dal.DiscountDAO;
import Model.Discount;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author phamt
 */
@WebServlet(name = "DiscountServlet", urlPatterns = {"/calculateDiscount"})
public class DiscountServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DiscountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DiscountServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int points = Integer.parseInt(request.getParameter("points"));
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
        int newTotal = 0;
        int newPoints = 0;
        List<Discount> dis = new DiscountDAO().getAllDis();

        for (int i = dis.size() - 1; i >= 0; i++) {
            Discount di = dis.get(i);
            if (points >= di.getPoint()) {
                newPoints = points - di.getPoint();
                newTotal = totalAmount - di.getDiscount();
                break;
            }

        }

        if (newTotal < 0) {
            newTotal = 0;
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Map<String, Integer> discountResponse = new HashMap<>();
        discountResponse.put("newPoints", newPoints);
        discountResponse.put("newTotal", newTotal);

//        response.getWriter().write(new Gson().toJson(discountResponse));
        String jsonResponse = new Gson().toJson(discountResponse);
        System.out.println("JSON Response: " + jsonResponse);

        response.getWriter().write(jsonResponse);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
