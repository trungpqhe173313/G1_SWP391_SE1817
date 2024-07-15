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
import Dal.StoreDAO;
import Model.Account;
import Model.Order;
import Model.Services;
import Model.ServicesBooking;
import Model.Shift;
import Model.Store;
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
            StoreDAO sd = new StoreDAO();
            Store store = sd.getStore();
            //kiem tra xem cua hang co trong trang thai hoat dong khong
            if (store.isIsActive() == true) {
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
                List<Shift> listAllShift = null;
                List<Shift> listShift;
                if (session.getAttribute("time") == null) {
                    //Lay ra tat ca cac ca 
                    listAllShift = d.getAllShiftFromNow();
                    //tao danh sach de luu nhung ca trong
                    listShift = listShiftEmpty(listAllShift, todayStr);

                    session.setAttribute("time", new Time(todayStr, listShift));
                } else if (session.getAttribute("time") != null) {
                    Time time = (Time) session.getAttribute("time");
                    //Lay ra tat ca cac ca 
                    if (time.getDate().equals(todayStr)) {
                        listAllShift = d.getAllShiftFromNow();
                    } else {
                        listAllShift = d.getAll();
                    }
                    //tao danh sach de luu nhung ca trong
                    listShift = listShiftEmpty(listAllShift, time.getDate());
                    session.setAttribute("time", new Time(time.getDate(), listShift));

                }
                if (session.getAttribute("services") != null) {
                    ServicesBooking servicesBooking = (ServicesBooking) session.getAttribute("services");
                    List<Shift> listShiftNeed = new ArrayList<>();
                    int servicesSize = servicesBooking.getListServices().size();
                    if (!listAllShift.isEmpty() && listAllShift.size() >= servicesSize) {
                        for (int i = 0; i < servicesSize; i++) {
                            listShiftNeed.add(listAllShift.get(i));
                        }
                        request.setAttribute("listShiftNeed", listShiftNeed);
                    } else {
                        request.setAttribute("mss", "Hôm nay đã hết ca vui lòng chọn ngày khác");
                    }
                }

                request.setAttribute("listDate", listDate);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            } else {
                request.setAttribute("store", store);
                request.setAttribute("checkNotActive", true );
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            }
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
            ServicesBooking sb = (ServicesBooking) session.getAttribute("services");
            ShiftsDAO sd = new ShiftsDAO();
            List<Shift> listShiftNeed = sd.getAllNextShift(Integer.parseInt(shift_str),
                    sb.getListServices().size());
            if (!checkAllShiftEmpty(listShiftNeed, date_str)
                    || sb.getListServices().size() > listShiftNeed.size()) {

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
                request.setAttribute("listShiftNeed", listShiftNeed);
                request.setAttribute("shiftId", Integer.parseInt(shift_str));
                request.setAttribute("listDate", listDate);
                request.setAttribute("mss", "Đặt Không Thành Công Không đủ ca trống vui long chọn ca khác hoặc ngày khác");
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            } else {
                CustomerDAO cd = new CustomerDAO();
                Account a = (Account) session.getAttribute("account");
                int customerId = cd.getCustomerByP(a.getPhone()).getCustomerId();

                OrderDAO d = new OrderDAO();
                String orderCode = d.generateOrderCode();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                //ep kieu string sang date truoc roi tao ra mot cai sql date
                Date date = new java.sql.Date(sdf.parse(date_str).getTime());
                Order o = new Order(orderCode, customerId, 1, date, sb.getTotalMoney());
                d.AddOrder(o);
                int orderId = d.getNewOrderId();
                List<Services> listServices = sb.getListServices();
                for (Services s : listServices) {
                    d.AddOrder_services(s.getServicesId(), orderId);
                }
                Order_shiftDAO osd = new Order_shiftDAO();
                for (Shift s : listShiftNeed) {
                    osd.InsertShift("" + orderId, s.getId());
                }
                ShopDAO shopDao = new ShopDAO();
                session.removeAttribute("time");
                session.removeAttribute("services");
                request.setAttribute("listServices", listServices);
                request.setAttribute("ListShifts", listShiftNeed);
                request.setAttribute("order", o);
                request.setAttribute("status", shopDao.getStatusById(o.getStatusId()));
                request.setAttribute("mss", "Đặt Thành Công");
                request.getRequestDispatcher("BookingSucces.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    public boolean checkAllShiftEmpty(List<Shift> listShift, String date) {
        boolean check = true;
        Order_shiftDAO osd = new Order_shiftDAO();
        EmployeesDAO ed = new EmployeesDAO();
        int numberEmployeeActive = ed.countNumberActiveEmployee();
        for (Shift s : listShift) {
            if (numberEmployeeActive <= osd.countNumberOrderInShift(s.getId(), date)) {
                check = false;
                break;
            }
        }
        return check;
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
