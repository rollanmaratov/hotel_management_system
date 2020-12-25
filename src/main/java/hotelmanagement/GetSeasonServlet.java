
package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet("/get_seasons")
public class GetSeasonServlet extends HttpServlet {
    public GetSeasonServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        CustomerService service = new CustomerService();
        Enumeration<String> email = request.getParameterNames();
        String hotelID =  service.getHotel(email.nextElement());
        ArrayList<Season> seasons = service.getSeason(hotelID);

        Gson gson = new Gson();
        String json = gson.toJson(seasons);
        PrintWriter out = response.getWriter();

        out.print(json);
        out.flush();
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
