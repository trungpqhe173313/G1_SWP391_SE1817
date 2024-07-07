/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.LoyaltyPolicies;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ducth
 */
public class PointDAO extends DBContext {

    public List<LoyaltyPolicies> getAllLoyaltyPolicies() {
        List<LoyaltyPolicies> policies = new ArrayList<>();
        String SQL = "SELECT * FROM LoyaltyPolicies";
        
        try (PreparedStatement stmt = connection.prepareStatement(SQL)) {
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                int policyId = rs.getInt("policyId");
                int minAmount = rs.getInt("minAmount");
                int pointsPerUnit = rs.getInt("pointsPerUnit");
                
                LoyaltyPolicies policy = new LoyaltyPolicies(policyId, minAmount, pointsPerUnit);
                policies.add(policy);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return policies;
    }
    public void updateLoyaltyPolicy(int policyId, int minAmount, int pointsPerUnit) {
        String SQL = "UPDATE LoyaltyPolicies SET MinAmount = ?, PointsPerUnit = ? WHERE PolicyID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {
            preparedStatement.setInt(1, minAmount);
            preparedStatement.setInt(2, pointsPerUnit);
            preparedStatement.setInt(3, policyId);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Update successful.");
            } else {
                System.out.println("No policy found with the given ID.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Update failed.");
        }
    }
}
