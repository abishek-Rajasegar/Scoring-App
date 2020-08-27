package com.boresult;

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

public class boresult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String url = "jdbc:mysql://localhost:3306/userlogin";
		String driver = "com.mysql.jdbc.Driver";
		String username = "root";
		String password = "asdfghjkl0";

		HttpSession sec = request.getSession(false);
		String team1 = (String) sec.getAttribute("team1");
		String team2 = (String) sec.getAttribute("team2");
		String wonby = (String) sec.getAttribute("wonby");
		String win = (String) sec.getAttribute("result");
		int target=0,wickets=0,balls=0;
		try {
		 target = (int) sec.getAttribute("total_runs");
		 wickets = (int) sec.getAttribute("wickets");
		 balls = (int) sec.getAttribute("total_balls");
		}
		catch (Exception e) {
			
			e.printStackTrace();
		}
		String sql = null;
		try {
			if (wonby.equals(team1)) {
				sql = "update  matches set match_result='" + win + "', Team1_runs=" + target + ",team1_overs=" + balls
						+ ",team1_wickets=" + wickets + " where Team1_name='" + team1 + "' and Team2_name='" + team2
						+ "' order by match_id desc limit 1; \r\n" + "";
			}
			else
			{
				sql = "update  matches set match_result='" + win + "', team2_runs=" + target + ",team2_overs=" + balls
						+ ",team2_wickets=" + wickets + " where Team1_name='" + team1 + "' and Team2_name='" + team2
						+ "' order by match_id desc limit 1; \r\n" + "";
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		Connection con = null;

		try {

			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

			PreparedStatement pst = (PreparedStatement) con.prepareStatement(sql);

			int i = pst.executeUpdate();

			String msg = " ";
			if (i != 0) {
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
		session.setAttribute("target", target);

		response.sendRedirect("home.jsp");

	}

}
