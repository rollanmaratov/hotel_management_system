package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet("/find_employee")
public class FindEmployeeServlet extends HttpServlet {
    public FindEmployeeServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       response.setContentType("application/json");
        CustomerService service = new CustomerService();
        Enumeration<String> params = request.getParameterNames();
        int empID = Integer.parseInt(params.nextElement());
        Employee emp = service.findEmp(empID);
        PrintWriter out = response.getWriter();
        if (emp != null) {
            Gson gson = new Gson();
            String json = gson.toJson(emp);
            System.out.println("EMPLOYEE POS" + emp.getPosition());
            out.print(json);
        } else {
            out.print("null");
        }
        out.flush();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
