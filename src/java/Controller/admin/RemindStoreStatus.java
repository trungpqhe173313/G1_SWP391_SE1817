package Controller.admin;

import Dal.StoreDAO;
import Model.Store;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Duration;
import java.util.Timer;
import java.util.TimerTask;

public class RemindStoreStatus {

    private Timer t;

    public void remindStoreStatus() {
        t = new Timer();
        StoreDAO sd = new StoreDAO();
        TimerTask remindStoreStatus = new TimerTask() {
            @Override
            public void run() {
                LocalDate today = LocalDate.now();
                System.out.println("remind store da dc chay");
                Store s = sd.getStore();
                if (today.isAfter(s.getStartDate().minusDays(1)) && today.isBefore(s.getEndDate().plusDays(1))) {
                    s.setIsActive(false);
                    sd.UpdateStore(s);
                } else {
                    s.setIsActive(true);
                    sd.UpdateStore(s);
                }
            }
        };

        // Run task immediately
        remindStoreStatus.run();

        // Calculate delay to midnight
        long delay = calculateInitialDelayToMidnight();

        // Schedule task at midnight and repeat every 24 hours
        t.scheduleAtFixedRate(remindStoreStatus, delay, 24 * 60 * 60 * 1000);
    }

    private long calculateInitialDelayToMidnight() {
        //lay ra thoi gian hien tai bao gom ca ngay va gio
        LocalDateTime now = LocalDateTime.now();
        //lay ra thoi gian bat dau cua ngay tiep theo
        LocalDateTime midnight = now.toLocalDate().plusDays(1).atStartOfDay();
        //tinh khoang thoi gian giua hien tai va nua dem doi ra milliseconds
        return Duration.between(now, midnight).toMillis();
    }

    public void cancelReminder() {
        t.cancel();
        System.out.println("reminde store da dc dung");
    }
}
