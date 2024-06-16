/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDateTime;

/**
 *
 * @author xdrag
 */
public class Shift {
    private int id;
    private String startTime;

    public Shift() {
    }

    public Shift(int id, String startTime) {
        this.id = id;
        this.startTime = startTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }


    @Override
    public String toString() {
        return "Shifts{" + "id=" + id + ", startTime=" + startTime+ '}';
    }
    
    
}
