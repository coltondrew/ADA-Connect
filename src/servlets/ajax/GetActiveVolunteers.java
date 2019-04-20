package servlets.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.User;
import models.Volunteers;
import mySql.MySqlConnections;

/**
 * Servlet implementation class GetActiveVolunteers
 */
@WebServlet("/get-active-vols")
public class GetActiveVolunteers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetActiveVolunteers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get id of admin user
		User adminUser = (User) request.getSession().getAttribute("adminUser");
		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		ArrayList<Volunteers> volsList = MySqlConnections.getActiveTeamVolunteers(teamId);
		
		Gson gson = new Gson();
		String json = gson.toJson(volsList);
		
		// Send response
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
