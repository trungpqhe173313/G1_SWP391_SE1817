/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.CustomerDAO;
import Dal.EmployeesDAO;
import Dal.OrderDAO;
import Dal.Order_servicesDAO;
import Dal.ServicesDAO;
import Dal.ShiftsDAO;
import Dal.StatusDAO;
import Model.Customer;
import Model.Employee;
import Model.Order;
import Model.Services;
import Model.Shift;
import Model.Status;
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
public class ViewOrderDetatailUpdateController extends HttpServlet {

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
            out.println("<title>Servlet ViewOrderDetatailUpdateController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewOrderDetatailUpdateController at " + request.getContextPath() + "</h1>");
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
        int oid = Integer.parseInt(request.getParameter("Oid"));
        //get info sevices of order
        List<Services> services = new ServicesDAO().getServicesInOrder(oid);
        List<Order> ListOrder = new OrderDAO().getAllOrder();
        Order detailOrder = new Order();
        for (Order order : ListOrder) {
            if (order.getId() == oid) {
                detailOrder = order;
                break;
            }
        }
        //get info customer
        Customer infoCustumer = new Customer();
        List<Customer> ListCustomer = new CustomerDAO().getAllCustomer();
        for (Customer custumer : ListCustomer) {
            if (custumer.getCustomerId() == detailOrder.getCustomerId()) {
                infoCustumer = custumer;
                break;
            }
        }

        //get info barber
        List<Employee> ListEmployee = new EmployeesDAO().getAllEmployee();
        //Get info barber free
        Employee BarberFree = new EmployeesDAO().getBarberFree();
        //get info status
        List<Status> status = new StatusDAO().getAll();
        //get info services
        List<Services> ListServices = new ServicesDAO().GetAllServices();
        request.setAttribute("services", services);
        request.setAttribute("infoCustumer", infoCustumer);
        request.setAttribute("detailOrder", detailOrder);
        request.setAttribute("ListServices", ListServices);
        request.setAttribute("status", status);
        request.setAttribute("BarberFree", BarberFree);
        request.setAttribute("ListEmployee", ListEmployee);
        request.getRequestDispatcher("viewDetailOrder.jsp").forward(request, response);
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
        String[] idServices = request.getParameterValues("services");
        String status = request.getParameter("status");
        int IdStatus = Integer.parseInt(status);
        String oId = request.getParameter("Oid");
        String Eid = request.getParameter("employee") + "";
        List<Services> services = new ServicesDAO().GetAllServices();
        PrintWriter out = response.getWriter();
        
        if (Eid.equals("") && IdStatus == 1 || Eid.equals("") && IdStatus == 2) {
            //total new order
            int total = 0;
            for (String idService : idServices) {
                int id = Integer.parseInt(idService);
                for (Services service : services) {
                    if (id == service.getServicesId()) {
                        total += service.getPrice();
                        break;
                    }
                }
            }

            //update order with new info
            new OrderDAO().upDateOrderAdmin(Eid, "2", oId, total);
            //delete old services before update
            new Order_servicesDAO().deleteAllServices(oId);
            //insert new services to order
            for (String id : idServices) {
                new Order_servicesDAO().InsertServices(oId, id);
            }
            response.sendRedirect("getOrderManager");
        } else if (!Eid.equals("") && IdStatus == 1 || !Eid.equals("") && IdStatus == 2) {
            //total new order
            int total = 0;
            for (String idService : idServices) {
                int id = Integer.parseInt(idService);
                for (Services service : services) {
                    if (id == service.getServicesId()) {
                        total += service.getPrice();
                        break;
                    }
                }
            }
            //delete old services before update
            new Order_servicesDAO().deleteAllServices(oId);
            //insert new services to order
            for (String id : idServices) {
                new Order_servicesDAO().InsertServices(oId, id);
            }
            Employee barber = new EmployeesDAO().getBarberByID(Eid);
            if (barber.getStatusId() == 1) {
                //update new status of barber
                response.getWriter().print(barber.getStatusId());
                new EmployeesDAO().updateStatusBarber(2, Eid);
                //update order with new info
                new OrderDAO().upDateOrderAdmin(Eid, "3", oId, total);
                response.sendRedirect("getOrderManager");
            } else {
                response.getWriter().print(barber.getStatusId());
                //update order with new info
                new OrderDAO().upDateOrderAdmin(Eid, "2", oId, total);
                //delete old services before update
                response.sendRedirect("getOrderManager");
            }
            
        } else {
            response.sendRedirect("getOrderManager");
        }
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
