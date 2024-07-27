/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.LeaveRequestStatus;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LINHNTHE170290
 */
public class LeaveRequestStatusDAO extends DBContext {

    public List<LeaveRequestStatus> getAll() {
        List<LeaveRequestStatus> lStatus = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[LeaveRequestStatus]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                LeaveRequestStatus ls = new LeaveRequestStatus(rs.getInt(1), rs.getString(2));
                lStatus.add(ls);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lStatus;
    }

    public static void main(String[] args) {
        List<Integer> lStatus = new LeaveRequestStatusDAO().getBarberId();
        if (lStatus == null) {
            System.out.println("ko co ai nghi");
        } else {
            for (Integer lStatu : lStatus) {
                System.out.println(lStatu);
            }
        }

    }

    public List<Integer> getBarberId() {
        List<Integer> LeId = new ArrayList<>();
        try {
            String sql = "SELECT TOP (1000) \n"
                    + "    [employeeId]\n"
                    + "FROM \n"
                    + "    [Barber].[dbo].[LeaveRequests]\n"
                    + "WHERE \n"
                    + "    [statusId] = 2\n"
                    + "    AND CAST(GETDATE() AS DATE) >= CAST([startDate] AS DATE)\n"
                    + "    AND CAST(GETDATE() AS DATE) <= CAST([endDate] AS DATE)\n"
                    + "ORDER BY \n"
                    + "    [employeeId];";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int employeeId = rs.getInt(1);
                LeId.add(employeeId);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (LeId.isEmpty()) {
            return null;
        }
        return LeId;
    }
}
