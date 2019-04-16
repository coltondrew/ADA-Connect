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
		User adminUser = (User) request.getSession().getAttribute("adminUser");
		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		// Get all active volunteers
		ArrayList<Volunteers> volList = MySqlConnections.getActiveTeamVolunteers(teamId);
		request.setAttribute("volList", volList);
		
		request.getRequestDispatcher("/views/admin/conversationtracker.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		doGet(request, response);
	}

}
