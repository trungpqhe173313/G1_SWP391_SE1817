/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

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
public class ShiftsDAO extends DBContext {

    public List<Shift> getAll() {
        List<Shift> Shift = new ArrayList<>();
        try {

            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[shift]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Shift s = new Shift(rs.getInt(1), rs.getString(2));
                Shift.add(s);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShiftsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Shift;
    }
    public static void main(String[] args) {
        System.out.println(new ShiftsDAO().getAll().size());
    }
            

}
