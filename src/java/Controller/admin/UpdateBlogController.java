package Controller.admin;

import Dal.BlogDAO;
import Model.Blog;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ducth
 */
@WebServlet(name="UpdateBlogController", urlPatterns={"/updateblog"})
public class UpdateBlogController extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateBlogController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBlogController at " + request.getContextPath () + "</h1>");
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
        int postId = Integer.parseInt(request.getParameter("postId"));
        BlogDAO blogDAO = new BlogDAO();
        Blog blog = blogDAO.getBlogById(postId);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("UpdateBlog.jsp").forward(request, response);
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
        response.setContentType("text/plain");
        
        // Get parameters from request
        int postId = Integer.parseInt(request.getParameter("postId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String image = request.getParameter("image");
        
        // Update blog in database
        BlogDAO blogDAO = new BlogDAO(); // Assuming BlogDAO handles database operations
        blogDAO.updateBlog(postId, title, content, null); // Pass null for image if not updating image
        
        // Prepare response
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
