package Controller.admin;

import Dal.ShopDAO;
import Model.Employee;
import Model.ViewSale;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.tomcat.jakartaee.commons.lang3.math.NumberUtils;

public class ExportEmployeeRevenueToExcelServlet extends HttpServlet {

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
            //Khởi tạo một đối tượng XSSFWorkbook mới, đại diện cho một workbook Excel trống.
            XSSFWorkbook workbook = new XSSFWorkbook();
            //Tạo một sheet mới trong workbook với tên "Doanh Thu Nhân Viên".
            XSSFSheet sheet = workbook.createSheet("Doanh Thu Nhân Viên");
            //Khởi tạo biến row nhưng chưa gán giá trị cho nó. Biến này sẽ được sử dụng sau để tham chiếu đến các hàng trong sheet.
            XSSFRow row = null;
            //Khởi tạo biến cell nhưng chưa gán giá trị cho nó. Biến này sẽ được sử dụng sau để tham chiếu đến các ô trong các hàng.
            Cell cell = null;
            
            //Tạo một hàng mới tại chỉ số hàng 2 (hàng thứ ba vì chỉ số bắt đầu từ 0) trên sheet.
            row = sheet.createRow(2);
            //Tạo một ô mới trong hàng row tại chỉ số cột 0 (cột đầu tiên) với loại dữ liệu là CellType.STRING.
            cell = row.createCell(0, CellType.STRING);
            //Đặt giá trị của ô là "Id".
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

                cell = row.createCell(3, CellType.NUMERIC);
                cell.setCellValue(vs.getTotalOrder());

                cell = row.createCell(4, CellType.NUMERIC);
                cell.setCellValue(vs.getRevenue());

                cell = row.createCell(5, CellType.NUMERIC);
                cell.setCellValue(vs.getSalary());

                totalSalary += vs.getSalary();
            }
            row = sheet.createRow(2 + listViewSale.size() + 1);
            cell = row.createCell(4, CellType.STRING);
            cell.setCellValue("Tổng lương nhân viên: ");
            cell = row.createCell(5, CellType.NUMERIC);
            cell.setCellValue(totalSalary);
            //dat loai noi dung phan hoi la file excel (MIME type su dung cho file excel dinh dang .xlxs) 
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            //dat tieu de Http, chi cho trinh duyet biet noi dung phan hoi duoc xu ly nhu 1 file dinh kem giup hien thị hop thoai tai xuong, file name
            response.setHeader("Content-Disposition", "attachment; filename=DoanhThuNhanVienThang" + month_str + ".xlsx");
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
        return "Export Employee Revenue to Excel";
    }
}
