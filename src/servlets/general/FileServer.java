package servlets.general;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.FileManager;

/**
 * Servlet implementation class FileServer
 */
@WebServlet("/file-server")
public class FileServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final int BUFFER_SIZE = 1048;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileServer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get filename
		String filename = request.getParameter("filename");
//		String filename = "img308921030689230273.jpg";
		
		// Set response type
		response.setContentType("image/jpeg");
		
		// Output audio file to client
		ServletContext context = getServletContext();
		String dirName = FileManager.getRootDir(context) + "/" + context.getInitParameter("volImgDir");
		FileInputStream inputStream = null;
		OutputStream outStream = null;
		try {
			inputStream = new FileInputStream(dirName + "/" + filename);
	        outStream = response.getOutputStream(); 
	        byte[] buffer = new byte[BUFFER_SIZE];
	        int bytesRead = -1;

	        /**** Write Each Byte Of Data Read From The Input Stream Write Each Byte Of Data  Read From The Input Stream Into The Output Stream ****/
	        while ((bytesRead = inputStream.read(buffer)) != -1) {
	            outStream.write(buffer, 0, bytesRead);    
	        }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(inputStream != null) {
				inputStream.close();
			}
			if(outStream != null) {
				outStream.close();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
