package com.newMatch;

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




public class newMatch extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
 
    

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			response.setContentType("text/html");  
	        PrintWriter pw = response.getWriter();
			
			
			String sql = "insert into matches(Match_date,Venue,Overs,Team1_name,Team2_name) values(NOW(),?,?,?,?);";
			String url = "jdbc:mysql://localhost:3306/userlogin";
			String driver="com.mysql.jdbc.Driver";
			String username="root";
			String password="asdfghjkl0";
			Connection con = null;
			
			
			
			
			String venue = request.getParameter("venue");
			String overs = request.getParameter("overs");
			
			
			
			HttpSession session=request.getSession(false); 
			String tname1 = (String) session.getAttribute("team1");
			String tname2 = (String) session.getAttribute("team2");
			 
			try {
				
				Class.forName(driver);
				
				con = DriverManager.getConnection(url,username,password);
					
				PreparedStatement pst =(PreparedStatement) con.prepareStatement(sql);
			   				
			
				pst.setString(1,venue);
				pst.setString(2,overs);
				pst.setString(3,tname1);
				pst.setString(4,tname2);
				
				
				
				   int i = pst.executeUpdate();
			       //   con.commit(); 
			          String msg=" ";
			          if(i!=0){  
			        	  msg="inserted scuuesfully";
			        	  pw.println(msg);
			          }  
			          else{ 
			        	  msg=" Not inserted scuuesfully";
			        	  pw.println(msg);
			        		        	  
			          }  
			          pst.close();
				 
				
			}catch (Exception e) {
				
				e.printStackTrace();
			}
			

			HttpSession session1 = request.getSession();
			session1.setAttribute("venue", venue);
			session1.setAttribute("overs", overs);
			
			response.sendRedirect("TeamA.jsp");
	
	}

}
