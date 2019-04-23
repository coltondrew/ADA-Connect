package servlets.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Stats;
import models.User;
import mySql.MySqlConnections;

/**
 * Servlet implementation class ConversationTracker
 */
@WebServlet("/admin/conversation-tracker")
public class ConversationTracker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConversationTracker() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get id of admin user
		int teamId = -1;
		int counter = 5;
		while(teamId == -1 && counter > 0) {
			User adminUser = (User) request.getSession().getAttribute("adminUser");
			teamId = MySqlConnections.getTeamID(adminUser.getUsername());
			counter--;
		}
		
		ArrayList<Stats> stats = MySqlConnections.getMostRecentStats(teamId);
		request.setAttribute("statsList", stats);
		System.out.println(stats);
		
		// Get all active volunteers
//		ArrayList<Volunteers> volList = MySqlConnections.getActiveTeamVolunteers(teamId);
//		request.setAttribute("volList", volList);
		
		request.getRequestDispatcher("/views/admin/conversationtracker.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get parameters
		String action = request.getParameter("action");

		// Perform news action
		if(action.equals("add")) {	// Add new stats
			System.out.println("ADD");
			addStats(request);
		}
		else if(action.equals("update")) {	// Update stats
			System.out.println("UPDATE");
			updateStats(request);
		}
		else if(action.equals("delete")) { // Delete stats
			System.out.println("DELETE");
			deleteStats(request);
		}
		else {
			System.out.println("Invalid action");
		}
		
		doGet(request, response);
	}
	
	private void addStats(HttpServletRequest request) {
		// Get parameters
		int week = Integer.parseInt(request.getParameter("week"));
		int year = Integer.parseInt(request.getParameter("year"));
		System.out.println(week);
		System.out.println(year);
		
		// Iterate through rows of data
		for(String id : request.getParameterValues("id")) {
			int conversations = Integer.parseInt(request.getParameter("conversations-" + id));
			int conversions = Integer.parseInt(request.getParameter("conversions-" + id));
			MySqlConnections.addStat(Integer.parseInt(id), conversations, conversions, year, week);
			System.out.printf("%s, %d, %d\n", id, conversations, conversions);
		}
	}
	
	private void updateStats(HttpServletRequest request) {
		// Get parameters
		int week = Integer.parseInt(request.getParameter("week"));
		int year = Integer.parseInt(request.getParameter("year"));
		System.out.println(week);
		System.out.println(year);
		
		// Iterate through rows of data
		for(String id : request.getParameterValues("id")) {
			int conversations = Integer.parseInt(request.getParameter("conversations-" + id));
			int conversions = Integer.parseInt(request.getParameter("conversions-" + id));
			MySqlConnections.updateStat(Integer.parseInt(id), conversations, conversions, year, week);
			System.out.printf("%s, %d, %d\n", id, conversations, conversions);
		}
	}
	
	private void deleteStats(HttpServletRequest request) {
		// Get parameters
		int week = Integer.parseInt(request.getParameter("week"));
		int year = Integer.parseInt(request.getParameter("year"));
		System.out.println(week);
		System.out.println(year);
		
		// Iterate through rows of data
		for(String id : request.getParameterValues("id")) {
			int conversations = Integer.parseInt(request.getParameter("conversations-" + id));
			int conversions = Integer.parseInt(request.getParameter("conversions-" + id));
			MySqlConnections.deleteStat(Integer.parseInt(id), year, week);
			System.out.printf("%s, %d, %d\n", id, conversations, conversions);
		}
	}
}
