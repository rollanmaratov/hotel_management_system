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

    public String getStartDate() {
        return startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public String getAlteringPrice() { return alteringPrice; }

    public String getHotelID() {
        return hotelID;
    }
}

