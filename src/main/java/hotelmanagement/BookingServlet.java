package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet("/get_bookings")
public class BookingServlet extends HttpServlet {
    public BookingServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerService service = new CustomerService();
        Enumeration<String> email = request.getParameterNames();
        Guest guest = service.getProfileInformation(email.nextElement());
        System.out.println("User id is: " + guest.getUserID());
        ArrayList<Booking> bookings = service.getBooking(guest.getUserID());
        Gson gson = new Gson();
        String json = gson.toJson(bookings);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        out.print(json);
        out.flush();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


}
