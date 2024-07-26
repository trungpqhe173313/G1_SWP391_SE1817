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

    public Shift getShiftById(int id) {
        Shift s = new Shift();
        String sql = "SELECT *\n"
                + "  FROM [Barber].[dbo].[shift] where id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql);) {
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s.setId(rs.getInt(1));
                s.setStartTime(rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShiftsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public List<Shift> getAllShiftFromNow( String time) {
        List<Shift> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[startTime]\n"
                + "  FROM [dbo].[shift]\n"
                + "  WHERE CONVERT(TIME, [startTime], 120) >= CONVERT(TIME, ?, 120);";
        try (PreparedStatement stm = connection.prepareStatement(sql);) {
            stm.setString(1, time);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Shift s = new Shift(rs.getInt(1), rs.getString(2));
                list.add(s);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ShiftsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public List<Shift> getAllShiftsForToday() {
//        List<Shift> list = new ArrayList<>();
//        String sql = "SELECT [id], [startTime]\n"
//                + "FROM [dbo].[shift]\n"
//                + "ORDER BY CASE \n"
//                + "  WHEN CAST([startTime] AS TIME) >= CAST(GETDATE() AS TIME) THEN 0 \n"
//                + "  ELSE 1 \n"
//                + "END, [startTime];";
//        try (PreparedStatement stm = connection.prepareStatement(sql);) {
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Shift s = new Shift(rs.getInt(1), rs.getString(2));
//                list.add(s);
//
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(ShiftsDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }

    public List<Shift> getAllNextShift(int id, int number) {
        List<Shift> list = new ArrayList<>();
        String sql = "SELECT TOP " + number + " * FROM shift WHERE id >= ? ORDER BY id;";
        try (PreparedStatement stm = connection.prepareStatement(sql);) {
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Shift s = new Shift(rs.getInt(1), rs.getString(2));
                list.add(s);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ShiftsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        ShiftsDAO d = new ShiftsDAO();

//        System.out.println(d.getShiftById(1));
        List<Shift> l = d.getAllNextShift(6, 5);
        for (Shift s : l) {
            System.out.println(s.toString());
        }
    }

}
