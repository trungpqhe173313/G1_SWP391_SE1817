/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.Order_servicesDAO;
import Dal.OrdersDAO;
import Model.Account;
import Model.Order_services;
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
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

/**
 *
 * @author phamt
 */
public class GetAppointmentController extends HttpServlet {

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
            out.println("<title>Servlet GetAppointmentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetAppointmentController at " + request.getContextPath() + "</h1>");
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

        // lay ra cac ca de hien thi
        List<Shifts> listShift = d.getAllShifts();
        //lay ra cac barber hoat dong
        List<Account> listBarber = d.getAllBarber();
        //lay ra danh sach cac dich vu
        List<Services> listServices = d.getAllServices();
        //tao danh sach ngay de hien thi
        List<String> listDate = new ArrayList<>();
        HttpSession s = request.getSession();
        Account account = (Account) s.getAttribute("account");
        int aid = account.getId();
        //lay ra lich hen cat
        Orders order = d.getAppointment(aid);
        if (order == null) {
            request.setAttribute("ms", "no booking");
            request.getRequestDispatcher("appointment.jsp").forward(request, response);
        } else {
            //lay ra bang trung gian
            List<Order_services> Order_services = new Order_servicesDAO().getAppointmentByOid(order.getId(), true);
            //lua id cac dich vu da chon
            Set<Integer> selectedServiceIds = new HashSet<>();
            for (Order_services os : Order_services) {
                selectedServiceIds.add(os.getServiceId());
            }
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
            request.setAttribute("selectedServiceIds", selectedServiceIds);
            request.setAttribute("o", order);
            request.setAttribute("listBarber", listBarber);
            request.setAttribute("listServices", listServices);
            request.setAttribute("listDate", listDate);
            request.getRequestDispatcher("appointment.jsp").forward(request, response);
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
        int orderId = Integer.parseInt(request.getParameter("oid"));
        String[] services_id = request.getParameterValues("selectedServices");
        Orders order = new Orders();
        try {
            order.setId(orderId);
            order.setAccountID(account.getId());
            order.setEmployeeId(Integer.parseInt(barber));

            //ep kieu String sang date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            //ep kieu string sang date truoc roi tao ra mot cai sql date
            Date date = new java.sql.Date(sdf.parse(date_raw).getTime());
            //lay ra order truoc khi update
            List<Order_services> orderServicesOld = new Order_servicesDAO().getAppointmentByOid(orderId, true);
            List<Integer> oldServicesId = new LinkedList<>();
            for (Order_services order_services : orderServicesOld) {
                int oldInt = order_services.getServiceId();
                oldServicesId.add(oldInt);
            }
            order.setOrderDate(date);
            order.setShiftsID(Integer.parseInt(shifts));
            order.setStatusId(1);
            //delete dich vu ko dc chon
            List<Integer> newServicesId = new LinkedList<>();
            for (String id : services_id) {
                newServicesId.add(Integer.parseInt(id));
            }
            HashSet<Integer> setNewServices = new HashSet<>(newServicesId);
            for (Integer old : oldServicesId) {
                if (!setNewServices.contains(old)) {
                    new Order_servicesDAO().deleteOrder_Services(orderId, old);
                }
            }
            //add dich vu 
            HashSet<Integer> setOldServices = new HashSet<>(oldServicesId);
            for (Integer newId : setNewServices) {
                if (!setOldServices.contains(newId)) {
                    new Order_servicesDAO().addOrder_Services(orderId, newId);
                }
            }
            for (String newServices : services_id) {
                int newId = Integer.parseInt(newServices);
            }

            //tong tien dich vu
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
            d.updateOrder(order);

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
            Statuses status = d.getStatusesById(order.getStatusId());
            // lay barber da dat
            Account barberAdded = d.getAccountsById(order.getEmployeeId());
            // lay shifts da dat
            Shifts shiftsAdded = d.getShiftsById(order.getShiftsID());
            //thong bao dat lich thanh cong
            String mss = "Update Successfully";
            //cac dich vu da dat
            request.setAttribute("listServicesAdded", listServicesAdded);
            request.setAttribute("NewOrder", order);
            request.setAttribute("ShiftsAdded", shiftsAdded);
            request.setAttribute("status", status);
            request.setAttribute("barberAdded", barberAdded);
            request.setAttribute("mss", mss);
            request.getRequestDispatcher("updateSucces.jsp").forward(request, response);
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
