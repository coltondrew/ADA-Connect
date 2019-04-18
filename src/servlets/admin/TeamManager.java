package servlets.admin;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.Teams;
import models.User;
import mySql.MySqlConnections;
import services.FileManager;
/**
 * Servlet implementation class NewTeam
 */
@WebServlet("/admin/manage-teams")
@MultipartConfig
public class TeamManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeamManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get all teams
		ArrayList<Teams> teamsList = MySqlConnections.getTeams();
		request.setAttribute("teamsList", teamsList);
		
		// Get all team leaders
		ArrayList<User> teamLeaderList = MySqlConnections.getTeamLeaders();
		request.setAttribute("teamLeaderList", teamLeaderList);

		request.getRequestDispatcher("/views/admin/manageteams.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get parameters
		String action = request.getParameter("action");

		// Perform teams action
		if(action.equals("add")) {	// Add new team
			addTeam(request);
		}
		else if(action.equals("update")) {	// Update team
			updateTeam(request);
		}
		else if(action.equals("delete")) { // Delete team
			int id = Integer.parseInt(request.getParameter("team-id"));
			MySqlConnections.deleteTeam(id);
		}
		else {
			System.out.println("Invalid action");
		}
		
		
		// Get parameters
		String teamName = request.getParameter("team-name");
		String teamLeader = request.getParameter("team-leader");
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		
		MySqlConnections.addTeam(teamName, teamLeader, latitude, longitude, "");
//		Teams team = new Teams(teamName, teamLeader, latitude, longitude, "");
//		System.out.println(team);
		
		doGet(request, response);
	}

	private void addTeam(HttpServletRequest request) {
		// Get team info
		String teamName = request.getParameter("team-name");
		String teamLeader = request.getParameter("team-leader");
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		
		// Save File
		String filename = saveFile(request);
		
		// Get id of admin user
//		User adminUser = (User) request.getSession().getAttribute("adminUser");
//		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		// Insert to db
		MySqlConnections.addTeam(teamName, teamLeader, latitude, longitude, filename);
	}
	
	private void updateTeam(HttpServletRequest request) {
		// Get team info
		String teamName = request.getParameter("team-name");
		String teamLeader = request.getParameter("team-leader");
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		int teamId = Integer.parseInt(request.getParameter("team-id"));
		String origFilename = request.getParameter("orig-img");

		// If new file was uploaded, delete old file and save new one
		String filename = "";
		if(fileUploaded(request)) {
			// Save file
			filename = saveFile(request);
			
			// Delete file if new file was saved successfully
			if(!filename.equals("")) {
				ServletContext sc = getServletContext();
				String dirName = FileManager.getRootDir(sc) + "/" + sc.getInitParameter("teamImgDir");
				FileManager.deleteFile(dirName, origFilename);
			}
		}
		else {
			filename = origFilename;
		}
		
		
		// Get id of admin user
//		User adminUser = (User) request.getSession().getAttribute("adminUser");
//		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		MySqlConnections.updateTeam(teamId, teamName, teamLeader, latitude, longitude, filename);
	}
	
	private String saveFile(HttpServletRequest request) {
		Part filePart;
		String fileName = "";
		try {
			filePart = request.getPart("team-img");		
			ServletContext context = getServletContext();
			String dirName = FileManager.getRootDir(context) + "/" + context.getInitParameter("teamImgDir");
			fileName = FileManager.saveFile(filePart, dirName, FileManager.fileType.IMG);
		} 
		catch (IOException e) {
			e.printStackTrace();
		} 
		catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return fileName;
	}
	
	private boolean fileUploaded(HttpServletRequest request) {
		try {
			Part filePart = request.getPart("team-img");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
			if(fileName.equals("")) {
				return false;
			}
			else {
				return true;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}		
	}
}
