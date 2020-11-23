package hotelmanagement;

import java.util.Date;

public class Room {
    private String city;
    private String typeName;
    private int capacity;
    private float price;
    private Date arrive;

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public void setArrive(Date arrive) {
        this.arrive = arrive;
    }

    public void setDepart(Date depart) {
        this.depart = depart;
    }

    private Date depart;


    public Date getArrive() {
        return arrive;
    }

    public Date getDepart() {
        return depart;
    }


    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
