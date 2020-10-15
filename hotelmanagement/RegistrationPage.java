package hotelmanagement;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;

@Path("/user")
    public class RegistrationPage {

    @POST
    @Path("/register")
    public Response registerUser(@FormParam("firstname") String firstname,
                                 @FormParam("lastname") String lastname,
                                 @FormParam("email") String email,
                                 @FormParam("password") String password,
                                 @FormParam("reppassword") String reppassword){
        Gson gson = new Gson();
        String json;

        RegResponse reg = new RegResponse();

        if(!password.equals(reppassword)){
            reg.setMessage("Passwords do not match");
            json = gson.toJson(reg, RegResponse.class);
            return Response.ok(json).build();
        }

        CustomerService service = new CustomerService();

        if(service.mailExists(email)){
            reg.setMessage("Mail already exists");
            json = gson.toJson(reg, RegResponse.class);
            return Response.ok(json).build();
        }

        service.createAccount(email, firstname, lastname, password);
        reg.setMessage("Welcome! You have successfully registered!");

        json = gson.toJson(reg, RegResponse.class);
        return Response.ok(json).build();
    }
}
