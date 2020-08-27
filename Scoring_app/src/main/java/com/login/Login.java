package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;


public class Login extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uname =  request.getParameter("uname");
		String pass =  request.getParameter("password");
		
		LoginDao dao = new LoginDao();
		
		
		if(dao.check(uname,pass))
		{
			
			HttpSession session = request.getSession();
			session.setAttribute("username", uname);
			response.sendRedirect("home.jsp");
		}
		else
		{
			response.sendRedirect("index.jsp");		
		}
	}
 
		}

