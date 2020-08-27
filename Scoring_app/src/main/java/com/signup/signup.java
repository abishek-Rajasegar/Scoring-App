package com.signup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String url = "jdbc:mysql://localhost:3306/userlogin";
		String driver = "com.mysql.jdbc.Driver";
		String username = "root";
		String password = "asdfghjkl0";
		Connection con = null;

		String email = request.getParameter("email");
		String pword = request.getParameter("password");
		String sql = "insert into login values(?,?);";

		try {

			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

			PreparedStatement pst = (PreparedStatement) con.prepareStatement(sql);

			pst.setString(1, email);
			pst.setString(2, pword);

			int i = pst.executeUpdate();

			String msg = " ";
			if (i != 0) {
				msg = "inserted scuuesfully";
				pw.println(msg);
			} else {
				msg = " Not inserted scuuesfully";
				pw.println(msg);

			}
			pst.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		response.sendRedirect("index.jsp");

	}

}
