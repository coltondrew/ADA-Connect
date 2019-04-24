package servlets.general;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.Applications;
import mySql.MySqlConnections;
import services.FileManager;

/**
 * Servlet implementation class TeamLeader
 */
@WebServlet("/team-leader")
@MultipartConfig
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
		request.getRequestDispatcher("/views/general/teamleader.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get parameters
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String email = request.getParameter("email");
		String schoolYear = request.getParameter("school-year");
		String university = request.getParameter("university");
		int universityPopulation = Integer.parseInt(request.getParameter("university-population"));
		boolean teamExists = request.getParameter("team-exists").equals("Yes");
		int numCredits = Integer.parseInt(request.getParameter("num-credits"));
		int adaHours = Integer.parseInt(request.getParameter("ada-hours"));
		boolean otherJob = request.getParameter("job").equals("Yes");
		int otherJobHours = Integer.parseInt(request.getParameter("other-job-hours"));
		boolean newmanMember = request.getParameter("newman").equals("Yes");
		int newmanPopulation = Integer.parseInt(request.getParameter("num-newman"));
		boolean prolifeInvolved = request.getParameter("prolife").equals("Yes");
		int prolifePopulation = Integer.parseInt(request.getParameter("num-prolife"));
		boolean northLocation = request.getParameter("location").equals("north");
		String religion = request.getParameter("religion");
		
		// Save File
		Part filePart = request.getPart("audio-file");
		ServletContext context = getServletContext();
		String dirName = FileManager.getRootDir(context) + "/" + context.getInitParameter("audioAppDir");
		String fileName = FileManager.saveFile(filePart, dirName, FileManager.fileType.AUDIO);
	    
		// Add app to database
		Applications app = new Applications(firstName, lastName, email, schoolYear, university, universityPopulation, teamExists, numCredits, adaHours, otherJob, otherJobHours, newmanMember, newmanPopulation, prolifeInvolved, prolifePopulation, northLocation, religion, fileName);
		System.out.println(app);
		MySqlConnections.submitApplication(app);
		
		
		doGet(request, response);
	}
}
