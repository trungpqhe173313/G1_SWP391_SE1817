/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Service;

import Controller.common.addimg;
import Dal.ServicesDAO;
import Model.Services;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author LENOVO
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, //1mb
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 20)
public class UpdateService extends HttpServlet {

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
            out.println("<title>Servlet UpdateService</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateService at " + request.getContextPath() + "</h1>");
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
        int sid = Integer.parseInt(request.getParameter("sid"));
        ServicesDAO serviceDAO = new ServicesDAO();
        Services service = serviceDAO.getServiceById(sid);

        request.setAttribute("service", service);
        request.setAttribute("sid", sid);
        request.getRequestDispatcher("updateserrvice.jsp").forward(request, response);
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
    String serviceIdStr = request.getParameter("serviceId");
    String name = request.getParameter("name");

    String priceStr = request.getParameter("price");
    String description = request.getParameter("description");
    addimg img = new addimg();
        Part part = request.getPart("img");
        String fileName = img.extractFileName(part);
        fileName = new File(fileName).getName();
        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = request.getServletContext().getRealPath("/") + "img/service" + File.separator + fileName;
            part.write(uploadPath);
        }
        String image = (fileName != null && !fileName.isEmpty()) ? fileName : request.getParameter("img");
    // Validate parameters
    if (serviceIdStr == null || serviceIdStr.isEmpty() || 
        priceStr == null || priceStr.isEmpty() || 
        name == null || description == null) {
        request.setAttribute("mess", "đéo có");
        request.getRequestDispatcher("updateserrvice.jsp").forward(request, response);
        return;
    }

    try {
        int id = Integer.parseInt(serviceIdStr);
        int price = Integer.parseInt(priceStr);

        // Update service
        ServicesDAO serviceDAO = new ServicesDAO();
        serviceDAO.UpdateService(id, name, image, price, description);
        request.setAttribute("mess", "Cập nhật thành công");
    } catch (NumberFormatException e) {
        request.setAttribute("mess", "ngu");
    } 
    request.getRequestDispatcher("updateserrvice.jsp").forward(request, response);
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
