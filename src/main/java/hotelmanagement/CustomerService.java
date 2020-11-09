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
            ResultSet rs = stat.executeQuery("select email from users");

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
                    "insert into users (email, firstname, lastname, password) values(?, ?, ?, ?)");

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
    public List<room> checkrooms(String city, Date arrive, Date depart) throws SQLException{
        try {
            Connection conn = connect();
            String sql = "SELECT r.city,r.num_room,r.capacity,r.price FROM rooms as r,booking as b WHERE r.city = ? and r.city=b.city and   arrive>All(select b.Depart from booking as b  ) and depart<All( select b.Arrive from booking as b) and (arrive<depart or arrive=depart)";
            PreparedStatement stat = conn.prepareStatement(sql);

            stat.setString(1, city);

            ResultSet res = stat.executeQuery();

            //room room = null;
            List<room> list=new ArrayList<>() ;
            while(res.next()){
               room room = new room();
                room.setCity(res.getString("city"));
               room.setNum_room(res.getInt("num_room"));
               room.setPrice(res.getInt("price"));
                room.setCapacity(res.getInt("capacity"));
                //room.setArrive(res.getDate("Arrive"));
                //room.setDepart(res.getDate("Depart"));
                list.add(room);
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
