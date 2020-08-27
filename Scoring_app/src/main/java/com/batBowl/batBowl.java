package com.batBowl;

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

public class batBowl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "jdbc:mysql://localhost:3306/userlogin";

		String driver = "com.mysql.jdbc.Driver";

		String username = "root";

		String password = "asdfghjkl0";

		PrintWriter pw = response.getWriter();

		String bname1 = request.getParameter("bname1");

		String bname2 = request.getParameter("bname2");

		String bowler = request.getParameter("bowler");

		HttpSession sec = request.getSession(false);
		String team1 = (String) sec.getAttribute("team1");
		String team2 = (String) sec.getAttribute("team2");
		

		String sql1 = "insert into battingScore(batsman_name,match_id,team_id) values('" + bname1
				+ "',(select match_id from matches where team1_name='" + team1 + "' and team2_name='" + team2
				+ "' order by match_id desc limit 1),(select team_id from players where Player_name = '" + bname1
				+ "'));";

		String sql2 = "insert into battingScore(batsman_name,match_id,team_id) values('" + bname2
				+ "',(select match_id from matches where team1_name='" + team1 + "' and team2_name='" + team2
				+ "' order by match_id desc limit 1),(select team_id from players where Player_name = '" + bname2
				+ "'));";

		String sql3 = "insert into bowlingScore(bowler_name,match_id,team_id) values('" + bowler
				+ "',(select match_id from matches where team1_name='" + team1 + "' and team2_name='" + team2
				+ "' order by match_id desc limit 1),(select team_id from players where Player_name = '" + bowler
				+ "'));";

		Connection con = null;
		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

			PreparedStatement ps1 = con.prepareStatement(sql1);

			PreparedStatement ps2 = con.prepareStatement(sql2);

			PreparedStatement ps3 = con.prepareStatement(sql3);

			int i = ps1.executeUpdate();

			int j = ps2.executeUpdate();

			int k = ps3.executeUpdate();

			String msg = "";
			if (i != 0 && j != 0 && k != 0) {
				msg = "updated";
				pw.println(msg);

			} else {
				msg = "Failed";
				pw.println(msg);

			}
			ps1.close();
			ps2.close();
			ps3.close();

		} catch (Exception e) {

			e.printStackTrace();
		}
		
		
		HttpSession session1 = request.getSession();
		session1.setAttribute("striker",bname1);
		session1.setAttribute("nonstriker", bname2);
		session1.setAttribute("bowler", bowler);
	
		response.sendRedirect("score.jsp");


	}

}
