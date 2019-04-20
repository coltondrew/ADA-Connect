package servlets.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.User;
import mySql.MySqlConnections;

/**
 * Servlet implementation class GetDistinctYearsWeeks
 */
@WebServlet("/get-distinct-years-weeks")
public class GetDistinctYearsWeeks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDistinctYearsWeeks() {
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
		
		TreeMap<Integer, ArrayList<Integer>> map = new TreeMap<>(MySqlConnections.getDistinctYearsWeeks(teamId));
		Set<Integer> keys = map.keySet();
		for(Integer key: keys) {
			ArrayList<Integer> list = map.get(key);
			Collections.sort(list);
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(map);
		
		// Send response
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
