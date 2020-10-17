package hotelmanagement;

import javax.servlet.Servlet;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import javax.servlet.http.*;

import com.google.gson.Gson;

@Path("/user")
public class LogInPage extends HttpServlet {

    @POST
    @Path("/login")
    public Response registerUser(@FormParam("email") String email,
                                 @FormParam("password") String password){
        Gson gson = new Gson();
        String json;

        MyResponse reg = new MyResponse();

        CustomerService service = new CustomerService();

        if(!(service.mailExists(email)) || !(service.passMatch(email, password))){
            reg.setMessage("Email or password is incorrect");
            json = gson.toJson(reg, MyResponse.class);
            return Response.ok(json).build();
        }

        reg.setMessage("You have successfully logged in");
        json = gson.toJson(reg, MyResponse.class);
        return Response.ok(json).build();
    }

}

