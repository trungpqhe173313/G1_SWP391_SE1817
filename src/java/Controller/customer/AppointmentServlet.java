/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.OrdersDAO;
<<<<<<< Updated upstream:src/java/Controller/AppointmentServlet.java
import Model.Accounts;
<<<<<<< HEAD:src/java/Controller/AppointmentServlet.java
import Model.Orders;
=======
import Model.Account;
import Model.Order;
>>>>>>> Stashed changes:src/java/Controller/customer/AppointmentServlet.java
=======
import Model.Order;
>>>>>>> main:src/java/Controller/customer/AppointmentServlet.java
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
        HttpSession session = request.getSession();

        if (session.getAttribute("account") == null) {
            response.sendRedirect("login");
        } else {
            OrdersDAO d = new OrdersDAO();

            // lay ra cac ca de hien thi
            List<Shift> listShift = d.getAllShifts();
            //lay ra cac barber hoat dong
            List<Account> listBarber = d.getAllBarber();
            //lay ra danh sach cac dich vu
            List<Services> listServices = d.getAllServices();
            //tao danh sach ngay de hien thi
            List<String> listDate = new ArrayList<>();
            HttpSession s = request.getSession();
            Account account = (Account) s.getAttribute("account");

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
        Account account = (Account) session.getAttribute("account");
        String date_raw = request.getParameter("date");
        String shifts = request.getParameter("shifts");
        String barber = request.getParameter("barber");
        String[] services_id = request.getParameterValues("services");
        Order order = new Order();

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
            d.AddOrder(order);
            int newOrderId = d.GetNewOrderId(order.getAccountID());
            for (String s : services_id) {
                d.AddOrder_Services(s, newOrderId);
            }
            // lay ra services da dat
            List<Services> listServicesAdded = new ArrayList<>();
            for (String s : services_id) {
                for (Services ls : listServices) {
                    if (Integer.parseInt(s) == ls.getId()) {
                        listServicesAdded.add(ls);
                        break;
                    }
                }
            }
            // lay Status order da dat
            Status status = d.getStatusesById(order.getStatusId());
            // lay barber da dat
            Account barberAdded = d.getAccountsById(order.getEmployeeId());
            // lay shifts da dat
            Shift shiftsAdded = d.getShiftsById(order.getShiftsID());
            //thong bao dat lich thanh cong
            String mss = "Scheduled Successfully";

            request.setAttribute("newOrderId", newOrderId);
            request.setAttribute("listServicesAdded", listServicesAdded);
            request.setAttribute("NewOrder", order);
            request.setAttribute("ShiftsAdded", shiftsAdded);
            request.setAttribute("status", status);
            request.setAttribute("barberAdded", barberAdded);
            request.setAttribute("mss", mss);
            request.getRequestDispatcher("BookingSucces.jsp").forward(request, response);
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
