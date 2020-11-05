package hotelmanagement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        String reppassword = request.getParameter("reppassword").trim();
        String firstname = request.getParameter("firstname").trim();
        String lastname = request.getParameter("lastname").trim();
        String idType = request.getParameter("idType").trim();
        String idNumber = request.getParameter("idNumber").trim();
        String address1 = request.getParameter("address1").trim();
        String address2 =  request.getParameter("address2").trim();
        String mphone =  request.getParameter("mphone").trim();
        String hphone =  request.getParameter("hphone").trim();
        String dateOfBirth =  request.getParameter("dateOfBirth").trim();
        String sex =  request.getParameter("sex").trim();
        response.setContentType("text/plain");

        if(!password.equals(reppassword)){
            response.getWriter().print("Passwords do not match");
            return;
        }

        CustomerService service = new CustomerService();

        if(service.mailExists(email)){
            response.getWriter().print("Mail already exists");
            return;
        }

        service.createAccount(email, firstname, lastname, password);
        response.getWriter().print("Success!");
    }
}
