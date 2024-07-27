/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.EmployeesDAO;
import Dal.Order_shiftDAO;
import Dal.ShiftsDAO;
import Model.ServicesBooking;
import Model.Shift;
import Model.Time;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xdrag
 */
public class FetchDateServlet extends HttpServlet {

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
        // Đọc thông tin ngày từ request
        String selectedDate = request.getParameter("date");
        // Lấy ngày hôm nay
        LocalDateTime today = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String todayStr = today.format(formatter);
        
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
            String formattedTime = today.format(timeFormatter);
        List<Shift> shifts;
        if (selectedDate.equals(todayStr)) {
            shifts = d.getAllShiftFromNow(formattedTime);
        } else {
            shifts = d.getAll();
        }
        if (session.getAttribute("services") != null) {
            ServicesBooking servicesBooking = (ServicesBooking) session.getAttribute("services");
            List<Shift> listShiftNeed = new ArrayList<>();
            if (!shifts.isEmpty()) {
                for (int i = 0; i < servicesBooking.getListServices().size(); i++) {
                    listShiftNeed.add(shifts.get(i));
                }
                request.setAttribute("listShiftNeed", listShiftNeed);
            } else {
                request.setAttribute("mss", "Hôm nay đã hết ca vui lòng chọn ngày khác");
            }
        }
        // danh sach luu nhung ca trong
        List<Shift> listShift = listShiftEmpty(shifts, selectedDate);
        session.setAttribute("time", new Time(selectedDate, listShift));

        // Chuyển hướng đến servlet appointment
        response.sendRedirect("appointment");
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
