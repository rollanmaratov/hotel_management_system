package hotelmanagement;

import java.util.Date;

public class room {
    private String city;
    private int num_room;
    private int capacity;
    private int price;
    private Date arrive;

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

    public int getNum_room() {
        return num_room;
    }

    public void setNum_room(int num_room) {
        this.num_room= num_room;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
