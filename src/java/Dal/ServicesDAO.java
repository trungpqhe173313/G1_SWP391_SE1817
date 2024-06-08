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

/**
 *
 * @author LENOVO
 */
public class ServicesDAO extends DBContext{
    
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
        List<Services> se = dao.GetAllServices();
         for (Services o : se) {
             System.out.println(o);
         }
    }
}
