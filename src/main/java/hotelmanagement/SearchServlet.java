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
        List<room> list=new ArrayList<>() ;


        String city = request.getParameter("city").trim();
        String capacity = request.getParameter("people").trim();
        String arrive1 = request.getParameter("arrive").trim();
        DateFormat dateFormat=new
        SimpleDateFormat("dd/MM/yyyy");
        Date arrive = null;
        try {
            arrive = (Date) dateFormat.parse(arrive1);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String depart1 = request.getParameter("depart").trim();



        Date depart = null;
        try {
            depart = (Date) dateFormat.parse(depart1);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        CustomerService service = new CustomerService();
        try {
             list=service.checkrooms(city,arrive,depart);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        String listJsonString = this.gson.toJson(list);

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(listJsonString);
        out.flush();
        //Gson gson = new Gson();

        //Object list;
        return Response.ok(gson.toJson(list)).build();
    }
}