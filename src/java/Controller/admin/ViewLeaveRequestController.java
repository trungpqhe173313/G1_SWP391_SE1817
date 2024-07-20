/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.EmployeesDAO;
import Dal.LeaveRequestStatusDAO;
import Dal.LeaveRequestsDAO;
import Model.Employee;
import Model.LeaveRequestStatus;
import Model.LeaveRequests;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author LINHNTHE170290
 * viewleaverequest
 */
public class ViewLeaveRequestController extends HttpServlet {

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
        List<LeaveRequests> listR = new LeaveRequestsDAO().getAll();
        List<LeaveRequests> approvedRequests = listR.stream()
                .filter(x -> x.getStatusId()== 2)
                .collect(Collectors.toList());
        List<LeaveRequests> cancelledRequests = listR.stream()
                .filter(x -> x.getStatusId()== 3)
                .collect(Collectors.toList());
        List<LeaveRequests> Requests = listR.stream()
                .filter(x -> x.getStatusId()== 1)
                .collect(Collectors.toList());
        List<Employee> lE = new EmployeesDAO().getAllEmployee();
        List<LeaveRequestStatus> statusRequest = new LeaveRequestStatusDAO().getAll();
        
        request.setAttribute("cRequests", cancelledRequests);
        request.setAttribute("lE", lE);
        request.setAttribute("stauts", statusRequest);
        request.setAttribute("aRequests", approvedRequests);
        request.setAttribute("Requests", Requests);
        request.getRequestDispatcher("checkRequest.jsp").forward(request, response);
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
