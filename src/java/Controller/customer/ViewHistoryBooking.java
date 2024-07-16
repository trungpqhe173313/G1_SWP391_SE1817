/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.CustomerDAO;
import Dal.ShopDAO;
import Model.Account;
import Model.Customer;
import Model.Order;
import Model.OrderRevenue;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xdrag
 */
public class ViewHistoryBooking extends HttpServlet {

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
        ShopDAO d = new ShopDAO();
        CustomerDAO cd = new CustomerDAO();
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");
        Customer customer = cd.getCustomerByP(account.getPhone());
        List<Order> listOrderDefault = d.getOrderByCustomerId(customer.getCustomerId());
        List<OrderRevenue> listOrder = new ArrayList<>();
        
        for (Order o : listOrderDefault) {
            OrderRevenue or = new OrderRevenue();
            or.setOrder(o);
            or.setCustomer(d.getCustomerById(o.getCustomerId()));
            or.setEmployee(d.getEmployeeById(o.getEmployeeId()));
            or.setServices(d.getServicesByOrderId(o.getId()));
            or.setShift(d.getShiftById(o.getShiftsID()));
            or.setStatus(d.getStatusById(o.getStatusId()));
            listOrder.add(or);
        }
        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("viewhistorybooking.jsp").forward(request, response);
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
