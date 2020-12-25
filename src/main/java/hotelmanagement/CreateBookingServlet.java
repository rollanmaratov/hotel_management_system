package hotelmanagement;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/create_booking")
public class CreateBookingServlet extends HttpServlet {
    public CreateBookingServlet() {
        super();
    }

//    @Override
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("application/json");
//        BufferedReader reader = request.getReader();
//        Gson gson = new Gson();
//        Booking booking = gson.fromJson(reader, Booking.class);
//        CustomerService service = new CustomerService();
//        service.editBooking(booking.getReservationID(), booking.getCheckInDate(),
//                booking.getCheckOutDate(), booking.getReservationDate(), booking.getGuestID(),
//                booking.getTypeName(), booking.getHotelID(), booking.getRoomNumber());
//        PrintWriter out = response.getWriter();
//        out.flush();
//    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        CustomerService service = new CustomerService();

        service.createBooking(request.getParameter("reservationID"), request.getParameter("checkInDate"),
                request.getParameter("checkOutDate"), request.getParameter("reservationDate"), Integer.parseInt(request.getParameter("guestID")),
                request.getParameter("typeName"), request.getParameter("hotelID"), Integer.parseInt(request.getParameter("roomNumber")));
        PrintWriter out = response.getWriter();
        out.flush();
    }
}

