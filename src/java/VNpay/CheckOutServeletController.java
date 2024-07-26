/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package VNpay;

import Dal.CustomerDAO;
import Dal.DiscountDAO;
import Dal.EmployeesDAO;
import Dal.OrderDAO;
import Dal.ServicesDAO;
import Dal.VoucherDAO;
import Model.Customer;
import Model.Discount;
import Model.Services;
import Model.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author phamt
 */
public class CheckOutServeletController extends HttpServlet {
   
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
        //get order id
        String oId = request.getParameter("Oid");
        //get customer ID
        int cId = Integer.parseInt(request.getParameter("cId"));
        //get code order
        String orderCode = request.getParameter("codeOrder");
        List<Services> ls= new ServicesDAO().getServicesInOrder(Integer.parseInt(oId));
        int amount = 0;
        for (Services l : ls) {
            amount += l.getPrice();
        }
        //get info voucher
        List<Voucher> voucher =  new VoucherDAO().getAllVouchers();
        //get voucher active
        List<Voucher> voucherActive = voucher.stream()
                .filter(v -> v.getStatus() == 1)
                .collect(Collectors.toList());
        int amountVoucher = 0;
        HashMap<String, Integer> voucherMap = new HashMap<>();
        if(!voucherActive.isEmpty()|| voucherActive != null){
             for (Voucher voucher1 : voucherActive) {
                amountVoucher = Math.round(amount * voucher1.getDiscount());
                amount -= amountVoucher;
                voucherMap.put(voucher1.getName(),amountVoucher);
            }
        }
        String Eid = request.getParameter("Eid");
        //update status employee to free(id = 1)
        new EmployeesDAO().updateStatusBarber(1,Eid);
        Customer c = new CustomerDAO().getCustomerProfileById(cId);
        //get discount points min
        List<Discount> ld = new DiscountDAO().getAllDis();
        Discount minDiscount = ld.get(0);
        request.setAttribute("cus", c);
        request.setAttribute("ls", ls);
        request.setAttribute("codeOrder", orderCode);
        request.setAttribute("minDiscount", minDiscount);
        request.setAttribute("voucherMap", voucherMap);
        request.setAttribute("amount", amount);
        request.getRequestDispatcher("payment.jsp").forward(request, response);
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
