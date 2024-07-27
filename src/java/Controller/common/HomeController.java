/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.common;

import Dal.CustomerDAO;
import Dal.EmployeesDAO;
import Dal.FeedbackDAO;
import Dal.LeaveRequestStatusDAO;
import Dal.ServicesDAO;
import Dal.VoucherDAO;
import Model.Customer;
import Model.Employee;
import Model.Feedback;
import Model.LeaveRequests;
import Model.Services;
import Model.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author phamt
 */
public class HomeController extends HttpServlet {

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
        ServicesDAO dao = new ServicesDAO();
        List<Services> se = dao.GetAllServices();
        request.setAttribute("listS", se);
        List<Services> t = dao.getTopServices();
        request.setAttribute("listT", t);
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<Feedback> feedbackList = feedbackDAO.getAllFeedbacks();
        request.setAttribute("feedbackList", feedbackList);

        CustomerDAO customerDAO = new CustomerDAO();
        List<Customer> cusList = customerDAO.getAllCustomer();
        request.setAttribute("cusList", cusList);
        updateEmployeeStatus();
        //Kiểm tra xem có ai xin nghỉ phép chuyển sang nghỉ làm
        VoucherDAO vdao = new VoucherDAO();
        List<Voucher> todaysVouchers = vdao.getTodaysVouchers();
        request.setAttribute("todaysVouchers", todaysVouchers);
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
    }

    public void updateEmployeeStatus() {
        // Bước 1: Lấy danh sách các employeeId đang có đơn xin nghỉ phép
        List<Integer> Eid = new LeaveRequestStatusDAO().getBarberId();

        if (Eid != null && !Eid.isEmpty()) {
            // Bước 2: Cập nhật trạng thái của những nhân viên đang có đơn xin nghỉ phép sang trạng thái 4
            for (Integer integer : Eid) {
                String employeeId = integer.toString();
                new EmployeesDAO().updateStatusBarber(4, employeeId);
            }

            // Bước 3: Lấy danh sách tất cả nhân viên
            List<Employee> employees = new EmployeesDAO().getAllEmployee();
            for (Employee employee : employees) {
                // Kiểm tra nếu nhân viên không có trong danh sách Eid và đang có trạng thái 4
                for (Integer integer : Eid) {
                    if (integer != employee.getEmployeeId() && employee.getStatusId() == 4) {
                        // Cập nhật trạng thái của những nhân viên này sang trạng thái 1
                        new EmployeesDAO().updateStatusBarber(1, employee.getEmployeeId() + "");
                    }
                }
            }
        } else {
            // Nếu không có đơn xin nghỉ nào, chuyển tất cả nhân viên có trạng thái 4 sang trạng thái 1
            List<Employee> employees = new EmployeesDAO().getAllEmployee();
            for (Employee employee : employees) {
                if (employee.getStatusId() == 4) {
                    new EmployeesDAO().updateStatusBarber(1, employee.getEmployeeId() + "");
                }
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
//        ServicesDAO dao = new ServicesDAO();
//        List<Services> se = dao.GetAllServices();
//        request.setAttribute("listS", se);
//        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
