package hotelmanagement;

public class Season {
    public Season(String hotelID, String name, String startDate, String endDate, String alteringPrice){
       this.hotelID = hotelID;
       this.name = name;
       this.startDate = startDate;
       this.endDate = endDate;
       this.alteringPrice = alteringPrice;
    }

    private String name;
    private String startDate;
    private String endDate;
    private String alteringPrice;
    private String hotelID;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getAlteringPrice() { return alteringPrice; }

    public void setAlteringPrice(String alteringPrice) {
        this.alteringPrice = alteringPrice;
    }

    public String getHotelID() {
        return hotelID;
    }

    public void setHotelID(String hotelID) {
        this.hotelID = hotelID;
    }
}

