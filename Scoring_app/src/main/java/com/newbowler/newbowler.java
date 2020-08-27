package com.newbowler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class newbowler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String url = "jdbc:mysql://localhost:3306/userlogin";

		String driver = "com.mysql.jdbc.Driver";

		String username = "root";

		String password = "asdfghjkl0";

		PrintWriter pw = response.getWriter();

		String newbowler = request.getParameter("newbowler");

		HttpSession sec = request.getSession(false);
		String team1 = (String) sec.getAttribute("team1");
		String team2 = (String) sec.getAttribute("team2");
		String bowler = (String) sec.getAttribute("bowler");
		

		String sql3 = "insert into bowlingScore(bowler_name,match_id,team_id) values('" + newbowler
				+ "',(select match_id from matches where team1_name='" + team1 + "' and team2_name='" + team2
				+ "' order by match_id desc limit 1),(select team_id from players where Player_name = '" + newbowler
				+ "'));";

		Connection con = null;
		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);


			PreparedStatement ps3 = con.prepareStatement(sql3);
			

			int k = ps3.executeUpdate();
         
		
			bowler=newbowler;
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
		
		
		HttpSession session1 = request.getSession();
	
		session1.setAttribute("bowler", bowler);
	
		response.sendRedirect("score.jsp");



		  
	}

}
