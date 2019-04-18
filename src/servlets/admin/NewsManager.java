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

import models.News;
import models.User;
import mySql.MySqlConnections;
import services.FileManager;

/**
 * Servlet implementation class NewNews
 */
@WebServlet("/admin/manage-news")
@MultipartConfig
public class NewsManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<News> newsList = MySqlConnections.getNewsList();
		request.setAttribute("newsList", newsList);
		
		request.getRequestDispatcher("/views/admin/managenews.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get parameters
		String action = request.getParameter("action");

		// Perform news action
		if(action.equals("add")) {	// Add new news
			addNews(request);
		}
		else if(action.equals("update")) {	// Update news info
			updateNews(request);
		}
		else if(action.equals("delete")) { // Delete news item
			int id = Integer.parseInt(request.getParameter("news-id"));
			MySqlConnections.deleteNews(id);
		}
		else {
			System.out.println("Invalid action");
		}
			
		doGet(request, response);
	}
	
	private void addNews(HttpServletRequest request) {
		// Get news info
		String newsTitle = request.getParameter("news-title");
		String newsBody = request.getParameter("news-body");
		
		// Save File
		String filename = saveFile(request);
		
		// Get id of admin user
		User adminUser = (User) request.getSession().getAttribute("adminUser");
		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		// Insert to db
		MySqlConnections.addNews(newsTitle, newsBody, filename, teamId);
	}
	
	private void updateNews(HttpServletRequest request) {
		// Get news info
		String newsTitle = request.getParameter("news-title");
		String newsBody = request.getParameter("news-body");
		int newsId = Integer.parseInt(request.getParameter("news-id"));
		String origFilename = request.getParameter("orig-img");
		

		// If new file was uploaded, delete old file and save new one
		String filename = "";
		if(fileUploaded(request)) {
			// Save file
			filename = saveFile(request);
			
			// Delete file if new file was saved successfully
			if(!filename.equals("")) {
				ServletContext sc = getServletContext();
				String dirName = FileManager.getRootDir(sc) + "/" + sc.getInitParameter("newsImgDir");
				FileManager.deleteFile(dirName, origFilename);
			}
		}
		else {
			filename = origFilename;
		}
		
		
		// Get id of admin user
//		User adminUser = (User) request.getSession().getAttribute("adminUser");
//		int teamId = MySqlConnections.getTeamID(adminUser.getUsername());
		
		MySqlConnections.updateNews(newsId, newsTitle, newsBody, filename);
	}
	
	private String saveFile(HttpServletRequest request) {
		Part filePart;
		String fileName = "";
		try {
			filePart = request.getPart("news-img");		
			ServletContext context = getServletContext();
			String dirName = FileManager.getRootDir(context) + "/" + context.getInitParameter("newsImgDir");
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
			Part filePart = request.getPart("news-img");
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
