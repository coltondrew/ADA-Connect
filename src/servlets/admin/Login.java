package servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mySql.MySqlConnections;
import models.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/admin/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get parameters
		String username = request.getParameter("username");
		String password = request.getParameter("password");
				
		User loggedInUser = MySqlConnections.Login(username, password);
		
		if(loggedInUser!= null) {
			System.out.println("User is logged in");
			// Store user in session
			request.getSession().setAttribute("adminUser", loggedInUser);
			response.sendRedirect(request.getContextPath() + "/admin");
		}
		else {
			System.out.println("Incorrect credentials");
			request.setAttribute("invalidUserCreds", true);
			request.getRequestDispatcher("/views/admin/login.jsp").forward(request, response);
		}		
	}

}
