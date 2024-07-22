/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.common;

import Controller.admin.RemindStoreStatus;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

/**
 *
 * @author ngngh
 */
@WebListener
public class RemindService implements ServletContextListener {
    Remind t=new Remind();
    RemindStoreStatus rst = new RemindStoreStatus();
    CheckVoucher v = new CheckVoucher();
    
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Thực hiện các hoạt động khi ứng dụng được khởi động
        System.out.println("Ứng dụng đã khởi động!");
        // Khởi tạo và lên lịch cho TimerTask ở đây     
        
        t.remindAppointment();
        v.remindVoucherStatus();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Thực hiện các hoạt động khi ứng dụng bị đóng
        System.out.println("Ứng dụng đã bị đóng!");
        // Hủy TimerTask hoặc thực hiện các công việc dọn dẹp tại đây
        
        t.cancelReminder();
        v.cancelReminder();
    }
}