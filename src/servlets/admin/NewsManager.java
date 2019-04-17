package servlets.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.News;
import mySql.MySqlConnections;

/**
 * Servlet implementation class NewNews
 */
@WebServlet("/admin/manage-news")
public class NewsManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<News> newsList = MySqlConnections.getNewsList();
		request.setAttribute("newsList", newsList);
		
		request.getRequestDispatcher("/views/admin/managenews.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get Parameters
		String newsTitle = request.getParameter("news-title");
		String newsBody = request.getParameter("news-body");
		
		MySqlConnections.addNews(newsTitle, newsBody, "");
		
//		System.out.println(newsTitle  + ", " + newsBody);
		
		doGet(request, response);
	}

}
