/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.Services;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

                s.add(new Services(servicesId, name, image, price, description, isActive));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return s;

    }

    public List<Services> getTopServices() {
        List<Services> topServices = new ArrayList<>();
        String sql = "SELECT TOP 10 "
                + "s.servicesId, "
                + "s.name, "
                + "s.image, "
                + "s.price, "
                + "s.description, "
                + "s.isActive, "
                + "COUNT(os.orderId) AS orderCount "
                + "FROM Services s "
                + "JOIN Order_services os ON s.servicesId = os.servicesId "
                + "GROUP BY "
                + "s.servicesId, "
                + "s.name, "
                + "s.image, "
                + "s.price, "
                + "s.description, "
                + "s.isActive "
                + "ORDER BY orderCount DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int servicesId = rs.getInt("servicesId");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int price = rs.getInt("price");
                String description = rs.getString("description");
                boolean isActive = rs.getBoolean("isActive");
                int orderCount = rs.getInt("orderCount");

                Services service = new Services(servicesId, name, image, price, description, isActive);
                service.setOrderCount(orderCount); // Set the order count
                topServices.add(service);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return topServices;
    }

    public void AddService(String name, String image, int price, String description) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.connection;
            if (con != null) {
                String sql = "INSERT INTO Services (name, image, price, description, isActive) VALUES (?, ?, ?, ?, 1)";
                stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stm.setString(1, name);
                stm.setString(2, image);
                stm.setInt(3, price);
                stm.setString(4, description);

                int rowsAffected = stm.executeUpdate();

                // Retrieve the generated service ID
                if (rowsAffected > 0) {
                    try (ResultSet generatedKeys = stm.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            int serviceId = generatedKeys.getInt(1);
                            System.out.println("Service ID: " + serviceId);
                        }
                    } catch (Exception e) {
                        e.printStackTrace(); // In ra stack trace để gỡ lỗi
                        System.out.println("Error retrieving generated service ID: " + e.getMessage());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra stack trace để gỡ lỗi
            System.out.println("Error: " + e.getMessage());
        }

    }

    public void UpdateService(int servicesId, String name, String image, int price, String description) {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBContext.connection;
            if (con != null) {
                String sql = "update Services set name = ?, image = ?, price = ?, description = ?, isActive = 1 where servicesId = ?";
                stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stm.setString(1, name);
                stm.setString(2, image);
                stm.setInt(3, price);
                stm.setString(4, description);
                stm.setInt(5, servicesId);

                int rowsAffected = stm.executeUpdate();
                System.out.println("Rows affected: " + rowsAffected);

                // Normally, no new key is generated during an update operation
                // The following part is redundant and hence removed
                // if (rowsAffected > 0) {
                //     // Logic here is not required for update operation
                // }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for debugging
            System.out.println("Error: " + e.getMessage());
        }
    }

    public Services getServiceById(int serviceId) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Services service = null;
        try {
            con = DBContext.connection;
            if (con != null) {
                String sql = "SELECT * FROM Services WHERE servicesId = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, serviceId);
                rs = stm.executeQuery();

                if (rs.next()) {
                    service = new Services();
                    service.setServicesId(rs.getInt("servicesId"));
                    service.setName(rs.getString("name"));
                    service.setImage(rs.getString("image"));
                    service.setPrice(rs.getInt("price"));
                    service.setDescription(rs.getString("description"));
                }
                stm.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return service;
    }

    public int countServicesByMonth(int servicesId, int month) {
        int count = 0;
        try {

            String sql = "SELECT COUNT(*) AS ServiceUsageCount\n"
                    + "FROM Order_services os\n"
                    + "INNER JOIN Orders o ON os.orderId = o.orderId\n"
                    + "WHERE os.servicesId = ?\n"
                    + "  AND YEAR(o.orderDate) = YEAR(GETDATE())\n"
                    + "  AND MONTH(o.orderDate) = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, servicesId);
            stm.setInt(2, month);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public void toggleVisibility(int serviceId) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBContext.connection;
            if (con != null) {
                String sql = "UPDATE Services \n"
                        + "SET isActive = CASE \n"
                        + "                 WHEN isActive = 1 THEN 0 \n"
                        + "                 ELSE 1 \n"
                        + "               END \n"
                        + "WHERE servicesId = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, serviceId);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Services> getServicesInOrder(int id) {
        List<Services> s = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "    s.servicesId,\n"
                    + "    s.name,\n"
                    + "    s.image,\n"
                    + "    s.price,\n"
                    + "    s.description,\n"
                    + "    s.isActive\n"
                    + "FROM\n"
                    + "    Orders o\n"
                    + "INNER JOIN\n"
                    + "    Order_services os ON os.orderId = o.orderId\n"
                    + "INNER JOIN\n"
                    + "    Services s ON s.servicesId = os.servicesId\n"
                    + "WHERE\n"
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
    public static void main(String[] args) {
        ServicesDAO d = new ServicesDAO();
        System.out.println(d.countServicesByMonth(6, 7));
    }
}
