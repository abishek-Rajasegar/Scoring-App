package com.enterTeam;

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

public class enterTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String team1 = request.getParameter("team1");
		String team2 = request.getParameter("team2");

		String sql1 = "INSERT INTO teams(team_Name) SELECT * FROM (SELECT '" + team1
				+ "' from teams) AS tmp WHERE NOT EXISTS (SELECT team_Name FROM teams WHERE team_Name = '" + team1
				+ "') LIMIT 1; ";

		String sql2 = "INSERT INTO teams(team_Name) SELECT * FROM (SELECT '" + team2
				+ "' from teams) AS tmp WHERE NOT EXISTS (SELECT team_Name FROM teams WHERE team_Name = '" + team2
				+ "') LIMIT 1;";

		String url = "jdbc:mysql://localhost:3306/userlogin";
		String driver = "com.mysql.jdbc.Driver";
		String username = "root";
		String password = "asdfghjkl0";
		Connection con = null;

		try {

			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

			PreparedStatement pst = (PreparedStatement) con.prepareStatement(sql1);
			PreparedStatement p1 = (PreparedStatement) con.prepareStatement(sql2);

			int j = p1.executeUpdate();

			int i = pst.executeUpdate();
			// con.commit();
			String msg = " ";
			if (i != 0 && j != 0) {
				msg = "inserted scuuesfully";
				pw.println(msg);
			} else {
				msg = "inserted scuuesfully";
				pw.println(msg);

			}
			pst.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		session.setAttribute("team1", team1);
		session.setAttribute("team2", team2);
		response.sendRedirect("newmatch.jsp");
		// doGet(request, response);
	}

}
