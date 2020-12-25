package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import javax.ws.rs.GET;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    public SearchServlet() {
        super();
    }
    private Gson gson = new Gson();

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Room> list = new ArrayList<>();

        String city = request.getParameter("city").trim();
        int capacity = Integer.parseInt(request.getParameter("people").trim());
        String arrTemp = request.getParameter("arrive").trim();
        String depTemp = request.getParameter("depart").trim();

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date arrive = null;
        Date depart = null;

        arrive = Date.valueOf(arrTemp);
        depart = Date.valueOf(depTemp);

        CustomerService service = new CustomerService();
        Cookie[] cookies = request.getCookies();

        try {
            list = service.checkRooms(city, capacity, arrive, depart, cookies[1]);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        String listJsonString = this.gson.toJson(list);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        out.print(listJsonString);
        out.flush();
    }
}