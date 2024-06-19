/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.ShopDAO;
import Model.Employee;
import Model.ViewSale;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xdrag
 */
public class ViewSaleServlet extends HttpServlet {

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
        ShopDAO d = new ShopDAO();
        // Lấy ngày hiện tại
        LocalDate currentDate = LocalDate.now();

        // Lấy tháng hiện tại (dạng số)
        int currentMonthNumber = currentDate.getMonthValue();
        List<Employee> listAllEmployee = d.getAllEmployee();
        List<ViewSale> listViewSale = new ArrayList<>();
        for (Employee e : listAllEmployee) {
            ViewSale vs = new ViewSale();
            vs.setEmployee(e);
            vs.setTotalOrder(d.getNumberOrderByBarber(currentMonthNumber, e.getEmployeeId()));
            vs.setRevenue(d.getRevenueByBarber(currentMonthNumber, e.getEmployeeId()));
            vs.setAvatar(d.getAvatarByEmployeeId(e.getEmployeeId()));
            listViewSale.add(vs);
        }

        List<Employee> listTop3 = d.getAllTop3Barber(currentMonthNumber);
        List<ViewSale> listViewSaleTop3 = new ArrayList<>();
        for (Employee e : listTop3) {
            ViewSale vs = new ViewSale();
            vs.setEmployee(e);
            vs.setTotalOrder(d.getNumberOrderByBarber(currentMonthNumber, e.getEmployeeId()));
            vs.setRevenue(d.getRevenueByBarber(currentMonthNumber, e.getEmployeeId()));
            vs.setAvatar(d.getAvatarByEmployeeId(e.getEmployeeId()));
            listViewSaleTop3.add(vs);
        }
        request.setAttribute("listViewSaleTop3", listViewSaleTop3);
        request.setAttribute("listViewSale", listViewSale);
        request.getRequestDispatcher("viewSale.jsp").forward(request, response);
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
