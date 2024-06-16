/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.Services;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO
 */
public class ServicesDAO extends DBContext {

    public List<Services> GetAllServices() {
        List<Services> s = new ArrayList<>();
        String sql = "select * from Services";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int servicesId = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                int price = rs.getInt(4);
                String description = rs.getString(5);
                boolean isActive = rs.getBoolean(6);
//                int classificationId = rs.getInt(7);

                s.add(new Services(servicesId, name, image, price, description, isActive));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return s;

    }

    public static void main(String[] args) {

        ServicesDAO dao = new ServicesDAO();
        List<Services> se = dao.getServicesInOrder(2);
        System.out.println(se.size());
    }

    public List<Services> getServicesInOrder(int id) {
        List<Services> s = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    s.servicesId,\n"
                    + "    s.name,\n"
                    + "    s.image,\n"
                    + "    s.price,\n"
                    + "    s.description,\n"
                    + "    s.isActive\n"
                    + "FROM \n"
                    + "    [Barber].[dbo].[order] o\n"
                    + "INNER JOIN \n"
                    + "    dbo.Order_services os ON os.OrderId = o.orderId\n"
                    + "INNER JOIN \n"
                    + "    dbo.Services s ON s.servicesId = os.servicesId\n"
                    + "WHERE \n"
                    + "    o.orderId = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int servicesId = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                int price = rs.getInt(4);
                String description = rs.getString(5);
                boolean isActive = rs.getBoolean(6);
                s.add(new Services(servicesId, name, image, price, description, isActive));
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
}
