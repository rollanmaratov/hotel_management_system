
package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/delete_season")
public class DeleteSeasonServlet extends HttpServlet {
    public DeleteSeasonServlet() {
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
        service.deleteSeason(season.getHotelID(), season.getName());
        PrintWriter out = response.getWriter();
        out.flush();
    }
}
