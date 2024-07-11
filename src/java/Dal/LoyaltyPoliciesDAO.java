/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.LoyaltyPolicies;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phamt
 */
public class LoyaltyPoliciesDAO extends DBContext {

    public LoyaltyPolicies getLoyalty() {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[LoyaltyPolicies]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return  new LoyaltyPolicies(rs.getInt(1),
                        rs.getInt(2), 
                        rs.getInt(3));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        LoyaltyPolicies lp = new LoyaltyPoliciesDAO().getLoyalty();
        System.out.println(lp.getMinAmount());
    }
}
