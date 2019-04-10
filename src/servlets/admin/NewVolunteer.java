package servlets.admin;

import java.io.IOException;
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
@WebServlet("/admin/new-volunteer")
public class NewVolunteer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewVolunteer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin/newvolunteer.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get parameters
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String schoolYear = request.getParameter("school-year");
		String hometown = request.getParameter("hometown");
		String highschool = request.getParameter("highschool");
		String bio = request.getParameter("bio");
		
		Volunteers vol = new Volunteers(firstName, lastName, MySqlConnections.getTeamID(((User)request.getSession().getAttribute("adminUser")).getUsername()), schoolYear, hometown, highschool, bio, "");
		MySqlConnections.addVolunteer(vol);
		System.out.println(vol);
		
		doGet(request, response);
	}

}
