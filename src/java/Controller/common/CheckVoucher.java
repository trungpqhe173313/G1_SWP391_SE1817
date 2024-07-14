/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.common;

/**
 *
 * @author LENOVO
 */
import Dal.VoucherDAO;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

public class CheckVoucher {
    private Timer timer = new Timer();
    private VoucherDAO voucherDAO = new VoucherDAO();

    public void remindVoucherStatus() {
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
                voucherDAO.updateExpiredVouchers();
                voucherDAO.reactivateVouchers();
            }
        };

        Calendar remindTime = Calendar.getInstance();
        remindTime.set(Calendar.HOUR_OF_DAY, 0);
        remindTime.set(Calendar.MINUTE, 0);
        remindTime.set(Calendar.SECOND, 0);
        remindTime.set(Calendar.MILLISECOND, 0);

        // Nếu thời gian hiện tại đã vượt quá thời gian chạy định kỳ, tăng thêm 1 ngày để lịch không bị bỏ qua
        if (remindTime.getTime().before(new java.util.Date())) {
            remindTime.add(Calendar.DAY_OF_MONTH, 1);
        }

        timer.scheduleAtFixedRate(task, remindTime.getTime(), 24 * 60 * 60 * 1000); // Chạy mỗi 24 giờ
    }

    public void cancelReminder() {
        timer.cancel();
    }
}
