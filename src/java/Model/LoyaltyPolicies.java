/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducth
 */
public class LoyaltyPolicies {
    private int policyId;
    private int minAmount;
    private int pointsPerUnit;

    public LoyaltyPolicies(int policyId, int minAmount, int pointsPerUnit) {
        this.policyId = policyId;
        this.minAmount = minAmount;
        this.pointsPerUnit = pointsPerUnit;
    }

    public int getPolicyId() {
        return policyId;
    }

    public void setPolicyId(int policyId) {
        this.policyId = policyId;
    }

    public int getMinAmount() {
        return minAmount;
    }

    public void setMinAmount(int minAmount) {
        this.minAmount = minAmount;
    }

    public int getPointsPerUnit() {
        return pointsPerUnit;
    }

    public void setPointsPerUnit(int pointsPerUnit) {
        this.pointsPerUnit = pointsPerUnit;
    }
}
