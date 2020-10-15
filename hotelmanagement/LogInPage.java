package hotelmanagement;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
@Path("/user")
public class LogInPage {
    @POST
    @Path("/login")
    public Response registerUser(@FormParam("email") String email,
                                 @FormParam("password") String password){
        Gson gson = new Gson();
        String json;

        LogResponse reg = new LogResponse();

        CustomerService service = new CustomerService();

        if(!(service.mailExists(email))||!(service.mailExists(password))){
            reg.setMessage("Email or password is incorrect");
            json = gson.toJson(reg, RegResponse.class);
            return Response.ok(json).build();
        }
        else reg.setMessage("You have successfully logged in");
        json = gson.toJson(reg, RegResponse.class);
        return Response.ok(json).build();
    }

}

