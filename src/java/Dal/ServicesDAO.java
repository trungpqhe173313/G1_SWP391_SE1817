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
//                int classificationId = rs.getInt(7);

                s.add(new Services(servicesId, name, image, price, description, isActive));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return s;

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
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return service;
    }



    
//    public static void main(String[] args) {
//        // Tạo đối tượng ServicesDAO
//        ServicesDAO dao = new ServicesDAO();
//
//        // ID của dịch vụ muốn lấy thông tin
//        int id = 32;
//
//        // Lấy thông tin dịch vụ
//        Services service = dao.getServiceById(id);
//
//        // In thông tin dịch vụ ra console
//        if (service != null) {
//            System.out.println("Service Details: ");
//            System.out.println(service);
//        } else {
//            System.out.println("Service not found with ID: " + id);
//        }
//    }


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
