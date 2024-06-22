/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.CustomerDAO;
import Dal.OrderDAO;
import Dal.ShiftsDAO;
import Model.Account;
import Model.Order;
import Model.Services;
import Model.ServicesBooking;
import Model.Time;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author xdrag
 */
public class AppointmentServlet extends HttpServlet {

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
        ShiftsDAO d = new ShiftsDAO();
        HttpSession session = request.getSession();
        List<String> listDate = new ArrayList<>();

// Lấy ngày hôm nay
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String todayStr = today.format(formatter);
        listDate.add(todayStr);

// Lấy hai ngày tiếp theo
        for (int i = 0; i < 2; i++) {
            today = today.plusDays(1);
            String nextDayStr = today.format(formatter);
            listDate.add(nextDayStr);
        }
        if (session.getAttribute("time") == null) {
            session.setAttribute("time", new Time(todayStr, d.getAllShiftFromNow()));
        }

        request.setAttribute("listDate", listDate);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
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
        String date_str = request.getParameter("date");
        String shift_str = request.getParameter("shifts");
        System.out.println("day la tu appointment: " + date_str);
        System.out.println("day la tu appointment: " + shift_str);
        try {
            HttpSession session = request.getSession();
            CustomerDAO cd = new CustomerDAO();
            Account a = (Account) session.getAttribute("account");
            int customerId = cd.getCustomerByP(a.getPhone()).getCustomerId();
            System.out.println("day la tu appointment cusId: " + customerId);

            OrderDAO d = new OrderDAO();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            //ep kieu string sang date truoc roi tao ra mot cai sql date
            Date date;

            date = new java.sql.Date(sdf.parse(date_str).getTime());
            ServicesBooking sb = (ServicesBooking) session.getAttribute("services");
            System.out.println("day la tu appointment sb: " + sb.toString());
            Order o = new Order(customerId, 1, date, sb.getTotalMoney(), Integer.parseInt(shift_str));
            System.out.println("day la tu appointment order: " + o.toString());
            d.AddOrder(o);
            int orderId = d.getNewOrderId();
            System.out.println("day la tu appointment orderId: " + orderId);
            List<Services> listServices = sb.getListServices();
            for (Services s : listServices) {
                d.AddOrder_services(s.getServicesId(), orderId);
            }
            session.removeAttribute("time");
            session.removeAttribute("services");
            System.out.println("day la tu appointment: add thành công");
        } catch (Exception e) {
        }
        request.getRequestDispatcher("home").forward(request, response);

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
