/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.OrderDAO;
import Dal.Order_servicesDAO;
import Dal.ServicesDAO;
import Model.Order;
import Model.Services;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import javax.swing.plaf.metal.MetalIconFactory;

/**
 *
 * @author phamt
 */
public class UpdateAppointmentController extends HttpServlet {

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
        String date = request.getParameter("date");
        String[] idServices = request.getParameterValues("services");
        String shift = request.getParameter("shift");
        String oId = request.getParameter("orderID");
        List<Services> services = new ServicesDAO().GetAllServices();
        PrintWriter out = response.getWriter();
        

        //total new order
        int total = 0;
        for (String idService : idServices) {
            int id = Integer.parseInt(idService);
            for (Services service : services) {
                if(id == service.getServicesId()){
                    total += service.getPrice();
                    break;
                }
            }
        }
        //update order with new info
        new OrderDAO().upDateOrder(date,shift,oId,total);
        //delete old services before update
        new Order_servicesDAO().deleteAllServices(oId);
        //insert new services to order
        for (String id : idServices) {
            new Order_servicesDAO().InsertServices(oId, id);
        }
        response.sendRedirect("viewAppountController");
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
