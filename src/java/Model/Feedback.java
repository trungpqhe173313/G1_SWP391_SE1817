/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phamt
 */
public class Feedback {
    private int id;
    private String noidung;
    private int customerId;
    private boolean isActive;

    public Feedback() {
    }

    public Feedback(int id, String noidung, int customerId, boolean isActive) {
        this.id = id;
        this.noidung = noidung;
        this.customerId = customerId;
        this.isActive = isActive;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNoidung() {
        return noidung;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }
    
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", noidung=" + noidung + ", customerId=" + customerId + ", isActive=" + isActive + '}';
    }

   

    

    
    
    
}
