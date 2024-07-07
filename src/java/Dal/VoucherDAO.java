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

//    public static void main(String[] args) {
//        // Tạo đối tượng VoucherDAO
//        VoucherDAO voucherDAO = new VoucherDAO();
//
//        // Dữ liệu kiểm thử
//        String name = "Test Voucher";
//        float discount = 10.0f;
//        
//        // Định dạng ngày kiểm thử
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        Date startTime = null;
//        Date endTime = null;
//        try {
//            startTime = new Date(dateFormat.parse("2024-07-01").getTime());
//            endTime = new Date(dateFormat.parse("2024-07-31").getTime());
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("Định dạng ngày không hợp lệ.");
//            return;
//        }
//
//        // Gọi phương thức addVoucher
//        voucherDAO.addVoucher(name, discount, startTime, endTime);
//
//        // Bạn có thể thêm các kiểm tra bổ sung để xác minh xem dữ liệu đã được thêm thành công vào cơ sở dữ liệu hay chưa.
//    }
}
