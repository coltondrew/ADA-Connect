package servlets.team;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mySql.MySqlConnections;
import models.News;
import models.Teams;

/**
 * Servlet implementation class News
 */
@WebServlet(name = "TeamNews", urlPatterns = { "/team/news" })
public class TeamNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeamNews() {
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
		
        
        News newsItem = null;
        ArrayList<News> newsList = null;
		if(request.getParameterMap().containsKey("id")) {
			int newsId = Integer.parseInt(request.getParameter("id"));
			newsItem = MySqlConnections.getFullNews(newsId);
			newsList = MySqlConnections.getNewsListExcludeId(teamId, newsId);
		}
		else {
			newsItem = MySqlConnections.getMostRecentNews(teamId);
			int newsId = newsItem.getNewsID();
			newsList = MySqlConnections.getNewsListExcludeId(teamId, newsId);
		}
        
		request.setAttribute("mainNews", newsItem);
		request.setAttribute("newsList", newsList);
		request.getRequestDispatcher("/views/team/news.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
