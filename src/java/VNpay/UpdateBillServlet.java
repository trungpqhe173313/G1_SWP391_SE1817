/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package VNpay;

import Dal.AccountDAO;
import Dal.CustomerDAO;
import Dal.LoyaltyPoliciesDAO;
import Dal.OrderDAO;
import Model.Account;
import Model.Customer;
import Model.LoyaltyPolicies;
import Model.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author phamt
 */
@WebServlet(name = "UpdateBillServlet", urlPatterns = {"/updateBill"})
public class UpdateBillServlet extends HttpServlet {

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
            String codeOrder = request.getParameter("codeOrder");
            String isTransactionSuccessful = request.getParameter("isTransactionSuccessful");
            int amount = Integer.parseInt(request.getParameter("amount")) /100;
            Order order = new OrderDAO().getOrderByCode(codeOrder);
            //get info customer in order
            Customer customer = new CustomerDAO().getCustomerById(order.getCustomerId());
            //get account
            Account account = new AccountDAO().getAccountByPhone(customer.getPhone());
            int points = 0;
            boolean transactionSuccessful = Boolean.parseBoolean(isTransactionSuccessful);
            if (transactionSuccessful) {
                if (account != null) {
                    LoyaltyPolicies lp = new LoyaltyPoliciesDAO().getLoyalty();
                    points = account.getPoint() + (amount / lp.getMinAmount()) * lp.getPointsPerUnit();
                    new AccountDAO().updatePoints(points, account.getPhone());
                    new OrderDAO().upDateStatusOrderByCode(4, codeOrder);
                } else {
                    new OrderDAO().upDateStatusOrderByCode(4, codeOrder);
                }
            } else {
                new OrderDAO().upDateStatusOrderByCode(6, codeOrder);
            }
            response.sendRedirect("getOrderManager");
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
