package com.newbatsman;

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


public class newBatsman extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String url = "jdbc:mysql://localhost:3306/userlogin";

		String driver = "com.mysql.jdbc.Driver";

		String username = "root";

		String password = "asdfghjkl0";

		PrintWriter pw = response.getWriter();

		String bname1 = request.getParameter("newbatsman");


		HttpSession sec = request.getSession(false);
		String team1 = (String) sec.getAttribute("team1");
		String team2 = (String) sec.getAttribute("team2");
		
		String outbatsman = (String) sec.getAttribute("outbatsman");
		
		String striker = (String) sec.getAttribute("striker");
		String nonstriker = (String) sec.getAttribute("nonstriker");

		String sql1 = "insert into battingScore(batsman_name,match_id,team_id) values('" + bname1
				+ "',(select match_id from matches where team1_name='" + team1 + "' and team2_name='" + team2
				+ "' order by match_id desc limit 1),(select team_id from players where Player_name = '" + bname1
				+ "'));";

		int s=0,ns=0;
		Connection con = null;
		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

			PreparedStatement ps1 = con.prepareStatement(sql1);

		
			int i = ps1.executeUpdate();

            if(outbatsman.equals(striker))
			 {
            	 s=1;
            	striker = bname1;
            }
            else if(outbatsman.equals(nonstriker)){
            	 ns=1;
            	nonstriker = bname1; 
            }
			String msg = "";
			if (i != 0) {
				msg = "updated";
				pw.println(msg);

			} else {
				msg = "Failed";
				pw.println(msg);

			}
			ps1.close();
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		
		HttpSession session1 = request.getSession();
		if(s==1) {session1.setAttribute("striker", striker);}
		else if(ns==1) {session1.setAttribute("nonstriker", nonstriker);}
		response.sendRedirect("score.jsp");

		
	}

}
