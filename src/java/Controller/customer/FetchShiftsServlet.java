/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.ShiftsDAO;
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
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xdrag
 */
public class FetchShiftsServlet extends HttpServlet {

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
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String todayStr = today.format(formatter);
        
        List<Shift> shifts;
        if (selectedDate.equals(todayStr)) {
            shifts = d.getAllShiftFromNow();
        }else
            shifts = d.getAll();
        session.setAttribute("time", new Time(selectedDate, shifts));
        // Set content type và encoding của response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Convert danh sách shifts sang JSON và gửi về client
        PrintWriter out = response.getWriter();
        out.print(buildJSONResponse(shifts));
        out.flush();
    }

    // Hàm để xây dựng JSON response từ danh sách Shift
    private String buildJSONResponse(List<Shift> shifts) {
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < shifts.size(); i++) {
            Shift shift = shifts.get(i);
            json.append("{");
            json.append("\"id\":").append(shift.getId()).append(",");
            json.append("\"startTime\":\"").append(shift.getStartTime()).append("\"");
            json.append("}");
            if (i < shifts.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");
        return json.toString();
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
