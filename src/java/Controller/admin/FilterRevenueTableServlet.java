/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.admin;

import Dal.ServicesDAO;
import Dal.ShopDAO;
import Model.Order;
import Model.OrderRevenue;
import Model.Services;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author xdrag
 */
public class FilterRevenueTableServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet FilterRevenueTableServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterRevenueTableServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String month_str = request.getParameter("month");
        String startDate_str = request.getParameter("startdate");
        String endDate_str = request.getParameter("enddate");
        if (month_str.isEmpty() || startDate_str.isEmpty() 
                || endDate_str.isEmpty()) {
            request.getRequestDispatcher("viewrevenue").forward(request, response);
        }
        try {
            ShopDAO d = new ShopDAO();

        // Lấy tháng (dạng số)
        int currentMonthNumber = Integer.parseInt(month_str);
        int revenueThisMonth = d.getRevenueByMonth(currentMonthNumber);
        int revenueThisYear = d.getRevenueThisYear();
        int numberOrderThisMonth = d.getNumberOrderByMonth(currentMonthNumber);
        List<Order> listOrderDefault = d.getOrderFromTo(startDate_str, endDate_str);
        List<OrderRevenue> listOrder = new ArrayList<>();

        for (Order o : listOrderDefault) {
            OrderRevenue or = new OrderRevenue();
            or.setOrder(o);
            or.setCustomer(d.getCustomerById(o.getCustomerId()));
            or.setEmployee(d.getEmployeeById(o.getEmployeeId()));
            or.setServices(d.getServicesByOrderId(o.getId()));
            or.setShift(d.getListShiftByOrderId(o.getId()));
            or.setStatus(d.getStatusById(o.getStatusId()));
            listOrder.add(or);
        }

        //lay ra du lieu cho bieu do tron thong ke so luot su dung dich vu
        HashMap<String, Integer> mapServices = new HashMap<>();
        ServicesDAO servicesDao = new ServicesDAO();
        List<Services> listServices = servicesDao.GetAllServices();
        for (Services service : listServices) {
            mapServices.put(service.getName(), servicesDao.countServicesByMonth(service.getServicesId(), currentMonthNumber));
        }
        //lay ra du lieu cho bieu do cot ti le doanh thu cho cua tung thang
        HashMap<Integer, Integer> mapRevenue = new HashMap<>();
        List<Integer> listMonthRevenue = d.getMonthRevenue();
        for (Integer month : listMonthRevenue) {
            //lay ra doanh thu thang
            int revenueMonth = d.getRevenueByMonth(month);
            //lay ra doanh thu nam
            int revenueYear = d.getRevenueThisYear();
            //lay ra phan tram cua thang so voi tong 
            int percent = (int)(((double)revenueMonth / revenueYear) * 100);
            mapRevenue.put(month,  percent);
        }
        request.setAttribute("startdate", startDate_str);
        request.setAttribute("enddate", endDate_str);
        request.setAttribute("mapRevenue", mapRevenue);
        request.setAttribute("mapServices", mapServices);
        request.setAttribute("listMonthRevenue", listMonthRevenue);
        request.setAttribute("monthSelect", currentMonthNumber);
        request.setAttribute("rm", revenueThisMonth);
        request.setAttribute("ry", revenueThisYear);
        request.setAttribute("nom", numberOrderThisMonth);
        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("viewrevenue").forward(request, response);
        }
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
