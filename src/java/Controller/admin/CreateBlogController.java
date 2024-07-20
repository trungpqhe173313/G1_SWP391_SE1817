/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.admin;

import Controller.common.addimg;
import Dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, //1mb
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 20)
/**
 *
 * @author ducth
 */
@WebServlet(name="CreateBlogController", urlPatterns={"/createblog"})
public class CreateBlogController extends HttpServlet {
   private static final long serialVersionUID = 1L;
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
            out.println("<title>Servlet CreateBlogController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateBlogController at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("CreateBlog.jsp").forward(request, response);
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
        // Lấy thông tin từ request
        String title = request.getParameter("title");
        String content = request.getParameter("content");
//        String image = request.getParameter("image");
        addimg img = new addimg();
        Part part = request.getPart("image");
        String fileName = img.extractFileName(part);
        fileName = new File(fileName).getName();
        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = request.getServletContext().getRealPath("/") + "img/service" + File.separator + fileName;
            part.write(uploadPath);
        }
        String image = (fileName != null && !fileName.isEmpty()) ? fileName : request.getParameter("image");
        // Gọi đến DAO để thêm mới blog
        BlogDAO blogDAO = new BlogDAO();
        blogDAO.createBlog(title, content, image);

        response.sendRedirect(request.getContextPath() + "/bloglistadmin");
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
