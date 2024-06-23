/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LINHNTHE170290
 */
public class FeedbackDAO extends DBContext {

    // Method to add a new feedback
    public void addFeedback(Feedback feedback) {
        String sql = "INSERT INTO feedback (noidung, customerId, isActive) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, feedback.getNoidung());
            stmt.setInt(2, feedback.getCustomerId());
            stmt.setBoolean(3, feedback.isActive());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Method to get feedback by customer ID
    public Feedback getFeedbackByCustomerId(int customerId) {
    String sql = "SELECT * FROM feedback WHERE customerId = ?";
    try {
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setInt(1, customerId); // Thiếu dòng này trong mã của bạn
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            Feedback feedback = new Feedback();
            feedback.setId(rs.getInt("id"));
            feedback.setNoidung(rs.getString("noidung"));
            feedback.setCustomerId(rs.getInt("customerId"));
            feedback.setIsActive(rs.getBoolean("isActive"));
            return feedback;
        }
    } catch (SQLException ex) {
        Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
}


    // Method to get all feedbacks
    public List<Feedback> getAllFeedbacks() {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM feedback";
        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setNoidung(rs.getString("noidung"));
                feedback.setCustomerId(rs.getInt("customerId"));
                feedback.setIsActive(rs.getBoolean("isActive"));
                feedbackList.add(feedback);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbackList;
    }

    // Method to update feedback
    public void updateFeedback(Feedback feedback) {
        String sql = "UPDATE feedback SET noidung = ?, isActive = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, feedback.getNoidung());
            stmt.setBoolean(2, feedback.isActive());
            stmt.setInt(3, feedback.getId());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Method to delete feedback
    public void deleteFeedback(int id) {
        String sql = "DELETE FROM feedback WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        FeedbackDAO fb = new FeedbackDAO();
        Feedback feedback = fb.getFeedbackByCustomerId(1);

        // In thông tin tài khoản nếu đăng nhập thành công
        if (feedback != null) {
            System.out.println("Login successful!");
             System.out.println("ID: " + feedback.getId());
            System.out.println("Content: " + feedback.getNoidung());
            System.out.println("Customer ID: " + feedback.getCustomerId());
            System.out.println("Is Active: " + feedback.isActive());
        } else {
            System.out.println("Login failed: Invalid!");

        }
    }
}
