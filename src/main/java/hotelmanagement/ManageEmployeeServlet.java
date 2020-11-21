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
import java.util.Enumeration;

@WebServlet("/manage_employee")
public class ManageEmployeeServlet extends HttpServlet {
    public ManageEmployeeServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Employee emp = gson.fromJson(reader, Employee.class);
        System.out.println("Employee Monday" + emp.getMonHours());
        System.out.println("Employee ID: " + emp.getUserID());
        CustomerService service = new CustomerService();
        service.manageEmp(emp);
        //response.setStatus(200);
    }
}