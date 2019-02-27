package servlets;

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
@WebServlet("/login")
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
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Views/login.jsp").forward(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Get parameters
		String usernameInput = request.getParameter("username");
		String passwordInput = request.getParameter("password");
				
		User loggedInUser = MySqlConnections.Login(usernameInput, passwordInput);
		
		if(loggedInUser!= null) {
			System.out.println("User is logged in");
			// Store user in session
			request.getSession().setAttribute("user", loggedInUser);
			response.sendRedirect("home");
		}
		else {
			System.out.println("Incorrect credentials");
			request.setAttribute("invalidUserCreds", true);
			request.getRequestDispatcher("Views/login.jsp").forward(request, response);
		}
		
//		doGet(request, response);
	}

}
