package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        //Guest guest = gson.fromJson(reader, Guest.class);

        //System.out.println(guest.getFirstname());

        response.getWriter().print("Success!");
    }
}
