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
public class Order_servicesDAO extends DBContext {

    public void InsertServices(String oId, String id) {
        try {
            String sql = "INSERT INTO [dbo].[Order_services]\n"
                    + "           ([servicesId]\n"
                    + "           ,[OrderId])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, oId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Order_servicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAllServices(String oId) {
        try {
            String sql = "DELETE FROM [dbo].[Order_services]\n"
                    + "      WHERE [Order_services].OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, oId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Order_servicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
