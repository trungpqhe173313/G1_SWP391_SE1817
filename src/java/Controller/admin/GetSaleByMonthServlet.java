/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.admin;

import Dal.ShopDAO;
import Model.Employee;
import Model.ViewSale;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import org.apache.tomcat.jakartaee.commons.lang3.math.NumberUtils;

/**
 *
 * @author xdrag
 */
public class GetSaleByMonthServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ShopDAO d = new ShopDAO();
        String month_str = request.getParameter("month");
        if (NumberUtils.isNumber(month_str) == true) {
            int month = Integer.parseInt(month_str);
            List<Employee> listAllEmployee = d.getAllEmployee();
        List<ViewSale> listViewSale = new ArrayList<>();
        for (Employee e : listAllEmployee) {
            ViewSale vs = new ViewSale();
            vs.setEmployee(e);
            vs.setTotalOrder(d.getNumberOrderByBarber(month, e.getEmployeeId()));
            vs.setRevenue(d.getRevenueByBarber(month, e.getEmployeeId()));
            vs.setAvatar(d.getAvatarByEmployeeId(e.getEmployeeId()));
            listViewSale.add(vs);
        }

        List<Employee> listTop3 = d.getAllTop3Barber(month);
        List<ViewSale> listViewSaleTop3 = new ArrayList<>();
        for (Employee e : listTop3) {
            ViewSale vs = new ViewSale();
            vs.setEmployee(e);
            vs.setTotalOrder(d.getNumberOrderByBarber(month, e.getEmployeeId()));
            vs.setRevenue(d.getRevenueByBarber(month, e.getEmployeeId()));
            vs.setAvatar(d.getAvatarByEmployeeId(e.getEmployeeId()));
            listViewSaleTop3.add(vs);
        }
        List<Integer> listMonthRevenue = d.getMonthRevenue();
        request.setAttribute("listMonthRevenue", listMonthRevenue);
        request.setAttribute("monthSelect", month);
        request.setAttribute("listViewSaleTop3", listViewSaleTop3);
        request.setAttribute("listViewSale", listViewSale);
        request.getRequestDispatcher("viewSale.jsp").forward(request, response);
        }
        else{
            request.getRequestDispatcher("viewsale").forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
