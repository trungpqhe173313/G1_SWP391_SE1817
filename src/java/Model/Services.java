/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author xdrag
 */
public class Services {
    private int  servicesId;
    private String name;
    private String image;
    private int price;
    private String description;
    private boolean isActive;
//    private int classificationId;
    

    public Services() {
    }

    public Services(int servicesId, String name, String image, int price, String description, boolean isActive) {
        this.servicesId = servicesId;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.isActive = isActive;
//        this.classificationId = classificationId;
    }

    public int getServicesId() {
        return servicesId;
    }

    public void setServicesId(int servicesId) {
        this.servicesId = servicesId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

//    public int getClassificationId() {
//        return classificationId;
//    }
//
//    public void setClassificationId(int classificationId) {
//        this.classificationId = classificationId;
//    }

    @Override
    public String toString() {
        return "Services{" + "servicesId=" + servicesId + ", name=" + name + ", image=" + image + ", price=" + price + ", description=" + description + ", isActive=" + isActive + '}';
    }

    

    
    
    
    
}
