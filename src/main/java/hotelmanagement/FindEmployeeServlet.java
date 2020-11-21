package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet("/find_employee")
public class FindEmployeeServlet extends HttpServlet {
    public FindEmployeeServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/plain");
        CustomerService service = new CustomerService();
        Enumeration<String> params = request.getParameterNames();
        int empID = Integer.parseInt(params.nextElement());
        Employee emp = service.findEmp(empID);
        if (emp != null) {
            Gson gson = new Gson();
            String json = gson.toJson(emp);
            response.getWriter().print("employee found!");
        } else {
            response.getWriter().print("employee not found!");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
