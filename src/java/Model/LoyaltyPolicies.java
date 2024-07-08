/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phamt
 */
public class LoyaltyPolicies {
    //tính điểm cho từng đơn hàng 
    private int id;
    private int MinAmount;
    private int points;    

    public LoyaltyPolicies(int id, int MinAmount, int points) {
        this.id = id;
        this.MinAmount = MinAmount;
        this.points = points;
    }

    public LoyaltyPolicies() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMinAmount() {
        return MinAmount;
    }

    public void setMinAmount(int MinAmount) {
        this.MinAmount = MinAmount;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
    
    
    
}
