/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.OrdersDAO;
import Model.Accounts;
import Model.Booking;
import Model.Orders;
import Model.Services;
import Model.Shifts;
import Model.Statuses;
import java.io.IOException;
import java.io.PrintWriter;
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
public class BookingScheduleServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        Accounts account = (Accounts) session.getAttribute("account");
        OrdersDAO d = new OrdersDAO();
        List<Orders> listOrders = d.getAllOrdersByAccountId(account.getId());
        List<Booking> listBooking = new ArrayList<>();
        for (Orders o : listOrders) {
            Booking b = new Booking();
            b.setOrder(o);

            // lay Status order da dat
            Statuses status = d.getStatusesById(o.getStatusId());
            b.setStatus(status);
            // lay barber da dat
            Accounts barberAdded = d.getAccountsById(o.getEmployeeId());
            b.setBarber(barberAdded);
            // lay shifts da dat
            Shifts shiftsAdded = d.getShiftsById(o.getShiftsID());
            b.setShift(shiftsAdded);
            //lay tat ca services da dat
            List<Services> listServices = d.getAllServicesByOrderId(o.getId());
            b.setListServices(listServices);
            System.out.println(b.toString());
            listBooking.add(b);
        }
        request.setAttribute("listBooking", listBooking);
        request.getRequestDispatcher("bookingschedule.jsp").forward(request, response);
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