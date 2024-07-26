package Controller.admin;

import Dal.ShopDAO;
import Model.Order;
import Model.OrderRevenue;
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
import java.util.ArrayList;
import org.apache.tomcat.jakartaee.commons.lang3.math.NumberUtils;

public class ExportRevenueToExcelServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String month_str = request.getParameter("month");
        if (!NumberUtils.isNumber(month_str)) {
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
            //Khởi tạo một đối tượng XSSFWorkbook mới, đại diện cho một workbook Excel trống.
            XSSFWorkbook workbook = new XSSFWorkbook();
            //Tạo một sheet mới trong workbook với tên "Doanh Thu Cửa Hàng".
            XSSFSheet sheet = workbook.createSheet("Doanh Thu Cửa Hàng");
            //Khởi tạo biến row nhưng chưa gán giá trị cho nó. Biến này sẽ được sử dụng sau để tham chiếu đến các hàng trong sheet.
            XSSFRow row = null;
            //Khởi tạo biến cell nhưng chưa gán giá trị cho nó. Biến này sẽ được sử dụng sau để tham chiếu đến các ô trong các hàng.
            Cell cell = null;
            
            
            //Tạo một hàng mới tại chỉ số hàng 2 (hàng thứ ba vì chỉ số bắt đầu từ 0) trên sheet.
            row = sheet.createRow(2);
            //Tạo một ô mới trong hàng row tại chỉ số cột 0 (cột đầu tiên) với loại dữ liệu là CellType.STRING.
            cell = row.createCell(0, CellType.STRING);
            //Đặt giá trị của ô là "Mã đơn".
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

                cell = row.createCell(5, CellType.NUMERIC);
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

            //dat loai noi dung phan hoi la file excel (MIME type su dung cho file excel dinh dang .xlxs) 
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            //dat tieu de Http, chi cho trinh duyet biet noi dung phan hoi duoc xu ly nhu 1 file dinh kem giup hien thị hop thoai tai xuong, file name
            response.setHeader("Content-Disposition", "attachment; filename=DoanhThuThang" + month_str + ".xlsx");
            //response.getOutputStream(): Lấy OutputStream từ HttpServletResponse để ghi dữ liệu ra phản hồi HTTP. Dữ liệu này sẽ được gửi về trình duyệt của người dùng.
            try (var out = response.getOutputStream()) {
                //Ghi nội dung của XSSFWorkbook (workbook) vào OutputStream (out). Điều này có nghĩa là file Excel sẽ được ghi trực tiếp vào phản hồi HTTP.
                workbook.write(out);
            }
            workbook.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Export Revenue to Excel";
    }
}
