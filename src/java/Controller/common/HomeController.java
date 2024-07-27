/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.common;

import Dal.CustomerDAO;
import Dal.FeedbackDAO;
import Dal.ServicesDAO;
import Dal.StoreDAO;
import Dal.VoucherDAO;
import Model.Customer;
import Model.Feedback;
import Model.Services;
import Model.Store;
import Model.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
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

//         for (Feedback feedback : feedbackList) {
//            System.out.println(feedback.toString());
//        }
        StoreDAO sd = new StoreDAO();
        LocalDate today = LocalDate.now();
        System.out.println("remind store da dc chay");
        Store s = sd.getStore();
        if (today.isAfter(s.getStartDate().minusDays(1)) && today.isBefore(s.getEndDate().plusDays(1))) {
            s.setIsActive(false);
            sd.UpdateStore(s);
        } else {
            s.setIsActive(true);
            sd.UpdateStore(s);
        }
        VoucherDAO vdao = new VoucherDAO();
        List<Voucher> todaysVouchers = vdao.getTodaysVouchers();
        request.setAttribute("todaysVouchers", todaysVouchers);
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
