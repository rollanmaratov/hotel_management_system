package hotelmanagement;

import java.sql.*;
import java.util.concurrent.ThreadLocalRandom;

public class CustomerService {

    private static Connection connect(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Hotel_management","root","Backtoblack06");
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        System.out.println("Connection failed");
        return null;
    }

    public boolean mailExists(String email){
        try {
            Connection conn = connect();
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery("select email from users");

            while(rs.next()) if(rs.getString("email").equals(email)) return true;
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        System.out.println("The account does not exit");
        return false;
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

    public void createAccount(Guest guest){
        try {
            Connection conn = connect();
            PreparedStatement stat = conn.prepareStatement(
                    "insert into users (email, firstname, lastname, password) values(?, ?, ?, ?)");

            stat.setString(1, guest.getEmail());
            stat.setString(2, guest.getFirstname());
            stat.setString(3, guest.getLastname());
            stat.setString(4, guest.getPassword());

            stat.executeUpdate();

            stat = conn.prepareStatement(
                    "insert into Guest (guestID, address, address2, IDType, IDNumber, mobilePhoneNumber, homePhoneNumber, guestEmail, sex, dateOfBirth) values(?, ?, ?, ?,?,?,?,?,?,?)");

            String guestId = generateGuestID();
            ResultSet rs = stat.executeQuery("select guestID from Guest");

            while(rs.next()) if (rs.getString("guestID") == guestId) guestId = generateGuestID();
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
    }

//    public boolean passMatch(String email, String password){
//        try {
//            Connection conn = connect();
//            Statement stat = conn.createStatement();
//
//            String exec = "select password from users where email='"+email+"'";
//
//            try (ResultSet rs = stat.executeQuery(exec)) {
//                rs.next();
//                if (rs.getString("password").equals(password)) return true;
//                return false;
//            }
//
//        } catch ( Exception e ) {
//            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
//            System.exit(0);
//        }
//
//        System.out.println("passwords do not match");
//        return false;
//    }

    public User checkLogin(String email, String password) throws SQLException{
        try {
            Connection conn = connect();
            String sql = "SELECT * FROM users WHERE email = ? and password = ?";
            PreparedStatement stat = conn.prepareStatement(sql);

            stat.setString(1, email);
            stat.setString(2, password);

            ResultSet res = stat.executeQuery();

            User user = null;
            if(res.next()){
                user = new User();
                user.setFirstname(res.getString("firstname"));
                user.setLastname(res.getString("lastname"));
                user.setEmail(res.getString("email"));
            }

            conn.close();

            return user;

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        return null;
    }
}
