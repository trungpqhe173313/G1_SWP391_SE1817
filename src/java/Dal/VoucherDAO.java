/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Voucher;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

/**
 *
 * @author LENOVO
 */
public class VoucherDAO extends DBContext {

    public List<Voucher> getAllVouchers() {
        List<Voucher> vouchers = new ArrayList<>();
        String query = "SELECT * FROM Voucher";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query); ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("Name");
                float discount = resultSet.getFloat("discount");
                int status = resultSet.getInt("status");
                Date startTime = resultSet.getDate("startTime");
                Date endTime = resultSet.getDate("endTime");

                vouchers.add(new Voucher(id, name, discount, status, startTime, endTime));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vouchers;
    }

    public void addVoucher(String name, float discount, Date startTime, Date endTime) {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBContext.connection;
            if (con != null) {
                String sql = "INSERT INTO Voucher (Name, discount, status, startTime, endTime) VALUES (?, ?, 1, ?, ?)";
                stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stm.setString(1, name);

                // Convert discount percentage to decimal
                float discountDecimal = discount / 100;
                stm.setFloat(2, discountDecimal);

                stm.setDate(3, new java.sql.Date(startTime.getTime()));
                stm.setDate(4, new java.sql.Date(endTime.getTime()));

                int rowsAffected = stm.executeUpdate();

                // Retrieve the generated voucher ID
                if (rowsAffected > 0) {
                    try (ResultSet generatedKeys = stm.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            int voucherId = generatedKeys.getInt(1);
                            System.out.println("Voucher ID: " + voucherId);
                        }
                    } catch (Exception e) {
                        e.printStackTrace(); // Print stack trace for debugging
                        System.out.println("Error retrieving generated voucher ID: " + e.getMessage());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for debugging
            System.out.println("Error: " + e.getMessage());
        }
    }

    public Voucher getVoucherById(int id) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Voucher voucher = null;
        try {
            con = DBContext.connection;
            if (con != null) {
                String sql = "SELECT * FROM Voucher WHERE id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();

                if (rs.next()) {
                    voucher = new Voucher();
                    voucher.setId(rs.getInt("id"));
                    voucher.setName(rs.getString("Name"));
                    voucher.setDiscount(rs.getFloat("discount"));
                    voucher.setStatus(rs.getInt("status"));
                    voucher.setStartTime(rs.getDate("startTime"));
                    voucher.setEndTime(rs.getDate("endTime"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return voucher;
    }

    public void updateVoucher(int voucherId, String name, float discount, Date startTime, Date endTime) {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBContext.connection;
            if (con != null) {
                String sql = "UPDATE Voucher SET Name = ?, discount = ?, startTime = ?, endTime = ? WHERE id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);

                // Convert discount percentage to decimal
                float discountDecimal = discount / 100;
                stm.setFloat(2, discountDecimal);

                stm.setDate(3, new java.sql.Date(startTime.getTime()));
                stm.setDate(4, new java.sql.Date(endTime.getTime()));
                stm.setInt(5, voucherId);

                int rowsAffected = stm.executeUpdate();
                System.out.println("Rows affected: " + rowsAffected);

                // Optionally, you can add logic to check if the update was successful
                // if (rowsAffected > 0) {
                //     System.out.println("Voucher updated successfully.");
                // } else {
                //     System.out.println("Failed to update voucher.");
                // }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print stack trace for debugging
            System.out.println("Error: " + e.getMessage());
        }
    }
     public List<Voucher> getTodaysVouchers() {
        List<Voucher> vouchers = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.connection;
            if (con != null) {
                String sql = "SELECT * FROM Voucher WHERE status = 1 AND CAST(GETDATE() AS DATE) BETWEEN startTime AND endTime";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    Voucher voucher = new Voucher();
                    voucher.setId(rs.getInt("id"));
                    voucher.setName(rs.getString("Name"));
                    voucher.setDiscount(rs.getFloat("discount"));
                    voucher.setStatus(rs.getInt("status"));
                    voucher.setStartTime(rs.getDate("startTime"));
                    voucher.setEndTime(rs.getDate("endTime"));
                    vouchers.add(voucher);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return vouchers;
    }


}
