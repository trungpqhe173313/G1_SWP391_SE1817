/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phamt
 */
public class Order_shiftDAO extends DBContext {
    private static final Logger LOGGER = Logger.getLogger(Order_shiftDAO.class.getName());

    public int countNumberOrderInShift(int shiftId, String date) {
        int count = 0;
        String sql = "SELECT COUNT(os.OrderID) AS NumberOfOrders\n"
                + "FROM Order_shift os\n"
                + "JOIN Orders o ON os.OrderID = o.orderId\n"
                + "WHERE os.ShiftID = ?\n"
                + "  AND o.orderDate = ?\n"
                + "  AND o.statusID <> 5;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, shiftId);
            st.setString(2, date);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("NumberOfOrders");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return count;
    }

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
        Order_shiftDAO d = new Order_shiftDAO();
        System.out.println(d.countNumberOrderInShift(2, "2023-06-30"));
    }
}
