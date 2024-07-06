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
        } catch (Exception e) {
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
                stm.setFloat(2, discount);
                
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

    public static void main(String[] args) {
        VoucherDAO dao = new VoucherDAO();
        List<Voucher> v = dao.getAllVouchers();
        System.out.println(v);
    }
}
