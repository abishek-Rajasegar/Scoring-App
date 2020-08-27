package com.Toss;

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

public class Toss extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "jdbc:mysql://localhost:3306/userlogin";

		String driver = "com.mysql.jdbc.Driver";

		String username = "root";

		String password = "asdfghjkl0";

		PrintWriter pw = response.getWriter();

		Connection con = null;

		String wonby = request.getParameter("wonby");
		String optedto = request.getParameter("optedto");

		HttpSession sec = request.getSession(false);
		String team1 = (String) sec.getAttribute("team1");
		String team2 = (String) sec.getAttribute("team2");

		String sql = "insert into toss(team_name,elected_to,team_id,match_id) values(?,?,(select team_id from teams where team_name=?),(select match_id from matches where Team1_name= ? and Team2_name= ? order by match_id desc limit 1))";

		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

			PreparedStatement stm = con.prepareStatement(sql);

			stm.setString(1, wonby);
			stm.setString(2, optedto);
			stm.setString(3, wonby);
			stm.setString(4, team1);
			stm.setString(5, team2);

			int i = stm.executeUpdate();
			//con.commit();
			String msg = "";
			if (i != 0) {
				msg = "updated";
				pw.println(msg);

			} else {
				msg = "Failed";
				pw.println(msg);

			}
			stm.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		HttpSession session1 = request.getSession();
		session1.setAttribute("wonby", wonby);
		session1.setAttribute("wonby1", wonby);
		session1.setAttribute("optedto", optedto);
		session1.setAttribute("team1", team1);
		session1.setAttribute("team2", team2);
		response.sendRedirect("batbowl.jsp");

	}

}
