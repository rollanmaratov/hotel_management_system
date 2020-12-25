package hotelmanagement;

public class Employee extends User {
    private String hotelID;
    private String position;
    private int monHours;
    private int tueHours;
    private int wedHours;
    private int thuHours;
    private int friHours;
    private int satHours;
    private int sunHours;
    private float hourSalary;

    public String getHotelID() {
        return hotelID;
    }

    public void setHotelID(String hotelID) {
        this.hotelID = hotelID;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getMonHours() {
        return monHours;
    }

    public void setMonHours(int monHours) {
        this.monHours = monHours;
    }

    public int getTueHours() {
        return tueHours;
    }

    public void setTueHours(int tueHours) {
        this.tueHours = tueHours;
    }

    public int getWedHours() {
        return wedHours;
    }

    public void setWedHours(int wedHours) {
        this.wedHours = wedHours;
    }

    public int getThuHours() {
        return thuHours;
    }

    public void setThuHours(int thuHours) {
        this.thuHours = thuHours;
    }

    public int getFriHours() {
        return friHours;
    }

    public void setFriHours(int friHours) {
        this.friHours = friHours;
    }

    public int getSatHours() {
        return satHours;
    }

    public void setSatHours(int satHours) {
        this.satHours = satHours;
    }

    public int getSunHours() {
        return sunHours;
    }

    public void setSunHours(int sunHours) {
        this.sunHours = sunHours;
    }

    public float getHourSalary() {
        return hourSalary;
    }

    public void setHourSalary(float hourSalary) {
        this.hourSalary = hourSalary;
    }
}
