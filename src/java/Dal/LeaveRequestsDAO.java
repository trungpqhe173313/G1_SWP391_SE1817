/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.LeaveRequests;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LINHNTHE170290
 */
public class LeaveRequestsDAO extends DBContext {

    public List<LeaveRequests> getAll() {
        List<LeaveRequests> lRequests = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[LeaveRequests]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                LeaveRequests lr = new LeaveRequests(rs.getInt(1), rs.getInt(2),
                        rs.getDate(3), rs.getDate(4),
                        rs.getString(5), rs.getInt(6), rs.getDate(7));
                lRequests.add(lr);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lRequests;
    }

    public void addLeaveRequest(int employeeId, String startDate, String endDate, String reason, int statusId) {
        String sql = "INSERT INTO [dbo].[LeaveRequests]\n"
                + " ([employeeId]\n"
                + " ,[startDate]\n"
                + " ,[endDate]\n"
                + " ,[reason]\n"
                + " ,[statusId]\n"
                + " )\n"
                + " VALUES\n"
                + " (?\n"
                + " ,?\n"
                + " ,?\n"
                + " ,?\n"
                + " ,?\n"
                + " )";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, employeeId);
            st.setString(2, startDate);
            st.setString(3, endDate);
            st.setString(4, reason);
            st.setInt(5, statusId);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(LeaveRequestsDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    // Phương thức kiểm tra xem yêu cầu nghỉ phép có được thêm vào cơ sở dữ liệu hay không
    public boolean isLeaveRequestAdded(int employeeId, String startDate, String endDate, String reason) {
        String sql = "SELECT * FROM LeaveRequests WHERE employeeId = ? AND startDate = ? AND endDate = ? AND reason = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, employeeId);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            ps.setString(4, reason);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateRequests(String rId, int i) {
        // Get the current date from LocalDate
        LocalDate localDate = LocalDate.now();

        // Convert LocalDate to java.sql.Date
        Date date = Date.valueOf(localDate);
        try {
            String sql = "UPDATE [dbo].[LeaveRequests]\n"
                    + "   SET  [statusId] = ?\n"
                    + "      ,[approvalDate] = ?\n"
                    + " WHERE [requestId] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(2, date);
            stm.setInt(1, i);
            stm.setString(3, rId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteRequest(String rId) {
        try {
            String sql = "DELETE FROM [dbo].[LeaveRequests] WHERE [requestId] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, rId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
       new LeaveRequestsDAO().addLeaveRequest(4, "2023-07-01", "2023-07-05", "Nghỉ ốm", 1);
       
    }
}
