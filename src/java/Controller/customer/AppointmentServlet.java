/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.CustomerDAO;
import Dal.EmployeesDAO;
import Dal.OrderDAO;
import Dal.Order_shiftDAO;
import Dal.ShiftsDAO;
import Dal.ShopDAO;
import Dal.StoreDAO;
import Model.Account;
import Model.Customer;
import Model.Order;
import Model.Services;
import Model.ServicesBooking;
import Model.Shift;
import Model.Store;
import Model.Time;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

/**
 *
 * @author xdrag
 */
public class AppointmentServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            if (session.getAttribute("phone") == null) {
                request.setAttribute("mss", "vui lòng điền số điện thoại hoặc đăng nhập!!");
                    request.getRequestDispatcher("booking").forward(request, response);
                    return;
            }
        }
        StoreDAO sd = new StoreDAO();
        Store store = sd.getStore();
        //kiem tra xem cua hang co trong trang thai hoat dong khong
        if (store.isIsActive() == true) {
            ShiftsDAO d = new ShiftsDAO();
            List<String> listDate = new ArrayList<>();

// Lấy ngày hôm nay
            LocalDateTime today = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String todayStr = today.format(formatter);
            listDate.add(todayStr);

// Lấy hai ngày tiếp theo
            for (int i = 0; i < 2; i++) {
                today = today.plusDays(1);
                String nextDayStr = today.format(formatter);
                listDate.add(nextDayStr);
            }
            //lay ra gio va phut hien tai
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
            String formattedTime = today.format(timeFormatter);
            //tao list tat ca cac shift de so sanh dieu kien
            List<Shift> listAllShift = null;
            //tao list nhung shift duoc hien thi
            List<Shift> listShift;
            //session time chua date duoc chon, danh sach cac shift duoc hien thi
            //neu nhu session time = null 
            if (session.getAttribute("time") == null) {
                //Lay ra tat ca cac shift
                listAllShift = d.getAllShiftFromNow(formattedTime);
                //tao danh sach de luu nhung ca trong va dua vao method listShiftEmpty de so sanh cac shift tim ra ca trong de luu vao danh sach shift hien thi
                listShift = listShiftEmpty(listAllShift, todayStr);

                session.setAttribute("time", new Time(todayStr, listShift));
            } else if (session.getAttribute("time") != null) {
                //neu nhu session time da ton tại thi lay ra doi tuong time
                Time time = (Time) session.getAttribute("time");
                //Lay ra tat ca cac ca tu thoi diem nay tro di neu nhu date trong Time la ngay hom nay
                if (time.getDate().equals(todayStr)) {
                    listAllShift = d.getAllShiftFromNow(formattedTime);
                } else {
                    //neu khong phải hom nay thi lay ra toàn bo ca
                    listAllShift = d.getAll();
                }
                //luu nhung ca trong duoc tra ve qua method listShiftEmpty
                listShift = listShiftEmpty(listAllShift, time.getDate());
                session.setAttribute("time", new Time(time.getDate(), listShift));

            }
            if (session.getAttribute("services") != null) {
                ServicesBooking servicesBooking = (ServicesBooking) session.getAttribute("services");
                List<Shift> listShiftNeed = new ArrayList<>();
                int servicesSize = servicesBooking.getListServices().size();
                //kiem tra xem
                if (!listAllShift.isEmpty() && listAllShift.size() >= servicesSize) {
                    for (int i = 0; i < servicesSize; i++) {
                        listShiftNeed.add(listAllShift.get(i));
                    }
                    request.setAttribute("listShiftNeed", listShiftNeed);
                } else {
                    request.setAttribute("mss", "Hôm nay đã hết ca vui lòng chọn ngày khác");
                }
            }

            request.setAttribute("listDate", listDate);
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } //neu cua hang dang trong trang thai khong hoat dong
        else {
            String mssStore ="";
            if (store.getStartDate().equals(store.getEndDate())) {
                mssStore = "Cửa hàng đang tạm đóng ngày "+ store.getStartDate();
            } else{
                mssStore = "Cửa hàng đang tạm đóng từ ngày " + store.getStartDate() + " đến ngày " +store.getEndDate();
            }
            request.setAttribute("store", store);
            request.setAttribute("mssStore", mssStore);
            request.setAttribute("checkNotActive", true);
            request.getRequestDispatcher("booking.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String date_str = request.getParameter("date");
        String shift_str = request.getParameter("shifts");
        try {

            CustomerDAO cd = new CustomerDAO();
            OrderDAO d = new OrderDAO();
            StoreDAO storeDao = new StoreDAO();
            Store store = storeDao.getStore();
            String phone = "";
            //kiem tra xem cua hang co o trang thai hoat dong khong
            if (store.isIsActive() == false) {
                doGet(request, response);
                return;
            }
            //kiem tra xem co dang nhap chua
            if (session.getAttribute("account") != null) {
                //neu da dang nhap thi cho phone = so dien thoại cua account;
                Account a = (Account) session.getAttribute("account");
                phone = a.getPhone();
            }
            //kiem tra xem neu nguoi dung chua dang nhap
            if (session.getAttribute("account") == null) {
                //kiem tra xem session phone chua ton tai
                if (session.getAttribute("phone") == null) {
                    request.setAttribute("mss", "vui lòng điền số điện thoại");
                    request.getRequestDispatcher("booking").forward(request, response);
                    return;
                }
                //neu da ton tai thi cho phone = session phone
                phone = (String) session.getAttribute("phone");
            }
            System.out.println("phone appointment: "+phone);
            //kiem tra sdt da ton tai trong bang customer chua
            if (cd.getCustomerByP(phone) == null) {
                //neu chua co thi add sdt vao bang customer
                Customer newCus = new Customer();
                newCus.setPhone(phone);
                System.out.println(cd.addCustomer(newCus));
            }
            System.out.println("appointment add customer");
            //lay customer bang so dien thoai
            Customer cus = cd.getCustomerByP(phone);
            //kiem tra xem khach hang co don chua hoan thanh hom dũo chon ko
            if (d.countOrderNotCompleteByCustomerId(cus.getCustomerId(), date_str) != 0) {
                request.setAttribute("mss", "bạn đã có đơn chưa hoàn thành");
                request.getRequestDispatcher("booking").forward(request, response);
                return;
            }
            ServicesBooking sb = (ServicesBooking) session.getAttribute("services");
            ShiftsDAO sd = new ShiftsDAO();
            List<Shift> listShiftNeed = sd.getAllNextShift(Integer.parseInt(shift_str),
                    sb.getListServices().size());
            //neu tat ca shift can ma co ca nao khong con trong hoac so luong service loen hon so luong cac ca can sẽ thong bao dat khong thanh cong
            if (!checkAllShiftEmpty(listShiftNeed, date_str)
                    || sb.getListServices().size() > listShiftNeed.size()) {

                List<String> listDate = new ArrayList<>();
                // Lấy ngày hôm nay
                LocalDate today = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String todayStr = today.format(formatter);
                listDate.add(todayStr);

                // Lấy hai ngày tiếp theo
                for (int i = 0; i < 2; i++) {
                    today = today.plusDays(1);
                    String nextDayStr = today.format(formatter);
                    listDate.add(nextDayStr);
                }
                request.setAttribute("listShiftNeed", listShiftNeed);
                request.setAttribute("shiftId", Integer.parseInt(shift_str));
                request.setAttribute("listDate", listDate);
                request.setAttribute("mss", "Đặt Không Thành Công Không đủ ca trống vui long chọn ca khác hoặc ngày khác");
                request.getRequestDispatcher("booking.jsp").forward(request, response);
                return;
            } else {
                //lay ra id cua customer
                int customerId = cus.getCustomerId();

                //tao ra ordercode từ DAL.OrderDAO
                String orderCode = d.generateOrderCode();
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                //ep kieu string sang date truoc roi tao ra mot cai sql date
                Date date = new java.sql.Date(sdf.parse(date_str).getTime());
                Order o = new Order(orderCode, customerId, 1, date, sb.getTotalMoney());
                d.AddOrder(o);
                int orderId = d.getNewOrderId();
                List<Services> listServices = sb.getListServices();
                for (Services s : listServices) {
                    d.AddOrder_services(s.getServicesId(), orderId);
                }
                Order_shiftDAO osd = new Order_shiftDAO();
                for (Shift s : listShiftNeed) {
                    osd.InsertShift("" + orderId, s.getId());
                }
                ShopDAO shopDao = new ShopDAO();
                session.removeAttribute("time");
                session.removeAttribute("services");
                request.setAttribute("listServices", listServices);
                request.setAttribute("ListShifts", listShiftNeed);
                request.setAttribute("order", o);
                request.setAttribute("status", shopDao.getStatusById(o.getStatusId()));
                request.getRequestDispatcher("BookingSucces.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }
    
    //ham de kiem tra danh sach cac ca dua vao co con trong khong
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
     * ham de kiem tra va tra ve list nhung ca trong
     * @param shift to check is that shift empty
     * @param date
     * @return List
     */
    public List<Shift> listShiftEmpty(List<Shift> listShift, String date) {
        List<Shift> listShiftEmpty = new ArrayList<>();
        Order_shiftDAO osd = new Order_shiftDAO();
        EmployeesDAO ed = new EmployeesDAO();
        //dem so nhan vien 
        int numberEmployeeActive = ed.countNumberActiveEmployee();
        for (Shift s : listShift) {
            //so sanh so nhan vien voi so don cua ca do trong ngay date
            if (numberEmployeeActive > osd.countNumberOrderInShift(s.getId(), date)) {
                //neu so nhan vien lon hon so don trong ca thi them vao danh sach ca trong
                listShiftEmpty.add(s);
            }
        }
        return listShiftEmpty;
    }

    /**
     * ham de kiem tra xem co phai sdt formart viet nam khong
     *
     * @param phoneNumber - string phone to check
     * @return boolean
     */
    public static boolean isValidVietnamesePhoneNumber(String phoneNumber) {
        // Kiểm tra nếu chuỗi là null hoặc rỗng
        if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
            return false;
        }

        // Xóa tất cả dấu cách trong chuỗi
        phoneNumber = phoneNumber.replaceAll("\\s", "");

        // Định nghĩa pattern cho số điện thoại Việt Nam
        String phonePattern = "^(03|05|07|08|09)\\d{8}$";

        // Kiểm tra xem chuỗi có khớp với pattern không
        return phoneNumber.matches(phonePattern);
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
