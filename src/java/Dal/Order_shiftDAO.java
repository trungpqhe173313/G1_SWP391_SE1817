/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phamt
 */
public class Order_shiftDAO extends DBContext {

    public void deleteAllShift(String oId) {
        try {
            String sql = "DELETE FROM [dbo].[Order_shift]\n"
                    + "      WHERE Order_shift.OrderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, oId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Order_shiftDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void InsertShift(String oId, int newShift) {
        try {
            String sql = "INSERT INTO [dbo].[Order_shift]\n"
                    + "           ([ShiftID]\n"
                    + "           ,[OrderID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, newShift);
            stm.setString(2, oId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Order_shiftDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        for (int i = 1; i < 3; i++) {
            new Order_shiftDAO().InsertShift("8", i);
        }
    }
}   
