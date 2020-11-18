package hotelmanagement;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {

    private static Connection connect(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost/hotel","root","318740-adil7");
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
            ResultSet rs = stat.executeQuery("select email from user");

            while(rs.next()) if(rs.getString("email").equals(email)) return true;
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        System.out.println("The account does not exit");
        return false;
    }

    public void createAccount(String email, String firstname, String lastname, String password){
        try {
            Connection conn = connect();
            PreparedStatement stat = conn.prepareStatement(
                    "insert into user (email, firstname, lastname, password) values(?, ?, ?, ?)");

            stat.setString(1, email);
            stat.setString(2, firstname);
            stat.setString(3, lastname);
            stat.setString(4, password);

            stat.executeUpdate();

            System.out.println("Account created");
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
    }

    public User checkLogin(String email, String password) throws SQLException{
        try {
            Connection conn = connect();
            String sql = "SELECT * FROM user WHERE email = ? and password = ?";
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
    public List<Room> checkRooms(String city, int capacity, Date arrive, Date depart) throws SQLException{
        try {
            Connection conn = connect();

            String sql = "select * from reservation as res, room as r where";
            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1, city);
            ResultSet res = stat.executeQuery();

            List<Room> list = new ArrayList<>();

            while(res.next()){
                Room r = new Room();
                r.setCity(res.getString("city"));
                r.setNum_room(res.getInt("num_room"));
                r.setPrice(res.getInt("price"));
                r.setCapacity(res.getInt("capacity"));
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
