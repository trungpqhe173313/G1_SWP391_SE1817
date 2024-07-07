/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ducth
 */
import Dal.PointDAO;
import Model.LoyaltyPolicies;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        PointDAO pointDAO = new PointDAO();

        // Call the DAO method to fetch all loyalty policies
        List<LoyaltyPolicies> policies = pointDAO.getAllLoyaltyPolicies();

        // Print the fetched loyalty policies
        for (LoyaltyPolicies policy : policies) {
            System.out.println("Policy ID: " + policy.getPolicyId());
            System.out.println("Minimum Amount: " + policy.getMinAmount());
            System.out.println("Points per Unit: " + policy.getPointsPerUnit());
            System.out.println("----------------------");
        }
    }
}


