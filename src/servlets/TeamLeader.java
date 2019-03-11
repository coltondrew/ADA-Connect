package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TeamLeader
 */
@WebServlet("/team-leader")
public class TeamLeader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeamLeader() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/teamleader.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String email = request.getParameter("email");
		String schoolYear = request.getParameter("school-year");
		String university = request.getParameter("university");
		String universityPopulation = request.getParameter("university-population");
		String teamExists = request.getParameter("team-exists-radio");
		String numCredits = request.getParameter("num-credits");
		String adaHours = request.getParameter("ada-hours");
		String otherJob = request.getParameter("job-radio");
		String otherJobHours = request.getParameter("other-job-hours");
		String newmanMember = request.getParameter("newman-radio");
		String newmanPopulation = request.getParameter("num-newman");
		String prolifeInvolved = request.getParameter("prolife-radio");
		String location = request.getParameter("location-radio");
		String religion = request.getParameter("religion-radio");
		
		System.out.printf("%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s\n", firstName, lastName, email, schoolYear, 
				university, universityPopulation, teamExists, numCredits, adaHours, otherJob, otherJobHours, newmanMember, 
				newmanPopulation, prolifeInvolved, location, religion);
		
		doGet(request, response);
	}

}
