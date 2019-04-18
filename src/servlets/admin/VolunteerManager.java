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

import models.User;
import models.Volunteers;
import mySql.MySqlConnections;
import services.FileManager;

/**
 * Servlet implementation class NewVolunteer
 */
@WebServlet("/admin/manage-volunteers")
@MultipartConfig
public class VolunteerManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get id of admin user
		User adminUser = (User) request.getSession().getAttribute("adminUser");
		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		// Get all volunteers
		ArrayList<Volunteers> volList = MySqlConnections.getActiveTeamVolunteers(teamId);
		request.setAttribute("volList", volList);
		
		request.getRequestDispatcher("/views/admin/managevolunteers.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get parameters
		String action = request.getParameter("action");

		// Perform volunteer action
		if(action.equals("add")) {	// Add new volunteer
			addVolunteer(request);
		}
		else if(action.equals("update")) {	// Update volunteer info
			updateVolunteer(request);
		}
		else if(action.equals("delete")) { // Delete volunteer
			int id = Integer.parseInt(request.getParameter("vol-id"));
			MySqlConnections.deleteVol(id);
		}
		else {
			System.out.println("Invalid action");
		}
		
		doGet(request, response);
	}

	private void addVolunteer(HttpServletRequest request) {
		// Get volunteer info
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String schoolYear = request.getParameter("school-year");
		String hometown = request.getParameter("hometown");
		String highschool = request.getParameter("highschool");
		String bio = request.getParameter("bio");
		
		// Save File
		String filename = saveFile(request);
		
		// Get id of admin user
		User adminUser = (User) request.getSession().getAttribute("adminUser");
		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		Volunteers vol = new Volunteers(firstName, lastName, teamId, schoolYear, hometown, highschool, bio, filename);
		MySqlConnections.addVolunteer(vol);
//		System.out.println(vol);
	}
	
	private void updateVolunteer(HttpServletRequest request) {
		// Get volunteer info
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String schoolYear = request.getParameter("school-year");
		String hometown = request.getParameter("hometown");
		String highschool = request.getParameter("highschool");
		String bio = request.getParameter("bio");
		int volId = Integer.parseInt(request.getParameter("vol-id"));
		String origFilename = request.getParameter("orig-image-path");
		

		// If new file was uploaded, delete old file and save new one
		String filename = "";
		if(fileUploaded(request)) {
			// Save file
			filename = saveFile(request);
			
			// Delete file if new file was saved successfully
			if(!filename.equals("")) {
				ServletContext sc = getServletContext();
				String dirName = FileManager.getRootDir(sc) + "/" + sc.getInitParameter("volImgDir");
				FileManager.deleteFile(dirName, origFilename);
			}
		}
		else {
			filename = origFilename;
		}
		
		
		// Get id of admin user
		User adminUser = (User) request.getSession().getAttribute("adminUser");
		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		Volunteers vol = new Volunteers(firstName, lastName, teamId, schoolYear, hometown, highschool, bio, filename, volId, "");
		MySqlConnections.updateVol(vol);
	}
	
	private String saveFile(HttpServletRequest request) {
		Part filePart;
		String fileName = "";
		try {
			filePart = request.getPart("image-file");		
			ServletContext context = getServletContext();
			String dirName = FileManager.getRootDir(context) + "/" + context.getInitParameter("volImgDir");
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
			Part filePart = request.getPart("image-file");
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
