/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.CustomerDAO;
import Dal.EmployeesDAO;
import Dal.OrderDAO;
import Dal.ShiftsDAO;
import Dal.StatusDAO;
import Model.Customer;
import Model.Employee;
import Model.Order;
import Model.Shift;
import Model.Status;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author phamt
 */
public class ViewOrderController extends HttpServlet {

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
        List<Order> ListOrder = new OrderDAO().getAllOrder();
        //get order have status "da dat" or "dang cho"
        List<Order> upcomingOrder = ListOrder.stream()
                .filter(order -> order.getStatusId() == 1 || order.getStatusId()==2)
                .collect(Collectors.toList());
        //get order have status "Huy"
        List<Order> cancelOrder = ListOrder.stream()
                .filter(order -> order.getStatusId() == 5)
                .collect(Collectors.toList());
        //get info customer
        List<Customer> ListCustomer = new CustomerDAO().getAllCustomer();
        //get info barber
        List<Employee> ListEmployee = new EmployeesDAO().getAllEmployee();
        //get info status
        List<Status> status = new StatusDAO().getAll();
        request.setAttribute("status", status);
        request.setAttribute("orders", ListOrder);
        request.setAttribute("ListCustomer", ListCustomer);
        request.setAttribute("cancelOrder", cancelOrder);
        request.setAttribute("ListEmployee", ListEmployee);
        request.setAttribute("upcomingOrder", upcomingOrder);
        request.getRequestDispatcher("index.jsp").forward(request, response);

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
