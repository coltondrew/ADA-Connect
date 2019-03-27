package servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mySql.MySqlConnections;
import models.Applications;

/**
 * Servlet implementation class ApplicationByID
 */
@WebServlet("/admin/application")
public class ApplicationByID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplicationByID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Applications app = MySqlConnections.getFullApplication(id);
		request.setAttribute("app", app);
//		System.out.println(app);
		request.getRequestDispatcher("/views/admin/applicationbyid.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String decision = request.getParameter("decision");
		int id = Integer.parseInt(request.getParameter("appID"));
		if(decision.equals("Accept")) {
			MySqlConnections.reviewApplication(id, true);
			response.sendRedirect(request.getContextPath() + "/admin/new-user?id=" + id);
			System.out.println("Accept Button Pressed");
		}
		else if(decision.equals("Decline")) {
			MySqlConnections.reviewApplication(id, false);
			System.out.println("Decline button pressed");
			response.sendRedirect(request.getContextPath() + "/admin/view-applications");
		}
		else {
			response.sendRedirect(request.getContextPath() + "/admin/view-applications");
		}
	}

}
