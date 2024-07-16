/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;

/**
 *
 * @author phamt
 */
public class Store {
    private int id;
    private boolean isActive;
    private LocalDate startDate;
    private LocalDate endDate;

    public Store() {
    }

    public Store(int id, boolean isActive) {
        this.id = id;
        this.isActive = isActive;
    }

    public Store(int id, boolean isActive, LocalDate startDate, LocalDate endDate) {
        this.id = id;
        this.isActive = isActive;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Store{" + "id=" + id + ", isActive=" + isActive + ", startDate=" + startDate + ", endDate=" + endDate + '}';
    }
    
    
}
