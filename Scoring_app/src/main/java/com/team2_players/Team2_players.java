package com.team2_players;

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


public class Team2_players extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String url = "jdbc:mysql://localhost:3306/userlogin";

		String driver = "com.mysql.jdbc.Driver";

		String username = "root";

		String password = "asdfghjkl0";

		Connection con = null;

		PrintWriter pw = response.getWriter();

		String team_name = request.getParameter("team_name");
		String player1 = request.getParameter("player1");
		String player2 = request.getParameter("player2");
		String player3 = request.getParameter("player3");
		String player4 = request.getParameter("player4");
		String player5 = request.getParameter("player5");
		String player6 = request.getParameter("player6");
		String player7 = request.getParameter("player7");
		String player8 = request.getParameter("player8");
		String player9 = request.getParameter("player9");
		String player10 = request.getParameter("player10");
		String player11 = request.getParameter("player11");

		String sql1 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player1+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player1+"') LIMIT 1;";
		String sql2 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player2+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player2+"') LIMIT 1;";
		String sql3 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player3+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player3+"') LIMIT 1;";
		String sql4 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player4+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player4+"') LIMIT 1;";
		String sql5 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player5+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player5+"') LIMIT 1;";
		String sql6 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player6+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player6+"') LIMIT 1;";
		String sql7 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player7+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player7+"') LIMIT 1;";
		String sql8 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player8+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player8+"') LIMIT 1;";
		String sql9 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player9+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player9+"') LIMIT 1;";
		String sql10 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player10+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player10+"') LIMIT 1;";
		String sql11 = "INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT '"+player11+"', team_id from teams where team_name= '"+team_name+"') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = '"+player11+"') LIMIT 1;";
		

		try {

			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

			PreparedStatement pst1 = (PreparedStatement) con.prepareStatement(sql1);
			PreparedStatement pst2 = (PreparedStatement) con.prepareStatement(sql2);
			PreparedStatement pst3 = (PreparedStatement) con.prepareStatement(sql3);
			PreparedStatement pst4 = (PreparedStatement) con.prepareStatement(sql4);
			PreparedStatement pst5 = (PreparedStatement) con.prepareStatement(sql5);
			PreparedStatement pst6 = (PreparedStatement) con.prepareStatement(sql6);
			PreparedStatement pst7 = (PreparedStatement) con.prepareStatement(sql7);
			PreparedStatement pst8 = (PreparedStatement) con.prepareStatement(sql8);
			PreparedStatement pst9 = (PreparedStatement) con.prepareStatement(sql9);
			PreparedStatement pst10 = (PreparedStatement) con.prepareStatement(sql10);
			PreparedStatement pst11 = (PreparedStatement) con.prepareStatement(sql11);

			
			
			
			int i = pst1.executeUpdate();
			 pst2.executeUpdate();
			 pst3.executeUpdate();
			 pst4.executeUpdate();
			 pst5.executeUpdate();
			 pst6.executeUpdate();
			 pst7.executeUpdate();
			 pst8.executeUpdate();
			 pst9.executeUpdate();
			 pst10.executeUpdate();
			 pst11.executeUpdate();
			 
			
			//con.commit();
			
			String msg = "";
			if (i != 0) {
				msg = "inserted scuuesfully";
				pw.println(msg);

			} else {
				msg = "not inserted";
				pw.println(msg);

			}
			pst1.close();
			pst2.close();
			pst3.close();
			pst4.close();
			pst5.close();
			pst6.close();
			pst7.close();
			pst8.close();
			pst9.close();
			pst10.close();
			pst11.close();
			

		} catch (Exception e) {

			e.printStackTrace();
		}

		HttpSession session1 = request.getSession();
		session1.setAttribute("captain_2",player1 );
		session1.setAttribute("team_name_2",team_name);	
		response.sendRedirect("toss.jsp");
	
	
	}

}
