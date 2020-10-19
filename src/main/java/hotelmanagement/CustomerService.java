package hotelmanagement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;

public class CustomerService {

    protected Statement connect(){
        Connection c = null;
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/DistDB");
            Connection conn = ds.getConnection();

            Statement stat = c.createStatement();

            return stat;
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        System.out.println("Connection failed");
        return null;
    }

    public boolean mailExists(String email){
        try {
            Statement stat = connect();
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
            Statement stat = connect();

            stat.executeUpdate("insert into users (email, fistname, lastname, password)"+
                                "values(" + email + "," + firstname + "," + lastname + "," + password + ");"
            );

            System.out.println("Account created");
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
    }

    public boolean passMatch(String email, String password){
        try {
            Statement stat = connect();
            ResultSet rs = stat.executeQuery("select password from users where email = " + email);
            if(rs.getString("password").equals(password)) return true;
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }

        System.out.println("passwords do not match");
        return false;
    }
}
