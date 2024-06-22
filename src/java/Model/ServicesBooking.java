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
public class ServicesBooking {

    private int totalMoney, quantityServices;
    private List<Services> listServices;

    public ServicesBooking(int totalMoney, int quantityServices, List<Services> listServices) {
        this.totalMoney = totalMoney;
        this.quantityServices = quantityServices;
        this.listServices = listServices;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getQuantityServices() {
        return quantityServices;
    }

    public void setQuantityServices(int quantityServices) {
        this.quantityServices = quantityServices;
    }

    public List<Services> getListServices() {
        return listServices;
    }

    public void setListServices(List<Services> listServices) {
        this.listServices = listServices;
    }

    @Override
    public String toString() {
        return "ServicesBooking{" + "totalMoney=" + totalMoney + ", quantityServices=" + quantityServices + ", listServices=" + listServices + '}';
    }
}
