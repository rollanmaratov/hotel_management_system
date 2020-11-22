package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Guest guest = gson.fromJson(reader, Guest.class);
        CustomerService service = new CustomerService();
        int ca = service.createAccount(guest);
        PrintWriter out = response.getWriter();

        if (ca == -1) {
            out.print("{\"message\": \"Account with this email already exists!\"}");
        } else {
            out.print("{\"message\": \"success\"}");
        }
        out.flush();
    }
}
