/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.Discount;
import Model.Order;
import Model.Shift;
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
public class DiscountDAO extends DBContext {

    public List<Discount> getAllDis() {
        List<Discount> List = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "FROM [Barber].[dbo].[discount]\n"
                    + "ORDER BY point ASC;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Discount dis = new Discount(rs.getInt(1), rs.getInt(2), rs.getInt(3));
                List.add(dis);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return List;
    }

    public static void main(String[] args) {
        List<Discount> dis = new DiscountDAO().getAllDis();
        for (Discount di : dis) {
            System.out.println(di.getPoint());
        }
    }
}
