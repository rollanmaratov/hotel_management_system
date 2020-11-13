package hotelmanagement;

import java.sql.*;
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

    public String generateGuestID() {
        int num = ThreadLocalRandom.current().nextInt(1, 100000);
        if (num < 10)
            return String.format("%04d", num);
        if (num >= 10 && num < 100) {
            return String.format("%03d", num);
        }
        if (num >= 100 && num < 1000) {
            return String.format("%02d", num);
        }
        if (num >= 1000 && num < 10000) {
            return String.format("%01d", num);
        } else {
            return Integer.toString(num);
        }
    }


    public int createAccount(Guest guest){
        try {
            Connection conn = connect();
            String sql = "select * from User where email = ?;";
            PreparedStatement check = conn.prepareStatement(sql);
            check.setString(1, guest.getEmail());

            ResultSet res = check.executeQuery();
            if (res.next()) {
                return -1;
            }

            PreparedStatement stat = conn.prepareStatement(
                    "insert into User (email, firstname, lastname, password) values(?, ?, ?, ?)");

            stat.setString(1, guest.getEmail());
            stat.setString(2, guest.getFirstname());
            stat.setString(3, guest.getLastname());
            stat.setString(4, guest.getPassword());

            stat.executeUpdate();

            stat = conn.prepareStatement(
                    "insert into Guest (guestID, address, address2, identificationType, identificationNumber , mobilePhoneNumber, homePhoneNumber, guestEmail, sex, dateOfBirth) values(?, ?, ?, ?,?,?,?,?,?,?)");

            String guestId = generateGuestID();
            ResultSet rs = stat.executeQuery("select guestID from Guest");
            while(rs.next()) if (rs.getString("guestID").equals(guestId)) guestId = generateGuestID();

            stat.setString(1, guestId);
            stat.setString(2, guest.getAddressLine1());
            stat.setString(3, guest.getAddressLine2());
            stat.setString(4, guest.getIdType());
            stat.setString(5, guest.getIdNumber());
            stat.setString(6, guest.getMobilePhoneNumber());
            stat.setString(7, guest.getHomePhoneNumber());
            stat.setString(8, guest.getEmail());
            stat.setString(9, guest.getSex());
            stat.setString(10, guest.getDateOfBirth());

            stat.executeUpdate();
            System.out.println("Account created");
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
        return 0;
    }


    public User checkLogin(String email, String password) throws SQLException{
        try {
            Connection conn = connect();
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
            String esql = "select employeeID from User, Employee " +
                    "where email = employeeEmail and email = ?";

            PreparedStatement stat = conn.prepareStatement(esql);
            stat.setString(1, user.getEmail());
            ResultSet eres = stat.executeQuery();

            if(eres.next()){
                return "employee";
            }

            String gsql = "select guestID from User, Guest " +
                    "where email = guestEmail and email = ?";

            PreparedStatement state = conn.prepareStatement(gsql);
            state.setString(1, user.getEmail());
            ResultSet gres = state.executeQuery();

            if(gres.next()){
                return "guest";
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
                    " homePhoneNumber, sex, dateOfBirth from User, Guest " +
                    "where email = guestEmail and email = ?";

            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, email);
            ResultSet res = stat.executeQuery();

            Guest guest = null;
            if(res.next()){
                guest = new Guest();
                guest.setEmail(email);
                System.out.println(res.getString("firstName"));
                guest.setFirstname(res.getString("firstName"));
                System.out.println(guest.getFirstname());
                guest.setLastname(res.getString("lastName"));
                System.out.println(guest.getLastname());
                guest.setAddressLine1(res.getString("address"));
                guest.setAddressLine2(res.getString("address2"));
                guest.setPassword(res.getString("Password"));
                guest.setAddressLine2(res.getString("address2"));
                guest.setIdNumber(res.getString("IdentificationNumber"));
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
}
