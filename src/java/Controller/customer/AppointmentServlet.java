/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.CustomerDAO;
import Dal.EmployeesDAO;
import Dal.OrderDAO;
import Dal.Order_shiftDAO;
import Dal.ShiftsDAO;
import Dal.ShopDAO;
import Model.Account;
import Model.Order;
import Model.Services;
import Model.ServicesBooking;
import Model.Shift;
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
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            request.getRequestDispatcher("login").forward(request, response);
        } else {
            ShiftsDAO d = new ShiftsDAO();
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
                //Lay ra tat ca cac ca 
                List<Shift> listAllShift = d.getAllShiftFromNow();
                //tao danh sach de luu nhung ca trong
                List<Shift> listShift = listShiftEmpty(listAllShift, todayStr);

                session.setAttribute("time", new Time(todayStr, listShift));
            } else if (session.getAttribute("time") != null) {
                Time time = (Time) session.getAttribute("time");
                    //Lay ra tat ca cac ca 
                    List<Shift> listAllShift = d.getAllShiftFromNow();
                    //tao danh sach de luu nhung ca trong
                    List<Shift> listShift = listShiftEmpty(listAllShift, time.getDate());
                    session.setAttribute("time", new Time(time.getDate(), listShift));
                
            }

            request.setAttribute("listDate", listDate);
            request.getRequestDispatcher("booking.jsp").forward(request, response);
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
        String date_str = request.getParameter("date");
        String shift_str = request.getParameter("shifts");
        try {
            HttpSession session = request.getSession();
            CustomerDAO cd = new CustomerDAO();
            Account a = (Account) session.getAttribute("account");
            int customerId = cd.getCustomerByP(a.getPhone()).getCustomerId();

            OrderDAO d = new OrderDAO();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            //ep kieu string sang date truoc roi tao ra mot cai sql date
            Date date;

            date = new java.sql.Date(sdf.parse(date_str).getTime());
            ServicesBooking sb = (ServicesBooking) session.getAttribute("services");
            Order o = new Order(customerId, 1, date, sb.getTotalMoney(), Integer.parseInt(shift_str));
            d.AddOrder(o);
            int orderId = d.getNewOrderId();
            List<Services> listServices = sb.getListServices();
            for (Services s : listServices) {
                d.AddOrder_services(s.getServicesId(), orderId);
            }
            ShiftsDAO sd = new ShiftsDAO();
            ShopDAO shopDao = new ShopDAO();
            session.removeAttribute("time");
            session.removeAttribute("services");
            request.setAttribute("listServices", listServices);
            request.setAttribute("shifts", sd.getShiftById(o.getShiftsID()));
            request.setAttribute("order", o);
            request.setAttribute("status", shopDao.getStatusById(o.getStatusId()));
            request.setAttribute("mss", "Đặt Thành Công");
        } catch (Exception e) {
        }

        request.getRequestDispatcher("BookingSucces.jsp").forward(request, response);

    }

    /**
     *
     * @param shift to check is that shift empty
     * @param date
     * @return boolean
     */
    public List<Shift> listShiftEmpty(List<Shift> listShift, String date) {
        List<Shift> listShiftEmpty = new ArrayList<>();
        Order_shiftDAO osd = new Order_shiftDAO();
        EmployeesDAO ed = new EmployeesDAO();
        int numberEmployeeActive = ed.countNumberActiveEmployee();
        for (Shift s : listShift) {
            if (numberEmployeeActive > osd.countNumberOrderInShift(s.getId(), date)) {
                listShiftEmpty.add(s);
            }
        }
        return listShiftEmpty;
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
