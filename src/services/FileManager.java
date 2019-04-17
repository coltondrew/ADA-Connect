package services;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FileManager {
	public static enum fileType {
		IMG, AUDIO
	};
	
	public static String saveFile(Part filePart, String dirName, fileType type) {
	    String targetFileName = "";
		
	    // Get file extension
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    String fileExtension = "." + getFileExtension(fileName);
	    
	    // Set file type
	    String filePrefix = "";
	    if(type == fileType.IMG) {
	    	filePrefix = "img";
	    }
	    else if(type == fileType.AUDIO) {
	    	filePrefix = "aud";
	    }
	    
	    // Save file to system
	    InputStream fileContent = null;
		try {
			// Create temp file
			File dir = new File(dirName);
			File targetFile = File.createTempFile(filePrefix, fileExtension, dir);
			targetFileName = targetFile.getName();
			
			// Overwrite temp file
			fileContent = filePart.getInputStream();
		    Path path = Paths.get(dirName, targetFileName);
			Files.copy(fileContent, path, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
		}
	    
	    return targetFileName;
	}
	
	private static String getFileExtension(String fileName) {
		String fileExtension = "";
		
		String pattern = ".*\\.([a-zA-Z0-9]*$)";
		Pattern r = Pattern.compile(pattern);
		Matcher m = r.matcher(fileName);
		if(m.find()) {
			fileExtension = m.group(1);
		}
				
		return fileExtension;
	}
	
	public static String getRootDir(ServletContext context) {
		String operatingSystem = System.getProperty("os.name");
		String rootDir;
		
		if(operatingSystem.equals("Linux")) {
			rootDir = context.getInitParameter("linuxRoot");
		}
		else {
			rootDir = context.getInitParameter("windowsRoot");
		}
		
		return rootDir;
	}
	
	public static boolean deleteFile(String dirName, String filename) {
		File file = new File(dirName, filename); 
        
        if(file.delete()) 
        { 
            System.out.println("File deleted successfully"); 
            return true;
        } 
        else
        { 
            System.out.println("Failed to delete the file");
            return false;
        } 
	}
}
