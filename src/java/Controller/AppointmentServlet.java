/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.OrdersDAO;
import Model.Accounts;
import Model.Orders;
import Model.Services;
import Model.Shifts;
import jakarta.jms.Session;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AppointmentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AppointmentServlet at " + request.getContextPath() + "</h1>");
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
        OrdersDAO d = new OrdersDAO();
        List<Shifts> listShift = d.getAllShifts();
        List<Accounts> listBarber = d.getAllBarber();
        List<Services> listServices = d.getAllServices();
        List<String> listDate = new ArrayList<>();
        HttpSession s = request.getSession();
        Accounts account = (Accounts) s.getAttribute("account");

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

        request.setAttribute("listShift", listShift);
        request.setAttribute("listBarber", listBarber);
        request.setAttribute("listServices", listServices);
        request.setAttribute("listDate", listDate);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
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
        OrdersDAO d = new OrdersDAO();
        HttpSession session = request.getSession();
        Accounts account = (Accounts) session.getAttribute("account");
        String date_raw = request.getParameter("date");
        String shifts = request.getParameter("shifts");
        String barber = request.getParameter("barber");
        String[] services_id = request.getParameterValues("services");
        Orders order = new Orders();

        for (String s : services_id) {
            System.out.println(s);
        }

        try {
            order.setAccountID(account.getId());
            order.setEmployeeId(Integer.parseInt(barber));
            //ep kieu String sang date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            //ep kieu string sang date truoc roi tao ra mot cai sql date
            Date date = new java.sql.Date(sdf.parse(date_raw).getTime());
            order.setOrderDate(date);
            order.setShiftsID(Integer.parseInt(shifts));
            order.setStatusId(1);
            int totalAmount = 0;
            List<Services> listServices = d.getAllServices();
            for (String s : services_id) {
                for (Services ls : listServices) {
                    if (ls.getId() == Integer.parseInt(s)) {
                        totalAmount += ls.getPrice();
                        break;
                    }
                }
            }
            order.setTotalAmount(totalAmount);
            System.out.println(order.toString());
            d.AddOrder(order, services_id);
            int newOrderId = d.GetNewOrderId(order.getAccountID());
            System.out.println(newOrderId);
            for (String s : services_id) {
                d.AddOrder_Services(s, newOrderId);
            }
            response.sendRedirect("home");
        } catch (Exception e) {
        }
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
