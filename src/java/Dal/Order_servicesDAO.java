/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Employees;
import Model.Order_services;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phamt
 */
public class Order_servicesDAO extends DBContext {

    public List<Order_services> getAppointmentByOid(int id, boolean b) {
        List<Order_services> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP (1000) [orderId]\n"
                    + "      ,[serviceId]\n"
                    + "      ,[isActive]\n"
                    + "      ,[createdAt]\n"
                    + "      ,[updatedAt]\n"
                    + "  FROM [Barbershop].[dbo].[order_services]\n"
                    + "  where order_services.orderId = ? and order_services.isActive = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setBoolean(2, b);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order_services or = new Order_services(rs.getInt(1), rs.getInt(2), rs.getBoolean(3));
                list.add(or);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Order_servicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateOrder_Services(int s, int orderId, boolean b) {
        try {
            String sql = "UPDATE [dbo].[order_services]\n"
                    + "   SET [isActive] = ?\n"
                    + "\n"
                    + " WHERE [orderId] = ? and [serviceId] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(3, s);
            stm.setBoolean(1, b);
            stm.setInt(2, orderId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Order_servicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        new Order_servicesDAO().addOrder_Services(5, 3);

    }

    

    public void deleteOrder_Services(int orderId, Integer old) {
        String sql = "DELETE FROM [dbo].[order_services]\n"
                + "      WHERE order_services.orderId =? and order_services.serviceId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.setInt(2, old);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Order_servicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addOrder_Services(int orderId, int newId) {
        String sql = "INSERT INTO [dbo].[order_services]\n"
                + "           ([orderId]\n"
                + "           ,[serviceId]\n"
                + "           ,[isActive]\n"
                + "           ,[createdAt]\n"
                + "           ,[updatedAt])\n"
                + "     VALUES\n"
                + "           (?,?,1,GETDATE(),GETDATE())";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.setInt(2, newId);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Order_servicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
