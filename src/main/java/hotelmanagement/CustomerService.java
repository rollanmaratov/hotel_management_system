package hotelmanagement;

import java.sql.*;

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

    public boolean passMatch(String email, String password){
        try {
            Connection conn = connect();
            Statement stat = conn.createStatement();

            String exec = "select password from users where email='"+email+"'";

            try (ResultSet rs = stat.executeQuery(exec)) {
                rs.next();
                if (rs.getString("password").equals(password)) return true;
                return false;
            }

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        System.out.println("passwords do not match");
        return false;
    }
}
