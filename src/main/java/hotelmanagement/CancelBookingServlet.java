package hotelmanagement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet("/cancel_booking")
public class CancelBookingServlet extends HttpServlet {
    public CancelBookingServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerService service = new CustomerService();
        Enumeration<String> params = request.getParameterNames();
        String bookingID = params.nextElement();
        service.deleteBooking(bookingID);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{ \"message\" : \"success\"}");
        out.flush();
    }
}
