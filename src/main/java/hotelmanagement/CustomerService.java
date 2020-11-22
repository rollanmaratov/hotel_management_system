package hotelmanagement;

import java.sql.*;
import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;

public class CustomerService {

    private static Connection connect(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hotel","root","Backtoblack06");
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        System.out.println("Connection failed");
        return null;
    }

    public int generateID() {
        int num = ThreadLocalRandom.current().nextInt(1, 100000);
        return num;
    }


    public int createAccount(Guest guest){
        try {
            Connection conn = connect();
            String sql = "select * from User where email = ?;";
            PreparedStatement check = conn.prepareStatement(sql);
            check.setString(1, guest.getEmail());

            ResultSet res = check.executeQuery();
            if (res.next()) {
                conn.close();
                return -1;
            }

            PreparedStatement stat = conn.prepareStatement(
                    "insert into User (email, firstname, lastname, password, userID) values(?, ?, ?, ?, ?)");

            int userID = generateID();
            stat.setString(1, guest.getEmail());
            stat.setString(2, guest.getFirstname());
            stat.setString(3, guest.getLastname());
            stat.setString(4, guest.getPassword());
            stat.setInt(5, userID);

            stat.executeUpdate();

            stat = conn.prepareStatement(
                    "insert into Guest ( address, address2, identificationType, identificationNumber , mobilePhoneNumber, homePhoneNumber, sex, dateOfBirth, guestID) values(?, ?, ?, ?, ?, ?, ?, ?, ?)");

            ResultSet rs = stat.executeQuery("select guestID from Guest");

            stat.setString(1, guest.getAddressLine1());
            stat.setString(2, guest.getAddressLine2());
            stat.setString(3, guest.getIdType());
            stat.setInt(4, guest.getIdNumber());
            stat.setString(5, guest.getMobilePhoneNumber());
            stat.setString(6, guest.getHomePhoneNumber());
            stat.setString(7, guest.getSex());
            stat.setString(8, guest.getDateOfBirth());
            stat.setInt(9, userID);

            stat.executeUpdate();
            System.out.println("Account created");

            conn.close();
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
        return 0;
    }


    public User checkLogin(String email, String password) throws SQLException{
        try {
            Connection conn = connect();
            //first check if user with this email exists
            String sql1 = "SELECT * FROM User WHERE email = ?";
            PreparedStatement state = conn.prepareStatement(sql1);

            state.setString(1, email);

            ResultSet res1 = state.executeQuery();

            if(!res1.next()) {
                conn.close();
                return null;
            }

            //then check if password and email match
            String sql = "SELECT * FROM User WHERE email = ? and password = ?";
            PreparedStatement stat = conn.prepareStatement(sql);

            stat.setString(1, email);
            stat.setString(2, password);

            ResultSet res = stat.executeQuery();

            User user = null;
            if(res.next()){
                user = new User();
                user.setFirstname(res.getString("firstName"));
                user.setLastname(res.getString("lastName"));
                user.setEmail(email);
                user.setPassword(password);
                user.setUserID(res.getInt("userID"));
            }

            conn.close();
            return user;

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        return null;
    }

    public String checkUserType(User user) {
        try {
            Connection conn = connect();

            String gsql = "select * from Guest " +
                    "where guestID = ?";

            PreparedStatement state = conn.prepareStatement(gsql);
            state.setInt(1, user.getUserID());
            ResultSet gres = state.executeQuery();

            if(gres.next()) {
                conn.close();
                return "guest";
            }

            String esql = "select position from Employee " +
                    "where employeeID = ?";

            PreparedStatement stat = conn.prepareStatement(esql);
            stat.setInt(1, user.getUserID());
            ResultSet eres = stat.executeQuery();

            if(eres.next()){
                String pos = eres.getString("position");
                conn.close();
                return pos;
            }

            conn.close();

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
        return null;
    }

    public User getUserInformation(String email) {
        try {
            Connection conn = connect();
            String sql = "select firstName, lastName from User " +
                    "where email = ?";

            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, email);
            ResultSet res = stat.executeQuery();

            User user = null;
            if(res.next()){
                user = new Guest();
                user.setEmail(email);
                user.setFirstname(res.getString("firstName"));
                user.setLastname(res.getString("lastName"));
            }

            conn.close();
            return user;

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
        return null;
    }

    public Guest getProfileInformation(String email) {
        try {
            Connection conn = connect();
            String sql = "select firstName, lastName, password, address, address2," +
                    " identificationType, identificationNumber, mobilePhoneNumber," +
                    " homePhoneNumber, sex, dateOfBirth from User join Guest on User.userID = Guest.guestID " +
                    "where email = ?";

            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, email);
            ResultSet res = stat.executeQuery();

            Guest guest = null;
            if(res.next()){
                guest = new Guest();
                guest.setEmail(email);
                guest.setFirstname(res.getString("firstName"));
                guest.setLastname(res.getString("lastName"));
                guest.setAddressLine1(res.getString("address"));
                guest.setAddressLine2(res.getString("address2"));
                guest.setPassword(res.getString("Password"));
                guest.setAddressLine2(res.getString("address2"));
                guest.setIdNumber(res.getInt("IdentificationNumber"));
                guest.setIdType(res.getString("IdentificationType"));
                guest.setMobilePhoneNumber(res.getString("mobilePhoneNumber"));
                guest.setSex(res.getString("sex"));
                guest.setHomePhoneNumber(res.getString("homePhoneNumber"));
                guest.setDateOfBirth(res.getString("dateOfBirth"));
            }

            conn.close();
            return guest;

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        return null;
    }

    public ArrayList<Booking> getBooking(int guestID) {
        try {
            Connection conn = connect();
            String sql = "SELECT * FROM Reservation WHERE guestID = ?";
            PreparedStatement stat = conn.prepareStatement(sql);

            stat.setInt(1, guestID);

            ResultSet res = stat.executeQuery();

            ArrayList<Booking> bookings = new ArrayList<>();

            while(res.next()){
                Booking book = new Booking();
                book.setReservationID(res.getString("reservationID"));
                book.setCheckInDate(res.getString("checkInDate"));
                book.setCheckOutDate(res.getString("checkOutDate"));
                book.setReservationDate(res.getString("reservationDate"));
                book.setGuestID(guestID);
                book.setTypeName(res.getString("typeName"));
                book.setDayOfTheWeek(res.getString("dayOftheWeek"));
                book.setHotelID(res.getString("hotelID"));
                bookings.add(book);
            }

            conn.close();

            if (bookings.size() != 0) {
                return bookings;
            } else {return null;}

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
        return null;
    }

    public void deleteBooking(String bookingID) {
        try {
            Connection conn = connect();
            String deleteSql = "DELETE FROM Reservation where reservationID = ?";
            PreparedStatement state = conn.prepareStatement(deleteSql);
            state.setString(1, bookingID);
            state.executeUpdate();

            conn.close();

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
    }

    public Employee findEmp(int empID) {
        try {
            Connection conn = connect();
            String sql = "select * from Employee where employeeID = ?";
            PreparedStatement state = conn.prepareStatement(sql);
            state.setInt(1, empID);
            ResultSet res = state.executeQuery();

            Employee emp = null;
            if (res.next()) {
                emp = new Employee();
                emp.setHotelID(res.getString("hotelID"));
                emp.setUserID(empID);
                emp.setPosition(res.getString("position"));
                emp.setHourSalary(res.getFloat("hourSalary"));
                emp.setMonHours(res.getInt("monHours"));
                emp.setTueHours(res.getInt("tueHours"));
                emp.setWedHours(res.getInt("wedHours"));
                emp.setThuHours(res.getInt("thuHours"));
                emp.setFriHours(res.getInt("friHours"));
                emp.setSatHours(res.getInt("satHours"));
                emp.setSunHours(res.getInt("sunHours"));
            }

            conn.close();
            return emp;

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
        return null;
    }

    public void manageEmp(Employee emp) {
        try {
            Connection conn = connect();
            String sql = "update Employee set monHours = ?, tueHours = ?, wedHours = ?," +
                    "thuHours = ?, friHours = ?, satHours = ?, sunHours = ?, hourSalary = ?" +
                    "where employeeID = ?";
            PreparedStatement state = conn.prepareStatement(sql);
            state.setInt(1, emp.getMonHours());
            state.setInt(2, emp.getTueHours());
            state.setInt(3, emp.getWedHours());
            state.setInt(4, emp.getThuHours());
            state.setInt(5, emp.getFriHours());
            state.setInt(6, emp.getSatHours());
            state.setInt(7, emp.getSunHours());
            state.setFloat(8, emp.getHourSalary());
            state.setInt(9, emp.getUserID());
            state.executeUpdate();

            conn.close();

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
    }
}

