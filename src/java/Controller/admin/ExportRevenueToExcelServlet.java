/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.ShopDAO;
import Model.Order;
import Model.OrderRevenue;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFRow;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import org.apache.tomcat.jakartaee.commons.lang3.math.NumberUtils;

/**
 *
 * @author xdrag
 */
public class ExportRevenueToExcelServlet extends HttpServlet {

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
            List<Order> listOrderDefault = d.getOrderByMonth(month);
            List<OrderRevenue> listOrder = new ArrayList<>();

            for (Order o : listOrderDefault) {
                OrderRevenue or = new OrderRevenue();
                or.setOrder(o);
                or.setCustomer(d.getCustomerById(o.getCustomerId()));
                or.setEmployee(d.getEmployeeById(o.getEmployeeId()));
                or.setServices(d.getServicesByOrderId(o.getId()));
                or.setShift(d.getListShiftByOrderId(o.getId()));
                or.setStatus(d.getStatusById(o.getStatusId()));
                listOrder.add(or);
            }
            XSSFWorkbook wordkbook = new XSSFWorkbook();
            XSSFSheet sheet = wordkbook.createSheet("doanh thu cua hang");
            XSSFRow row = null;
            Cell cell = null;
            row = sheet.createRow(2);
            cell = row.createCell(0, CellType.STRING);
            cell.setCellValue("Mã đơn");

            cell = row.createCell(1, CellType.STRING);
            cell.setCellValue("Tên khách hàng");

            cell = row.createCell(2, CellType.STRING);
            cell.setCellValue("Ngày đặt");

            cell = row.createCell(3, CellType.STRING);
            cell.setCellValue("SĐT");

            cell = row.createCell(4, CellType.STRING);
            cell.setCellValue("Tên nhân viên");

            cell = row.createCell(5, CellType.STRING);
            cell.setCellValue("Tổng tiền");

            cell = row.createCell(6, CellType.STRING);
            cell.setCellValue("Tên khách hàng");

            int totalRevenueMonth = 0;
            for (int i = 0; i < listOrder.size(); i++) {
                OrderRevenue or = listOrder.get(i);

                row = sheet.createRow(3 + i);

                cell = row.createCell(0, CellType.STRING);
                cell.setCellValue(or.getOrder().getCodeOrder());

                cell = row.createCell(1, CellType.STRING);
                cell.setCellValue(or.getCustomer().getFullName());

                cell = row.createCell(2, CellType.STRING);
                cell.setCellValue(or.getOrder().getOrderDate().toString());

                cell = row.createCell(3, CellType.STRING);
                cell.setCellValue(or.getCustomer().getPhone());

                cell = row.createCell(4, CellType.STRING);
                cell.setCellValue(or.getEmployee().getFullName());

                cell = row.createCell(5, CellType.STRING);
                cell.setCellValue(or.getServices().size());

                cell = row.createCell(6, CellType.NUMERIC);
                cell.setCellValue(or.getOrder().getTotalAmount());

                totalRevenueMonth += or.getOrder().getTotalAmount();
            }
            row = sheet.createRow(2 + listOrder.size() + 1);
            cell = row.createCell(5, CellType.STRING);
            cell.setCellValue("Tổng doanh thu tháng: ");
            cell = row.createCell(6, CellType.NUMERIC);
            cell.setCellValue(totalRevenueMonth);

            String pathName = "D://DoanhThuThang" + month_str + ".xlsx";
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
        request.getRequestDispatcher("viewrevenue").forward(request, response);
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
