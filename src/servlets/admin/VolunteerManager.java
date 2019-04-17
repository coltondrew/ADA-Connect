package servlets.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import models.Volunteers;
import mySql.MySqlConnections;

/**
 * Servlet implementation class NewVolunteer
 */
@WebServlet("/admin/manage-volunteers")
public class VolunteerManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerManager() {
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
		
		// Get all volunteers
		ArrayList<Volunteers> volList = MySqlConnections.getActiveTeamVolunteers(teamId);
		request.setAttribute("volList", volList);
		
		request.getRequestDispatcher("/views/admin/managevolunteers.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get parameters
		String action = request.getParameter("action");
		
		// Add new volunteer
		if(action.equals("add")) {	// Add new volunteer
			addVolunteer(request);
		}
		else if(action.equals("update")) {	// Update volunteer info
			updateVolunteer(request);
		}
		else if(action.equals("delete")) { // Delete volunteer
			int id = Integer.parseInt(request.getParameter("vol-id"));
			MySqlConnections.deleteVol(id);
		}
		else {
			System.out.println("Invalid action");
		}
		
		doGet(request, response);
	}

	private static void addVolunteer(HttpServletRequest request) {
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String schoolYear = request.getParameter("school-year");
		String hometown = request.getParameter("hometown");
		String highschool = request.getParameter("highschool");
		String bio = request.getParameter("bio");
		
		// Get id of admin user
		User adminUser = (User) request.getSession().getAttribute("adminUser");
		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		Volunteers vol = new Volunteers(firstName, lastName, teamId, schoolYear, hometown, highschool, bio, "");
		MySqlConnections.addVolunteer(vol);
//		System.out.println(vol);
	}
	
	private static void updateVolunteer(HttpServletRequest request) {
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String schoolYear = request.getParameter("school-year");
		String hometown = request.getParameter("hometown");
		String highschool = request.getParameter("highschool");
		String bio = request.getParameter("bio");
		int volId = Integer.parseInt(request.getParameter("vol-id"));
		
		// Get id of admin user
		User adminUser = (User) request.getSession().getAttribute("adminUser");
		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		Volunteers vol = new Volunteers(firstName, lastName, teamId, schoolYear, hometown, highschool, bio, "", volId, "");
		MySqlConnections.updateVol(vol);
	}
}
