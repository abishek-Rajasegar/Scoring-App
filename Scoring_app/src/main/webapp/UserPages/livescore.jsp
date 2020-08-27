<%@page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>

<%
	String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "userlogin";
String userid = "root";
String password = "asdfghjkl0";
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
HttpSession sec = request.getSession(false);
String team1 = (String) sec.getAttribute("team1");
String team2 = (String) sec.getAttribute("team2");
String wonby1 = (String) sec.getAttribute("wonby1");
String wonby = (String) sec.getAttribute("wonby");
String venue = (String) sec.getAttribute("venue");


boolean firsthalf= false;
String optedto = (String) sec.getAttribute("optedto");
Integer total_run = (Integer) session.getAttribute("total_run");
Integer total_balls = (Integer) session.getAttribute("total_balls");

Integer target1 = (Integer) sec.getAttribute("target");
Integer total_balls1 = (Integer) session.getAttribute("total_balls1");
Integer wickets1 = (Integer) session.getAttribute("wickets1");
String overs1 = (String) sec.getAttribute("overs");
int overs = 0,a=0;
float b=0;
try {
	 firsthalf = (boolean) sec.getAttribute("firsthalf");
	overs = Integer.parseInt(overs1);
} catch (Exception e) {
	e.printStackTrace();
}
Integer wickets = (Integer) session.getAttribute("wickets");
String batting1 = null, batting2 = null, bowling1 = null, bowling2 = null;
try {
	if (wonby1.equals(team1) && optedto.equals("batting")) {
		batting1 = team1;
		bowling1 = team2;
		batting2 = team2;
		bowling2 = team1;
	} else {
		batting1 = team2;
		bowling1 = team1;
		batting2 = team1;
		bowling2 = team2;
	}
	if (total_balls == overs * 6) {
		if (batting1.equals(team1)) {
	batting2 = team2;
	bowling2 = team1;
		} else {
	batting2 = team1;
	bowling2 = team2;
		}
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>



<html>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/5432f5a97d.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/livescore.css" type="text/css">

<title></title>
</head>

<body>

	<div class="pos-f-t">
		<div class="collapse" id="navbarToggleExternalContent">
			<div class=" p-4">
				<h5 class="text-white">
					<a href="home.html">Home Page | </a> <a href="completedMatches.jsp">Completed
						Matches | </a> <a href="upcomingMatches.jsp">Upcoming Matches | </a> <a
						href="teams.jsp">Teams | </a> <a href="players.jsp">Players |
					</a> <a href="about.html">About | </a>
				</h5>
				<span class="text-muted"></span>
			</div>
		</div>
		<nav class="navbar ">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarToggleExternalContent"
				aria-controls="navbarToggleExternalContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="fa fa-arrow-circle-down"></span> CrickZone
			</button>
			<a href="#">Live Score Area</a>
		</nav>
	</div>



	<div class="container">

		<div class="rwo">
			<div class="col-12 col-xs-6">
				<%
					try {
				%>
				<h1><%=team1%>
					vs
					<%=team2%>
				</h1>
				<h3>
					Overs:
					<%=overs1%>
					&nbsp;| Venue: <span><i class="fas fa-map-marker-alt "></i>
						<%=venue%></span> &nbsp;| Date & Time :
					<%=(new java.util.Date()).toLocaleString()%>
				</h3>
				<h3><%=batting1%>
					
					<% if(firsthalf==false){  %>
					<%=total_run%>/<%=wickets%>
					<%=total_balls / 6%>.<%=total_balls % 6%>
					<% } %>
					
					<% if(firsthalf==true){  %>
					<%=target1%>/<%=wickets1%>
					<%=total_balls1 / 6%>.<%=total_balls1 % 6%>
					<% } %>
					
					
				</h3>
				<br>
				<%
					} catch (Exception e) {
				e.printStackTrace();
				}
				%>
				
				<table border="1" class="table">
					<thead class="table-dark">
						<tr>
							<td>Batsman Name</td>
							<td>4(s)</td>
							<td>6(s)</td>
							<td>RUNS</td>
							<td>BALLS</td>
							<td>STS</td>
							<td>BoName</td>
							<td>FelName</td>
							<td>SR</td>

						</tr>
					</thead>
					<%
						try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();
						String sql1 = "select batsman_name,number_of_4,number_of_6,total_runs,number_of_balls,Out_Status,Fielder_Name,bowler_name,strike_rate from battingScore where team_id = (select team_id from teams where team_name='"
						+ batting1 + "') and  match_id = (select match_id from matches where team1_name='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";
						resultSet = statement.executeQuery(sql1);
						while (resultSet.next()) {
					%>
					<tbody>
						<tr class="bg-white">
							<td><%=resultSet.getString("batsman_name")%></td>
							<td><%=resultSet.getString("number_of_4")%></td>
							<td><%=resultSet.getString("number_of_6")%></td>
							<td><%=resultSet.getString("total_runs")%></td>
							<td><%=resultSet.getString("number_of_balls")%></td>
							<td><%=resultSet.getString("Out_Status")%></td>
							<td><%=resultSet.getString("bowler_name")%></td>
							<td><%=resultSet.getString("Fielder_Name")%></td>
							<td><%=resultSet.getString("strike_rate")%></td>
						</tr>
					</tbody>
					<%
						}
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</table>
			</div>
            
			<div class="col-12 col-xs-6">
              <h3><%=bowling1 %></h3>
				<table border="1" class="table">
					<thead class="table-dark">
						<tr>
							<td>Bowler Name</td>
							<td>4(s)</td>
							<td>6(s)</td>
							<td>WKTS</td>
							<td>OVRS</td>
							<td>RUNS</td>
							<td>ECO</td>

						</tr>
					</thead>
					<%
						try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();
						String sql1 = "select bowler_name,number_of_4,number_of_6,total_runs,total_wickets,number_of_balls,total_runs,economy_rate from bowlingScore where team_id = (select team_id from teams where team_name='"
						+ bowling1 + "') and  match_id = (select match_id from matches where team1_name='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";
						resultSet = statement.executeQuery(sql1);
						while (resultSet.next()) {
					%>
					<tbody>
						<tr class="bg-white">
							<td ><%=resultSet.getString("bowler_name")%></td>
							<td ><%=resultSet.getString("number_of_4")%></td>
							<td ><%=resultSet.getString("number_of_6")%></td>
							<td ><%=resultSet.getString("total_wickets")%></td>
							<td ><%=resultSet.getString("number_of_balls")%></td>
							<td ><%=resultSet.getString("total_runs")%></td>
							<td ><%=resultSet.getString("economy_rate")%></td>
						</tr>
					</tbody>
					<%
						}
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</table>
			</div>
			
			
			
		<%if(firsthalf == true) {  %>
	
	

			<div class="col-12 col-xm-6">

				<h3>
					

         <%=batting2%>
         <%=total_run%>/<%=wickets%>
					<%=total_balls / 6%>.<%=total_balls % 6%>
				
				</h3>
				<table border="1" class="table">
					<thead class="table-dark">
						<tr>
							<td>Batsman Name</td>
							<td>4(s)</td>
							<td>6(s)</td>
							<td>RUNS</td>
							<td>BALLS</td>
							<td>STS</td>
							<td>BoName</td>
							<td>FelName</td>
							<td>SR</td>

						</tr>
					</thead>
					<%
						try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();
						String sql1 = "select batsman_name,number_of_4,number_of_6,total_runs,number_of_balls,Out_Status,Fielder_Name,bowler_name,strike_rate from battingScore where team_id = (select team_id from teams where team_name='"
						+ batting2 + "') and  match_id = (select match_id from matches where team1_name='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";
						resultSet = statement.executeQuery(sql1);
						while (resultSet.next()) {
					%>
					<tbody>
					<% int runs = Integer.parseInt(resultSet.getString("total_runs"));
					   int balls = Integer.parseInt(resultSet.getString("total_runs"));
					   int rr=runs/balls*100;
					  
					%>
						<tr class="bg-white">
							<td><%=resultSet.getString("batsman_name")%></td>
							<td><%=resultSet.getString("number_of_4")%></td>
							<td><%=resultSet.getString("number_of_6")%></td>
							<td><%=resultSet.getString("total_runs")%></td>
							<td><%=resultSet.getString("number_of_balls")%></td>
							<td><%=resultSet.getString("Out_Status")%></td>
							<td><%=resultSet.getString("bowler_name")%></td>
							<td><%=resultSet.getString("Fielder_Name")%></td>
							<td><%=resultSet.getString("strike_rate")%></td>
							
							
						</tr>
					</tbody>
					<%
						}
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</table>
			</div>
        
			<div class="col-12 col-xs-6">
                <h3><%=bowling2 %></h3>
				<table border="1" class="table">
					<thead class="table-dark">
						<tr>
							<td>Bowler Name</td>
							<td>4(s)</td>
							<td>6(s)</td>
							<td>WKTS</td>
							<td>OVRS</td>
							<td>RUNS</td>
							<td>ECO</td>

						</tr>
					</thead>
					<%
						try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();
						String sql1 = "select bowler_name,number_of_4,number_of_6,total_runs,total_wickets,number_of_balls,total_runs,economy_rate from bowlingScore where team_id = (select team_id from teams where team_name='"
						+ bowling2 + "') and  match_id = (select match_id from matches where team1_name='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";
						resultSet = statement.executeQuery(sql1);
						while (resultSet.next()) {
					%>
					<tbody>
						<tr class="bg-white">
							<td ><%=resultSet.getString("bowler_name")%></td>
							<td ><%=resultSet.getString("number_of_4")%></td>
							<td ><%=resultSet.getString("number_of_6")%></td>
							<td ><%=resultSet.getString("total_wickets")%></td>
							<td ><%=resultSet.getString("number_of_balls")%></td>
							<td ><%=resultSet.getString("total_runs")%></td>
							<td ><%=resultSet.getString("economy_rate")%></td>
						</tr>
					</tbody>
					<%
						}
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</table>
			</div>
			<%} %>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js "
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN "
		crossorigin="anonymous ">
		
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js "
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q "
		crossorigin="anonymous "></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js "
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl "
		crossorigin="anonymous "></script>

</body>
</html>
				
				