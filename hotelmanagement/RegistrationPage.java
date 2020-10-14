package hotelmanagement;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;

@Path("/user")
    public class RegistrationPage {

    public RegistrationPage(){

    }

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

        json = gson.toJson(reg, RegResponse.class);
        return Response.ok(json).build();
    }
}
