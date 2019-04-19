package servlets.team;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.News;
import models.Teams;
import mySql.MySqlConnections;

/**
 * Servlet implementation class Home
 */
@WebServlet(name = "TeamHome", urlPatterns = { "/team/home", "/team" })
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if username parameter exists
        if(request.getParameterMap().containsKey("id")) {
        	int teamId = Integer.parseInt(request.getParameter("id"));
        	Teams team = MySqlConnections.getTeam(teamId);
        	request.getSession().setAttribute("teamObj", team);        	
        	
        	int totalConversations = MySqlConnections.getTotalConversations(teamId);
        	ArrayList<News> newsList = MySqlConnections.getNewsList(teamId);

        	request.setAttribute("totalConversations", totalConversations);
        	request.setAttribute("newsList", newsList);

    		request.getRequestDispatcher("/views/team/home.jsp").forward(request, response);
        }
        else if(request.getSession().getAttribute("teamObj") != null) {
        	Teams team = (Teams) request.getSession().getAttribute("teamObj");
        	int teamId = team.getID();
        	
        	int totalConversations = MySqlConnections.getTotalConversations(teamId);
        	ArrayList<News> newsList = MySqlConnections.getNewsList(teamId);

        	request.setAttribute("totalConversations", totalConversations);
        	request.setAttribute("newsList", newsList);

    		request.getRequestDispatcher("/views/team/home.jsp").forward(request, response);	
        }
        else {
    		request.getRequestDispatcher("/views/general/home.jsp").forward(request, response);	
        }
        
        
  	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
