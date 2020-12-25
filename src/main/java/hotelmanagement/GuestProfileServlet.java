package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

@WebServlet("/profile_information")
public class GuestProfileServlet extends HttpServlet {
    public GuestProfileServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerService service = new CustomerService();
        Enumeration<String> email = request.getParameterNames();
        Guest guest = service.getProfileInformation(email.nextElement());

        Gson gson = new Gson();
        String json = gson.toJson(guest);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        out.print(json);
        out.flush();
    }
}