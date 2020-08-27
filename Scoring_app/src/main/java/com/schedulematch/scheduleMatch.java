package com.schedulematch;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class scheduleMatch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String url = "jdbc:mysql://localhost:3306/userlogin";

		String driver = "com.mysql.jdbc.Driver";

		String username = "root";

		String password = "asdfghjkl0";

		PrintWriter pw = response.getWriter();

		String team1 = request.getParameter("team1");

		String team2 = request.getParameter("team2");
		
		String date = request.getParameter("date");
 
		String venue = request.getParameter("venue");
		
		String overs = request.getParameter("overs");

		String sql3 = "insert into upcoming_matches(team1_name,team2_name,match_date,overs,venue) values(?,?,?,?,?);";

		Connection con = null;
		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);


			PreparedStatement ps3 = con.prepareStatement(sql3);
			
			ps3.setString(1, team1);
			ps3.setString(2, team2);
			ps3.setString(3,  date.toString());
			ps3.setString(4, overs);
			ps3.setString(5, venue);
			

			int k = ps3.executeUpdate();
         
		
	
			String msg = "";
			if ( k != 0) {
				msg = "updated";
				pw.println(msg);

			} else {
				msg = "Failed";
				pw.println(msg);

			}
			ps3.close();

		} catch (Exception e) {

			e.printStackTrace();
		}
		
		
	
	
		response.sendRedirect("home.jsp");



		
		
	}

}
