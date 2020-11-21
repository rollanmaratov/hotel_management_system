package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Guest guest = gson.fromJson(reader, Guest.class);
        CustomerService service = new CustomerService();
        int ca = service.createAccount(guest);
        String destPage = "register.jsp";
        if (ca == -1) {
            //response.getWriter().print("Account with this email already exists!");
            String message = "Account with this email already exists!";
            request.setAttribute("message", message);
        } else {
            //response.getWriter().print("Success!");
            destPage = "index.jsp";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
        response.sendRedirect(destPage);
    }
}
