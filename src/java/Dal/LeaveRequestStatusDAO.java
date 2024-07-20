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
         List<LeaveRequestStatus> lStatus = new LeaveRequestStatusDAO().getAll();
         System.out.println(lStatus.size());
    }
}
