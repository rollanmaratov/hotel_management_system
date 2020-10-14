package hotelmanagement;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;

@Path("/items")
    public class MainPage {

    public MainPage(){

    }

    @POST
    public Response loginPage(){
        Gson gson = new Gson();
        String json;


        json = gson.toJson(p, );
        return Response.ok(json).build();
    }
}
