package hotelmanagement;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LogInPage extends HttpServlet {

    public LogInPage(){
        super();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        CustomerService service = new CustomerService();
        response.setContentType("text/plain");

        if(!(service.mailExists(email)) || !(service.passMatch(email, password)))
            response.getWriter().print("Password or email is incorrect");
        else
            response.getWriter().print("Success!");
    }

}

