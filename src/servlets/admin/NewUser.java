package servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mySql.MySqlConnections;

/**
 * Servlet implementation class NewUser
 */
@WebServlet("/admin/new-user")
public class NewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin/newuser.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get parameters
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String role = request.getParameter("role");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// Add user to DB
		boolean success = MySqlConnections.AddUser(username, password, firstName, lastName, role);
		if(success) {
			System.out.println("User successfully added");
		}
		else {
			System.out.println("Error adding user");
		}
		
//			System.out.printf("%s %s %s %s %s\n", firstName, lastName, role, username, password);
		
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);		
	}

}
