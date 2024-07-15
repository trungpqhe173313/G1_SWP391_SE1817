/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.StoreDAO;
import Model.Store;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

/**
 *
 * @author xdrag
 */
public class CancelStoreHolidayScheduleServlet extends HttpServlet {

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
        StoreDAO sd = new StoreDAO();
        String mss;
        try {
            Store s = sd.getStore();
            if (s != null) {
                LocalDate today = LocalDate.now();
                if (!today.isBefore(s.getStartDate().plusDays(1))
                        || (!today.isAfter(s.getStartDate().minusDays(1)) && !today.isBefore(s.getEndDate().plusDays(1)))) {
                request.getRequestDispatcher("storeholidayschedule").forward(request, response);
                return;
                }
                s.setStartDate(today.minusDays(1));
                s.setEndDate(today.minusDays(1));
                sd.UpdateStore(s);
                mss = "Hủy thành công";
                request.setAttribute("mss", mss);
                request.getRequestDispatcher("storeholidayschedule").forward(request, response);
            } else {
                mss = "Hủy không thành công";
                request.setAttribute("mss", mss);
                request.getRequestDispatcher("storeholidayschedule").forward(request, response);
            }
        } catch (Exception e) {
            mss = "Hủy không thành công";
            request.setAttribute("mss", mss);
            request.getRequestDispatcher("storeholidayschedule").forward(request, response);
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
