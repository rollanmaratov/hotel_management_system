package hotelmanagement;

import com.sun.deploy.net.HttpRequest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

public class CustomerService {

    private static Connection connect(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","prinny");
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
                    " homePhoneNumber, sex, dateOfBirth, userID from User join Guest on User.userID = Guest.guestID " +
                    "where email = ?";

            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, email);
            ResultSet res = stat.executeQuery();

            Guest guest = null;
            if(res.next()){
                guest = new Guest();
                guest.setEmail(email);
                guest.setUserID(res.getInt("userID"));
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
                book.setRoomNumber(res.getInt("roomNumber"));
                book.setTypeName(res.getString("typeName"));
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
            String deleteSql = "delete from Reservation where reservationID = ?";
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

    public ArrayList<Season> getSeason(String hotelID) {
        try {
            Connection conn = connect();
            String sql = "select * from Season where hotelID = ?";
            PreparedStatement state = conn.prepareStatement(sql);
            state.setString(1, hotelID);
            ResultSet res = state.executeQuery();
            ArrayList<Season> seasonList = new ArrayList<Season>();

            while(res.next()) {
                String hotID = res.getString("hotelID");
                String name = res.getString("name");
                String startDate = res.getString("startDate");
                String endDate = res.getString("endDate");
                float alteringPric = res.getFloat("alteringPrice");
                String alteringPrice = Float.toString(alteringPric);
                Season seasonInfo = new Season(hotID, name, startDate, endDate, alteringPrice);
                seasonList.add(seasonInfo);
            }
            conn.close();
            return seasonList;
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        return null;
    }

    public String getHotel( String email){
        try {
            Connection conn = connect();
            String sql = "select hotelID from Employee" +
                    " join User on employeeID = userID" +
                    " where email = ? ";
            PreparedStatement state = conn.prepareStatement(sql);
            state.setString(1, email);
            ResultSet res = state.executeQuery();
            String resID = "";
            if (res.next()) {
                resID = res.getString("hotelID");
            }
            conn.close();
            return resID;
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        return null;
    }

    public void editSeason(String hotelID, String name, String startDate, String endDate, String alteringPrice){
        try {
            Connection conn = connect();
            String sql = "update Season set hotelID = ?, name = ?, startDate = ?, endDate = ?, alteringPrice = ?" +
                    "where name = ?";
            PreparedStatement state = conn.prepareStatement(sql);
            state.setString(1, hotelID);
            state.setString(2, name);
            state.setString(3, startDate);
            state.setString(4, endDate);
            state.setString(5, alteringPrice);
            state.setString(6, name);
            state.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }
    public void createSeason(String hotelID, String name, String startDate, String endDate, String alteringPrice){
        try {
            Connection conn = connect();
            String sql = "insert into Season (hotelID , name, startDate, endDate, alteringPrice) " +
                    "values(?, ?, ?, ?, ?)";
            PreparedStatement state = conn.prepareStatement(sql);
            state.setString(1, hotelID);
            state.setString(2, name);
            state.setString(3, startDate);
            state.setString(4, endDate);
            state.setString(5, alteringPrice);
            state.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }
    public void deleteSeason(String hotelID, String name){
        try{
            Connection conn = connect();
            String sql = "delete from Season where hotelID = ? and name = ?";
            PreparedStatement state = conn.prepareStatement(sql);
            state.setString(1, hotelID);
            state.setString(2, name);
            state.executeUpdate();
            conn.close();
        }catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }
    public void createBooking(  String reservationID, String checkInDate,
                                String checkOutDate, String reservationDate, int guestID,
                                String typeName, String hotelID, int roomNumber) {
        try {
            System.out.println(reservationID);
            System.out.println(checkInDate);
            System.out.println(checkOutDate);
            System.out.println(reservationDate);
            System.out.println(guestID);
            System.out.println(typeName);
            System.out.println(hotelID);
            System.out.println(roomNumber);

            reservationID = Integer.toString((Integer.parseInt(reservationID) + 1));

            Connection conn = connect();
            String sql = "insert into Reservation (reservationID, checkInDate, checkOutDate, reservationDate, guestID, " +
                    "typeName, hotelID, roomNumber) " +
                    "values(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement state = conn.prepareStatement(sql);
            state.setString(1, reservationID);
            state.setString(2, checkInDate);
            state.setString(3, checkOutDate);
            state.setString(4, reservationDate);
            state.setInt(5, guestID);
            state.setString(6, typeName);
            state.setString(7, hotelID);
            state.setInt(8, roomNumber);
            state.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }
    public void editBooking(  String reservationID, String checkInDate,
                              String checkOutDate, String reservationDate, int guestID,
                              String typeName,  String hotelID, int roomNumber) {
        try {
            Connection conn = connect();
            String sql = "update Reservation  set reservationID = ?, checkInDate = ?, checkOutDate = ?, reservationDate = ?, guestID = ?, " +
                    "typeName = ?, hotelID = ?, roomNumber = ?" +
                    "where ReservationID = ?";
            PreparedStatement state = conn.prepareStatement(sql);
            state.setString(1, reservationID);
            state.setString(2, checkInDate);
            state.setString(3, checkOutDate);
            state.setString(4, reservationDate);
            state.setInt(5, guestID);
            state.setString(6, typeName);
            state.setString(7, hotelID);
            state.setInt(8, roomNumber);
            state.setString(9, reservationID);
            state.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }

    public List<Room> checkRooms(String city, int capacity, Date arrive, Date depart, Cookie cookies) throws SQLException{
        try {
            Connection conn = connect();

            String sql = "select distinct h.address, r.typeName, rt.capacity, rt.monPrice, rt.sunPrice, r.number, h.hotelID from reservation as res, room as r, hotel as h, roomtype as rt " +
                    "where r.typeName = rt.typeName and rt.capacity >= ? " +
                    "and r.hotelID = h.hotelID and rt.hotelID = h.hotelID and h.address = ? and " +
                    "not ((res.checkInDate <= ? and res.checkOutDate >= ?) or " +
                    "(res.checkInDate <= ? and res.checkOutDate >= ?) or " +
                    "(res.checkInDate >= ? and res.checkOutDate <= ?)) group by r.typeName;";

            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, Integer.toString(capacity));
            stat.setString(2, city);
            stat.setString(3, new SimpleDateFormat("yyyy-MM-dd").format(arrive));
            stat.setString(4, new SimpleDateFormat("yyyy-MM-dd").format(arrive));
            stat.setString(5, new SimpleDateFormat("yyyy-MM-dd").format(depart));
            stat.setString(6, new SimpleDateFormat("yyyy-MM-dd").format(depart));
            stat.setString(7, new SimpleDateFormat("yyyy-MM-dd").format(arrive));
            stat.setString(8, new SimpleDateFormat("yyyy-MM-dd").format(depart));

            ResultSet res = stat.executeQuery();

            List<Room> list = new ArrayList<>();

            Calendar start = Calendar.getInstance();
            Calendar end = Calendar.getInstance();
            Calendar dat1 = Calendar.getInstance();
            Calendar dat2 = Calendar.getInstance();

            dat1.setTime(arrive);
            dat2.setTime(depart);

            start.set(dat1.get(Calendar.YEAR), dat1.get(Calendar.MONTH), dat1.get(Calendar.DAY_OF_MONTH));
            end.set(dat2.get(Calendar.YEAR), dat2.get(Calendar.MONTH), dat2.get(Calendar.DAY_OF_MONTH));

            float tempPrice = 0;

            while(res.next()){
                Room r = new Room();
                r.setCity(res.getString("address"));
                r.setTypeName(res.getString("typename"));
                r.setCapacity(res.getInt("capacity"));

                PreparedStatement st = conn.prepareStatement("select count(*) as rowcount from reservation");
                ResultSet info = st.executeQuery();

                info.next();

                r.setReservationID(info.getString("rowcount"));

                info.close();

                r.setRoomNumber(res.getInt("number"));
                r.setHotelID(res.getString("hotelID"));

                String em = cookies.getValue();

                System.out.println(em);

                PreparedStatement st2 = conn.prepareStatement("select userID from user where email = ?");
                st2.setString(1, em);
                ResultSet info2 = st2.executeQuery();

                info2.next();

                r.setGuestID(info2.getInt("userID"));

                while(start.before(end)){
                    if(start.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY || start.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY){
                        tempPrice = tempPrice + res.getFloat("sunPrice");
                    } else {
                        tempPrice = tempPrice + res.getFloat("monPrice");
                    }
                    start.add(Calendar.DATE, 1);
                }

                r.setPrice(tempPrice);
                list.add(r);
            }

            conn.close();

            return list;

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        return null;
    }
}

