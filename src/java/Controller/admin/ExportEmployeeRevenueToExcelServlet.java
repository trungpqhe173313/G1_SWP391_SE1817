/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.ShopDAO;
import Model.Employee;
import Model.Order;
import Model.OrderRevenue;
import Model.ViewSale;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.tomcat.jakartaee.commons.lang3.math.NumberUtils;

/**
 *
 * @author xdrag
 */
public class ExportEmployeeRevenueToExcelServlet extends HttpServlet {

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
        String month_str = request.getParameter("month");
        if (NumberUtils.isNumber(month_str) == false) {
            response.sendRedirect("viewrevenue");
            return;
        }
        try {
            ShopDAO d = new ShopDAO();
            int month = Integer.parseInt(month_str);
            List<Employee> listAllEmployee = d.getAllEmployee();
            List<ViewSale> listViewSale = new ArrayList<>();
            for (Employee e : listAllEmployee) {
                ViewSale vs = new ViewSale();
                vs.setEmployee(e);
                vs.setTotalOrder(d.getNumberOrderByBarber(month, e.getEmployeeId()));
                vs.setRevenue(d.getRevenueByBarber(month, e.getEmployeeId()));
                vs.setAvatar(d.getAvatarByEmployeeId(e.getEmployeeId()));
                vs.setSalary(vs.getRevenue() * 0.3);
                listViewSale.add(vs);
            }
            XSSFWorkbook wordkbook = new XSSFWorkbook();
            XSSFSheet sheet = wordkbook.createSheet("doanh thu cua hang");
            XSSFRow row = null;
            Cell cell = null;
            row = sheet.createRow(2);
            cell = row.createCell(0, CellType.STRING);
            cell.setCellValue("Id");

            cell = row.createCell(1, CellType.STRING);
            cell.setCellValue("Tên nhân viên");

            cell = row.createCell(2, CellType.STRING);
            cell.setCellValue("SĐT");

            cell = row.createCell(3, CellType.STRING);
            cell.setCellValue("Tổng đơn trong tháng");

            cell = row.createCell(4, CellType.STRING);
            cell.setCellValue("Doanh thu");

            cell = row.createCell(5, CellType.STRING);
            cell.setCellValue("Lương");

            

            int totalSalary = 0;
            for (int i = 0; i < listViewSale.size(); i++) {
                ViewSale vs = listViewSale.get(i);

                row = sheet.createRow(3 + i);

                cell = row.createCell(0, CellType.STRING);
                cell.setCellValue(vs.getEmployee().getEmployeeId());

                cell = row.createCell(1, CellType.STRING);
                cell.setCellValue(vs.getEmployee().getFullName());

                cell = row.createCell(2, CellType.STRING);
                cell.setCellValue(vs.getEmployee().getPhone());

                cell = row.createCell(3, CellType.STRING);
                cell.setCellValue(vs.getTotalOrder());

                cell = row.createCell(4, CellType.STRING);
                cell.setCellValue(vs.getRevenue());

                cell = row.createCell(5, CellType.STRING);
                cell.setCellValue(vs.getSalary());

                totalSalary += vs.getSalary();
            }
            row = sheet.createRow(2 + listViewSale.size() + 1);
            cell = row.createCell(4, CellType.STRING);
            cell.setCellValue("Tổng lương nhân viên: ");
            cell = row.createCell(5, CellType.NUMERIC);
            cell.setCellValue(totalSalary);

            String pathName = "D://DoanhThuNhanVienThang" + month_str + ".xlsx";
            File f = new File(pathName);
            try {
                FileOutputStream fos = new FileOutputStream(f);
                wordkbook.write(fos);
                fos.close();
            } catch (FileNotFoundException ex) {
                ex.printStackTrace();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        request.getRequestDispatcher("viewsale").forward(request, response);
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