package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.Applications;
import mySql.MySqlConnections;

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
		request.getRequestDispatcher("/views/teamleader.jsp").forward(request, response);
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
		boolean teamExists = request.getParameter("team-exists-radio").equals("yes");
		int numCredits = Integer.parseInt(request.getParameter("num-credits"));
		int adaHours = Integer.parseInt(request.getParameter("ada-hours"));
		boolean otherJob = request.getParameter("job-radio").equals("yes");
		int otherJobHours = Integer.parseInt(request.getParameter("other-job-hours"));
		boolean newmanMember = request.getParameter("newman-radio").equals("yes");
		int newmanPopulation = Integer.parseInt(request.getParameter("num-newman"));
		boolean prolifeInvolved = request.getParameter("prolife-radio").equals("yes");
		int prolifePopulation = Integer.parseInt(request.getParameter("num-prolife"));
		boolean northLocation = request.getParameter("location-radio").equals("north");
		String religion = request.getParameter("religion-radio");
		
		// Handle File
		Part filePart = request.getPart("audio-file"); // Retrieves <input type="file" name="file">
//		String fileName = getSubmittedFileName(filePart);
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//	    System.out.println(fileName);
	    InputStream fileContent = filePart.getInputStream();
	    Path path = Paths.get("C:/apps/ada", fileName);
	    Files.deleteIfExists(path);
	    Files.copy(fileContent, path, StandardCopyOption.REPLACE_EXISTING);
	    
		Applications app = new Applications(firstName, lastName, email, schoolYear, university, universityPopulation, teamExists, numCredits, adaHours, otherJob, otherJobHours, newmanMember, newmanPopulation, prolifeInvolved, prolifePopulation, northLocation, religion, fileName);
		System.out.println(app);
		//		MySqlConnections.submitApplication(app);
		
//		Applications app = new Applications(firstName, lastName, email, schoolYear, university,);
		
//		System.out.printf("%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s\n", firstName, lastName, email, schoolYear, 
//				university, universityPopulation, teamExists, numCredits, adaHours, otherJob, otherJobHours, newmanMember, 
//				newmanPopulation, prolifeInvolved, northLocation, religion);
		
		doGet(request, response);
	}
	
//	private static String getSubmittedFileName(Part part) {
//		for (String cd : part.getHeader("content-disposition").split(";")) {
//	        if (cd.trim().startsWith("filename")) {
//	            String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
//	            return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
//	        }
//	    }
//	    return null;
//	}

}
