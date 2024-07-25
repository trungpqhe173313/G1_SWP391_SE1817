package Controller.admin;

import Controller.common.addimg;
import Dal.EmployeesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import jakarta.servlet.annotation.MultipartConfig;
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, //1mb
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 20)
/**
 * Servlet implementation class AddEmployeeController
 */
@WebServlet(name = "AddEmployeeController", urlPatterns = {"/addemployee"})
public class AddEmployeeController extends HttpServlet {
   
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddEmployeeController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddEmployeeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

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
        // Forward GET requests to the JSP page for displaying the form
        request.getRequestDispatcher("/addemployees.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Extract parameters from the request
        String phone = request.getParameter("phone");
        String fullName = request.getParameter("fullName");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        boolean gender = "male".equals(request.getParameter("gender")); // true cho nam, false cho nữ
        addimg img = new addimg();
        Part part = request.getPart("avatar");
        String fileName = img.extractFileName(part);
        fileName = new File(fileName).getName();
        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = request.getServletContext().getRealPath("/") + "img/service" + File.separator + fileName;
            part.write(uploadPath);
        }
        String avatar = (fileName != null && !fileName.isEmpty()) ? fileName : request.getParameter("avatar");

        // Create an instance of EmployeesDAO
        EmployeesDAO employeesDAO = new EmployeesDAO();

        // Call the method to add an employee
        boolean success = employeesDAO.addEmployee(phone, fullName, pass, email, gender, 1, avatar);

        // Forward the request to a JSP page with a result message
        response.sendRedirect(request.getContextPath() + "/employeesdetail");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
