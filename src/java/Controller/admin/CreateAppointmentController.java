/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.CustomerDAO;
import Dal.EmployeesDAO;
import Dal.OrderDAO;
import Dal.Order_servicesDAO;
import Dal.Order_shiftDAO;
import Dal.ServicesDAO;
import Dal.ShiftsDAO;
import Model.Customer;
import Model.Employee;
import Model.Order;
import Model.Services;
import Model.Shift;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import com.google.gson.JsonObject;
import java.time.LocalTime;
import java.util.Arrays;

/**
 *
 * @author phamt
 */
public class CreateAppointmentController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateAppointmentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateAppointmentController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String phone = request.getParameter("phone");
        Employee BarberFree = new EmployeesDAO().getBarberFree();
        List<Services> ListServices = new ServicesDAO().GetAllServices();
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String todayStr = today.format(formatter);
        
        // Lấy thời gian hiện tại
        LocalTime currentTime = LocalTime.now();
        
        // Định dạng giờ phút theo mẫu mong muốn
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
        String formattedTime = currentTime.format(timeFormatter);
        List<Shift> Lshift = listShiftEmpty(new ShiftsDAO().getAllShiftFromNow(formattedTime), todayStr);
        
        List<Employee> ListEmployee = new EmployeesDAO().getAllEmployee();
        LocalDate dateNow = LocalDate.now();
        Customer cus = new CustomerDAO().getCustomerByP(phone);
        if(cus != null){
            request.setAttribute("name", cus.getFullName());
        }
        request.setAttribute("phone", phone);
        request.setAttribute("BarberFree", BarberFree);
        request.setAttribute("Lshift", Lshift);
        request.setAttribute("date", dateNow);
        request.setAttribute("ListEmployee", ListEmployee);
        request.setAttribute("ListServices", ListServices);
        request.getRequestDispatcher("createAppointment.jsp").forward(request, response);
    }

    public List<Shift> listShiftEmpty(List<Shift> listShift, String date) {
        List<Shift> listShiftEmpty = new ArrayList<>();
        Order_shiftDAO osd = new Order_shiftDAO();
        EmployeesDAO ed = new EmployeesDAO();
        int numberEmployeeActive = ed.countNumberActiveEmployee();
        for (Shift s : listShift) {
            if (numberEmployeeActive > osd.countNumberOrderInShift(s.getId(), date)) {
                listShiftEmpty.add(s);
            }
        }
        return listShiftEmpty;
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
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        JsonObject jsonResponse = new JsonObject();

        try {
            String phone = request.getParameter("phone");
            String name = request.getParameter("name");
            String[] services = request.getParameterValues("services");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String Eid = request.getParameter("employee");

            List<Shift> listShiftNeed = new ShiftsDAO().getAllNextShift(Integer.parseInt(time), services.length);
            if (!checkAllShiftEmpty(listShiftNeed, date) || services.length > listShiftNeed.size()) {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Không đủ ca làm việc trống cho dịch vụ đã chọn.");
            } else {
                List<Services> Lservices = new ServicesDAO().GetAllServices();
                //kiểm tra xem có tồn tại khách hàng ko
                Customer Checkcustomer = new CustomerDAO().getCustomerByP(phone);
                if (Checkcustomer == null) {
                    Customer customer = new Customer();
                    customer.setFullName(name);
                    customer.setPhone(phone);
                    new CustomerDAO().addCustomer(customer);
                }else{
                    new CustomerDAO().updateCustomer(phone, name);
                }
                //lấy ra id customer mới nhất
                Customer cus = new CustomerDAO().getCustomerByP(phone);
                
                java.sql.Date sqlDate = null;
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date utilDate = sdf.parse(date);
                    sqlDate = new java.sql.Date(utilDate.getTime());
                } catch (Exception e) {
                    e.printStackTrace();
                    jsonResponse.addProperty("success", false);
                    jsonResponse.addProperty("message", "Lỗi khi phân tích ngày tháng.");
                    jsonResponse.addProperty("error", e.getMessage());
                    out.print(jsonResponse.toString());
                    out.close();
                    return;
                }

                int total = 0;
                for (String idService : services) {
                    int id = Integer.parseInt(idService);
                    for (Services service : Lservices) {
                        if (id == service.getServicesId()) {
                            total += service.getPrice();
                            break;
                        }
                    }
                }
                String orderCodee = OrderDAO.generateOrderCode();

                Order o;
                if (Eid == null || Eid.isEmpty()) {
                    o = new Order(orderCodee, cus.getCustomerId(), 2, sqlDate, total);
                } else {
                    o = new Order(orderCodee, cus.getCustomerId(), Integer.parseInt(Eid), 3, sqlDate, total);
                }
                new OrderDAO().AddOrder(o);

                String oId = new OrderDAO().getOrderByCode(orderCodee).getId() + "";
                for (String id : services) {
                    new Order_servicesDAO().InsertServices(oId, id);
                }
                for (Shift s : listShiftNeed) {
                    new Order_shiftDAO().InsertShift(oId, s.getId());
                }

                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("message", "Lịch hẹn đã được tạo thành công.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Có lỗi xảy ra khi tạo lịch hẹn mới.");
            jsonResponse.addProperty("error", e.getMessage()); // Thêm chi tiết lỗi vào phản hồi JSON
        } finally {
            out.print(jsonResponse.toString());
            out.close();
        }
    }

    public boolean checkAllShiftEmpty(List<Shift> listShift, String date) {
        boolean check = true;
        Order_shiftDAO osd = new Order_shiftDAO();
        EmployeesDAO ed = new EmployeesDAO();
        int numberEmployeeActive = ed.countNumberActiveEmployee();
        for (Shift s : listShift) {
            if (numberEmployeeActive <= osd.countNumberOrderInShift(s.getId(), date)) {
                check = false;
                break;
            }
        }
        return check;
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
