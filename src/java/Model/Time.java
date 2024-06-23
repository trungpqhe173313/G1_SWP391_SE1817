/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author xdrag
 */
public class Time {

    private String date;
    private List<Shift> shift;

    public Time() {
    }

    public Time(String date, List<Shift> shift) {
        this.date = date;
        this.shift = shift;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<Shift> getShift() {
        return shift;
    }

    public void setShiftId(List<Shift> shiftId) {
        this.shift = shiftId;
    }

    @Override
    public String toString() {
        return "Time{" + "date=" + date + ", shiftId=" + shift + '}';
    }

}
