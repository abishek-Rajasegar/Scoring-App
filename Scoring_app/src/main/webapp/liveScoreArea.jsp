<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
String optedto = (String) sec.getAttribute("optedto");
Integer total_run = (Integer) session.getAttribute("total_run");
Integer total_balls = (Integer) session.getAttribute("total_balls");
String overs1 = (String) sec.getAttribute("overs");
int overs = 0;
try {
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

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="live.css" type="text/css">

<title></title>

</head>
<body>

	<%
		if (session.getAttribute("username") == null) {
		response.sendRedirect("index.jsp");
	}
	%>
		<div class="pos-f-t">
        <div class="collapse" id="navbarToggleExternalContent">
            <div class=" p-4">
                <h5 class="text-white">
                    <a href="home.jsp">Home Page | </a>

                    <a href="completedMatches.jsp">Completed Matches | </a>

                    <a href="upcomingmatches.jsp">Upcoming Matches | </a>

                    <a href="teams.jsp">Teams | </a>

                    <a href="adminPlayers.jsp">Players | </a>

                    <a href="About.jsp">About | </a>
                </h5>
                <span class="text-muted"></span>
            </div>
        </div>
        
		<nav class="navbar navbar-dark bg-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarToggleExternalContent"
				aria-controls="navbarToggleExternalContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span> CrickZone
			</button>
		</nav>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12 col-sm-10 offset-1">

				<h1>

					<%
						try {
					%>
					<%=batting1%>
					:
					<%=total_run%>/<%=wickets%>
					(<%=total_balls / 6%>.<%=total_balls % 6%>)
					<%
						} catch (Exception e) {
					e.printStackTrace();
					}
					%>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span> Live Score</span>
				</h1>
				<table border="1" class="table">
					<thead class="table-dark">
						<tr>
							<td>Batsman Name</td>
							<td>Number Of 4</td>
							<td>Number Of 6</td>
							<td>total_runs</td>
							<td>Number of balls</td>
							<td>Status</td>
							<td>Bowler Name</td>
							<td>Fielder Name</td>

						</tr>
					</thead>
					<%
						try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();
						String sql1 = "select batsman_name,number_of_4,number_of_6,total_runs,number_of_balls,Out_Status,Fielder_Name,bowler_name from battingScore where team_id = (select team_id from teams where team_name='"
						+ batting1 + "') and  match_id = (select match_id from matches where team1_name='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";
						resultSet = statement.executeQuery(sql1);
						while (resultSet.next()) {
					%>
					<tbody>
						<tr>
							<td><%=resultSet.getString("batsman_name")%></td>
							<td><%=resultSet.getString("number_of_4")%></td>
							<td><%=resultSet.getString("number_of_6")%></td>
							<td><%=resultSet.getString("total_runs")%></td>
							<td><%=resultSet.getString("number_of_balls")%></td>
							<td><%=resultSet.getString("Out_Status")%></td>
							<td><%=resultSet.getString("bowler_name")%></td>
							<td><%=resultSet.getString("Fielder_Name")%></td>
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

			<div class="col-12 col-sm-10 offset-1 ">
				<h1><%=bowling1%></h1>
				<table border="1" class="table">
					<thead class="table-dark">
						<tr>
							<td>Bowler Name</td>
							<td>Number Of 4</td>
							<td>Number Of 6</td>
							<td>Wickets</td>
							<td>Number of Overs</td>
							<td>Total Runs</td>

						</tr>
					</thead>
					<%
						try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();
						String sql1 = "select bowler_name,number_of_4,number_of_6,total_runs,total_wickets,number_of_balls,total_runs from bowlingScore where team_id = (select team_id from teams where team_name='"
						+ bowling1 + "') and  match_id = (select match_id from matches where team1_name='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";
						resultSet = statement.executeQuery(sql1);
						while (resultSet.next()) {
					%>
					<tbody>
						<tr>
							<td class="bg-info"><%=resultSet.getString("bowler_name")%></td>
							<td class="bg-info"><%=resultSet.getString("number_of_4")%></td>
							<td class="bg-info"><%=resultSet.getString("number_of_6")%></td>
							<td class="bg-info"><%=resultSet.getString("total_wickets")%></td>
							<td class="bg-info"><%=resultSet.getString("number_of_balls")%></td>
							<td class="bg-info"><%=resultSet.getString("total_runs")%></td>
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
		</div>
	</div>



	<div class="container">
		<div class="row">
			<div class="col-12 col-sm-10 offset-1">

				<h1>



					<%
						try {
					%>
					<%=batting2%>
					:
					<%=total_run%>/<%=wickets%>
					(<%=total_balls / 6%>.<%=total_balls % 6%>)
					<%
						} catch (Exception e) {
					e.printStackTrace();
					}
					%>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span> Live Score</span>
				</h1>
				<table border="1" class="table">
					<thead class="table-dark">
						<tr>
							<td>Batsman Name</td>
							<td>Number Of 4</td>
							<td>Number Of 6</td>
							<td>total_runs</td>
							<td>Number of balls</td>
							<td>Status</td>
							<td>Bowler Name</td>
							<td>Fielder Name</td>

						</tr>
					</thead>
					<%
						try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();
						String sql1 = "select batsman_name,number_of_4,number_of_6,total_runs,number_of_balls,Out_Status,Fielder_Name,bowler_name from battingScore where team_id = (select team_id from teams where team_name='"
						+ batting2 + "') and  match_id = (select match_id from matches where team1_name='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";
						resultSet = statement.executeQuery(sql1);
						while (resultSet.next()) {
					%>
					<tbody>
						<tr>
							<td class="bg-info"><%=resultSet.getString("batsman_name")%></td>
							<td class="bg-info"><%=resultSet.getString("number_of_4")%></td>
							<td class="bg-info"><%=resultSet.getString("number_of_6")%></td>
							<td class="bg-info"><%=resultSet.getString("total_runs")%></td>
							<td class="bg-info"><%=resultSet.getString("number_of_balls")%></td>
							<td class="bg-info"><%=resultSet.getString("Out_Status")%></td>
							<td class="bg-info"><%=resultSet.getString("bowler_name")%></td>
							<td class="bg-info"><%=resultSet.getString("Fielder_Name")%></td>
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

			<div class="col-12 col-sm-10 offset-1 ">
				<h1><%=bowling2%></h1>
				<table border="1" class="table">
					<thead class="table-dark">
						<tr>
							<td>Bowler Name</td>
							<td>Number Of 4</td>
							<td>Number Of 6</td>
							<td>Wickets</td>
							<td>Number of Overs</td>
							<td>Total Runs</td>

						</tr>
					</thead>
					<%
						try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();
						String sql1 = "select bowler_name,number_of_4,number_of_6,total_runs,total_wickets,number_of_balls,total_runs from bowlingScore where team_id = (select team_id from teams where team_name='"
						+ bowling2 + "') and  match_id = (select match_id from matches where team1_name='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";
						resultSet = statement.executeQuery(sql1);
						while (resultSet.next()) {
					%>
					<tbody>
						<tr>
							<td class="bg-info"><%=resultSet.getString("bowler_name")%></td>
							<td class="bg-info"><%=resultSet.getString("number_of_4")%></td>
							<td class="bg-info"><%=resultSet.getString("number_of_6")%></td>
							<td class="bg-info"><%=resultSet.getString("total_wickets")%></td>
							<td class="bg-info"><%=resultSet.getString("number_of_balls")%></td>
							<td class="bg-info"><%=resultSet.getString("total_runs")%></td>
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
