package Controller.common;

import Dal.AccountDAO;
import Dal.CustomerDAO;
import Dal.OrderDAO;
import Dal.SendMail;

import Model.Order;
import SendSMS.SpeedSMSAPI;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class Remind {
    private Timer t;

    public void remindAppointment() {
        t = new Timer();
        OrderDAO ap = new OrderDAO();
        CustomerDAO tdao = new CustomerDAO();
        AccountDAO adao = new AccountDAO();
        SendMail mail = new SendMail();
        SpeedSMSAPI smsApi = new SpeedSMSAPI("gJi5aDWZ40TkNTnoybcNxYBR0H7s4kus");

        TimerTask remindAppointment = new TimerTask() {
            @Override
            public void run() {
                List<Order> listA = ap.findOrdersByDate();
                for (Order a : listA) {
                    String sub = "Haircare xin thông báo";
                    String message = "<!DOCTYPE html>\n"
                            + "<html>\n"
                            + "    <head>\n"
                            + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                            + "        <title>Haircare Appointment</title>\n"
                            + "    </head>\n"
                            + "    <body>\n"
                            + "        <table>\n"
                            + "            <tr><td>Chào Anh,</td></tr>\n"
                            + "            <tr><td>Anh có lịch hẹn cắt tóc:</td></tr>\n"
                            + "            <tr><td>Vào lúc: <span style=\"font-weight: bold\">" + a.getShift().getStartTime() + " | " + a.getOrderDate() + "</span></td></tr>\n"
                            + "            <tr><td>Hẹn Gặp Anh Tại Haircare</td></tr>\n"
                            + "            <tr><td>Trân trọng,</td></tr>\n"
                            + "            <tr><td>Haircare</td></tr>\n"
                            + "            <tr><td style=\"font-size: 14px; font-style: italic; color: #999\">** This is an automated message -- please do not reply as you will not receive a response. **</td></tr>\n"
                            + "        </table>\n"
                            + "    </body>\n"
                            + "</html>";
                    String email = adao.getAccountByPhone(tdao.getCustomerProfileById(a.getCustomerId()).getPhone()).getEmail();
                    mail.sendMail(email, sub, message);
                    
                    // Gửi SMS nhắc nhở
                    String phone = tdao.getCustomerProfileById(a.getCustomerId()).getPhone();
                    String formattedPhone = formatPhoneNumber(phone);
                    String smsMessage = "Haircare xin thông báo: Bạn có lịch hẹn cắt tóc vào lúc " + a.getShift().getStartTime() + " ngày " + a.getOrderDate() + ". Hẹn gặp bạn tại Haircare.";
                    try {
                        smsApi.sendSMS(formattedPhone, smsMessage, 5, "a465cd15693f6118");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        };

        // Chạy TimerTask để kiểm tra các đơn hàng
        t.scheduleAtFixedRate(remindAppointment, 30 * 60 * 1000, 30 * 60 * 1000);
//        t.scheduleAtFixedRate(remindAppointment, 0, 60 * 1000);
    }

    public void cancelReminder() {
        t.cancel();
    }
    
    // Phương thức chuẩn hóa số điện thoại
    private String formatPhoneNumber(String phone) {
        if (phone.startsWith("0")) {
            phone = "84" + phone.substring(1);
        }
        return phone;
    }
    
    
}
// Calendar remindAppointmentTime = Calendar.getInstance();
//        remindAppointmentTime.set(Calendar.YEAR, 2024);
//        remindAppointmentTime.set(Calendar.MONTH, Calendar.JULY);
//        remindAppointmentTime.set(Calendar.DAY_OF_MONTH, 03);
//        remindAppointmentTime.set(Calendar.HOUR_OF_DAY, 19);
//        remindAppointmentTime.set(Calendar.MINUTE, 25);
//        remindAppointmentTime.set(Calendar.SECOND, 0);
//        remindAppointmentTime.set(Calendar.MILLISECOND, 0);
//
//        t.scheduleAtFixedRate(remindAppointment, remindAppointmentTime.getTime(), 24 * 60 * 60 * 1000);
