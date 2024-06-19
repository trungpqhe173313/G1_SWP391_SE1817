/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.CustomerDAO;
import Dal.OrderDAO;
import Dal.ServicesDAO;
import Dal.ShiftsDAO;
import Dal.StatusDAO;
import Model.Account;
import Model.Customer;
import Model.Order;
import Model.Services;
import Model.Shift;
import Model.Status;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author phamt
 */
public class ViewAppountController extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            response.sendRedirect("login");
        } else {
            Account account = (Account) session.getAttribute("account");
            //get info customer
            Customer customer = new CustomerDAO().getCustomerByP(account.getPhone());
            //get info order of customer
            Order order = new OrderDAO().getOrderByAId(customer.getCustomerId());
            //get info shift
            List<Shift> Shift = new ShiftsDAO().getAll();
            //get info status
            List<Status> status = new StatusDAO().getAll();
            //get all services for update
            List<Services> listServices = new ServicesDAO().GetAllServices();
            
             request.setAttribute("order", order);
            request.setAttribute("ls", listServices);
            request.setAttribute("status", status);
            request.setAttribute("shift", Shift);
            if(order != null){
                //get info sevices of order
                List<Services> services = new ServicesDAO().getServicesInOrder(order.getId());
                request.setAttribute("services", services);
            }
            
           
            //request.getRequestDispatcher("viewappointment.jsp").forward(request, response);
            request.getRequestDispatcher("viewappointment.jsp").forward(request, response);
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
