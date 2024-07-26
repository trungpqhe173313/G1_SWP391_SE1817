/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.CustomerDAO;
import Dal.OrderDAO;
import Model.Customer;
import Model.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author phamt
 */
public class CheckInController extends HttpServlet {

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
        String phone = request.getParameter("phoneNumber");
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerByP(phone);
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
        out.println("</head>");
        out.println("<body>");

        if (customer == null) {
            // Xử lý khi khách hàng không tồn tại
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("icon: 'info',");
            out.println("title: 'Khách hàng mới',");
            out.println("text: 'Khách hàng này chưa có trong hệ thống. Bạn có muốn đặt lịch mới không?',");
            out.println("showCancelButton: true,");
            out.println("confirmButtonText: 'Đặt lịch',");
            out.println("cancelButtonText: 'Hủy bỏ'");
            out.println("}).then((result) => {");
            out.println("if (result.isConfirmed) {");
            out.println("window.location.href = 'createAppointment?phone=" + phone + "';");
            out.println("} else {");
            out.println("window.history.back();");
            out.println("}");
            out.println("});");
            out.println("</script>");
        } else {
            Order order = new OrderDAO().getOrderByAId(customer.getCustomerId());
            if (order == null) {
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("icon: 'info',");
                out.println("title: 'Chưa có lịch',");
                out.println("text: 'Khách hàng này chưa có lịch hẹn. Bạn có muốn đặt lịch mới không?',");
                out.println("showCancelButton: true,");
                out.println("confirmButtonText: 'Đặt lịch',");
                out.println("cancelButtonText: 'Hủy bỏ'");
                out.println("}).then((result) => {");
                out.println("if (result.isConfirmed) {");
                out.println("window.location.href = 'createAppointment?phone=" + phone + "';");
                out.println("} else {");
                out.println("window.history.back();");
                out.println("}");
                out.println("});");
                out.println("</script>");
            } else {
                int oId = order.getId();
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("icon: 'success',");
                out.println("title: 'Thành công',");
                out.println("text: 'Đang chuyển hướng đến chi tiết lịch đặt.'");
                out.println("}).then((result) => {");
                out.println("if (result.isConfirmed) {");
                out.println("window.location.href = 'viewOrderDetailUpdate?Oid=" + oId + "';");
                out.println("}");
                out.println("});");
                out.println("</script>");
            }
        }

        out.println("</body>");
        out.println("</html>");
        out.close();
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
