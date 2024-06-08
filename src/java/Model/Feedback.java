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
    private String content;
    private int customerId;
    private boolean isActive;

    public Feedback() {
    }

    public Feedback(int id, String content, int customerId, boolean isActive) {
        this.id = id;
        this.content = content;
        this.customerId = customerId;
        this.isActive = isActive;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", content=" + content + ", customerId=" + customerId + ", isActive=" + isActive + '}';
    }

    

    
    
    
}
