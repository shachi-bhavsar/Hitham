package org.hitham.HITHAM.resource;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.hitham.HITHAM.database.Convertor;
import org.hitham.HITHAM.database.DatabaseConnection;
import org.hitham.HITHAM.model.Login;
import org.hitham.HITHAM.service.LoginService;

@Path("validate")
public class LoginResource {

	@POST
	@Path("/admin")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response loginUser(Login login)throws SQLException{
		LoginService loginservice = new LoginService();
		int returnvalue = loginservice.validateLogin(login);
		if(returnvalue == 0){
			//Login successful
			return Response.ok().entity("successAdmin").build();
		}
		else if(returnvalue == 1){
			return Response.ok().entity("successTeacher").build();
		}
		else{
			//DB ERROR
			return Response.ok().entity("failure").build();
		}
	}
	@POST
	@Path("/details")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response displayDetails(Login login) throws Exception
	{
				DatabaseConnection dbconn = new DatabaseConnection();
				if(! dbconn.isStatus()){
					dbconn.closeAll();
					return Response.status(210).entity("DBError").build();
				}
				ResultSet rs;
				String userid = login.getusername();
				String password = login.getpassword();
				String query = "select * from admin where admin_username ='"+userid+"' and admin_password = '"+password+"'";
//				System.out.println(query);
				rs = dbconn.getStmt().executeQuery(query);
				if(rs.next())
				{
					rs.previous();
					String js = Convertor.convertToJSON(rs).toString();
//					System.out.println(js);
					dbconn.closeAll();
					return Response.status(201).entity(js).build();
				}
				else
				{
					String query1 = "select * from teacher where teacher_id ='"+userid+"' and teacher_password = '"+password+"'";
					ResultSet rs1 = dbconn.getStmt().executeQuery(query1);
//					System.out.println(query1);
					String js = (Convertor.convertToJSON(rs1)).toString();
//					System.out.println(js);
					dbconn.closeAll();
					return Response.status(201).entity(js).build();
					
				}
				
	}

}
