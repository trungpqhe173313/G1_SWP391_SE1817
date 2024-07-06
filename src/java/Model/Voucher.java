/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.util.Date;
/**
 *
 * @author LENOVO
 */
public class Voucher {
    
    private int id;
    private String name;
    private float discount;
    private int status;
    private Date startTime;
    private Date endTime;

    public Voucher() {
    }

    public Voucher(int id, String name, float discount, int status, Date startTime, Date endTime) {
        this.id = id;
        this.name = name;
        this.discount = discount;
        this.status = status;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "Voucher{" + "id=" + id + ", name=" + name + ", discount=" + discount + ", status=" + status + ", startTime=" + startTime + ", endTime=" + endTime + '}';
    }
    
    
    
}
