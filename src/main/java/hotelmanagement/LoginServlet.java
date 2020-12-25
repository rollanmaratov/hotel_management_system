package hotelmanagement;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public LoginServlet(){
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie: cookies) {
                System.out.println(cookie.getValue());
            }
            //cookies 1 for email
            //cookies 2 for UserType
            String email = cookies[1].getValue();
            CustomerService service = new CustomerService();
            User user = service.getUserInformation(email);

            Gson gson = new Gson();
            String s = gson.toJson(user);
            //check
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            out.print(s);
            out.flush();
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        CustomerService service = new CustomerService();

        try {
            User user = service.checkLogin(email, password);
            String destPage = "login.jsp";

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                //create cookie with email to store user info
                Cookie emailCookie = new Cookie("userEmail", email);
                emailCookie.setMaxAge(2*60*60); //valid for one day
                emailCookie.setPath("/");
                response.addCookie(emailCookie);

                //create cookie with usertype = employeeType or guest
                String type = service.checkUserType(user);
                Cookie userTypeCookie = new Cookie("userType", type);
                userTypeCookie.setMaxAge(2*60*60); //valid for one day
                userTypeCookie.setPath("/");
                response.addCookie(userTypeCookie);
                destPage = "index.jsp";
            } else {
                String message = "Invalid email/password";
                request.setAttribute("message", message);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

}

