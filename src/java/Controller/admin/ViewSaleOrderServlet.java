/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.ShopDAO;
import Model.Order;
import Model.OrderRevenue;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.tomcat.jakartaee.commons.lang3.math.NumberUtils;

/**
 *
 * @author xdrag
 */
public class ViewSaleOrderServlet extends HttpServlet {

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
        String orderId_str = request.getParameter("orderId");
        String month = request.getParameter("month");
        ShopDAO d = new ShopDAO();

        if (NumberUtils.isNumber(orderId_str) == true) {
            int orderId = Integer.parseInt(orderId_str);
            Order o = d.getOrderById(orderId);
            OrderRevenue or = new OrderRevenue();

            or.setOrder(o);
            or.setCustomer(d.getCustomerById(o.getCustomerId()));
            or.setEmployee(d.getEmployeeById(o.getEmployeeId()));
            or.setServices(d.getServicesByOrderId(o.getId()));
            or.setShift(d.getShiftById(o.getShiftsID()));
            or.setStatus(d.getStatusById(o.getStatusId()));
            request.setAttribute("o", or);
            request.setAttribute("month", month);
            request.setAttribute("employeeId", or.getEmployee().getEmployeeId());
            request.getRequestDispatcher("viewSaleOrder.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("viewsale").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
