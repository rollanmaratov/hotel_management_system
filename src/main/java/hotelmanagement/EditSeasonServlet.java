
package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/edit_season")
public class EditSeasonServlet extends HttpServlet {
    public EditSeasonServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Season season = gson.fromJson(reader, Season.class);
        CustomerService service = new CustomerService();
        service.editSeason(season.getHotelID(), season.getName(),
                season.getStartDate(), season.getEndDate(), season.getAlteringPrice());
        PrintWriter out = response.getWriter();
        out.flush();
    }
}
