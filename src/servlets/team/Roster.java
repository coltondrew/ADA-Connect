package servlets.team;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Teams;
import models.Volunteers;
import mySql.MySqlConnections;

/**
 * Servlet implementation class Roster
 */
@WebServlet("/team/roster")
public class Roster extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Roster() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get team id
		HttpSession session = request.getSession(false);
		Teams team = (Teams) session.getAttribute("teamObj");
        int teamId = team.getID();
		
        // Get volunteers for team
        ArrayList<Volunteers> volList = MySqlConnections.getActiveTeamVolunteers(teamId);
        request.setAttribute("volList", volList);
        
		request.getRequestDispatcher("/views/team/roster.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
