<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/player.css" type="text/css">

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
					<a href="home.jsp">Home Page | </a> <a href="completedMatches.jsp">Completed
						Matches | </a> <a href="upcomingmatches.jsp">Upcoming Matches | </a> <a
						href="teams.jsp">Teams | </a> <a href="adminPlayers.jsp">Players
						| </a> <a href="About.jsp">About | </a>
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
			<a href="#">Players Team A</a>
		</nav>
	</div>


	<%!String driverName = "com.mysql.jdbc.Driver";%>
	<%!String url = "jdbc:mysql://localhost:3306/userlogin";%>
	<%!String user = "root";%>
	<%!String psw = "asdfghjkl0";%>
	<%
		HttpSession sec = request.getSession(false);
	String bowler = null;
	bowler = (String) sec.getAttribute("bowler");
	String striker = (String) sec.getAttribute("striker");
	String nonstriker = (String) sec.getAttribute("nonstriker");
	String wonby = (String) sec.getAttribute("wonby");
	Integer total_run = (Integer) session.getAttribute("total_run");
	Integer total_balls = (Integer) session.getAttribute("total_balls");
	Integer wickets = (Integer) session.getAttribute("wickets");
	%>


	<div class="body1">



		<form action="Score" method="post">

			<h3>Ball by Ball Runs</h3>

			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="strike"
					id="batting" value="<%=(String) sec.getAttribute("striker")%>"
					checked> <label class="form-check-label" for="batting">
					<%=striker%>
				</label>
			</div>

			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="strike"
					id="batting" value="<%=(String) sec.getAttribute("nonstriker")%>">
				<label class="form-check-label" for="batting"> <%=nonstriker%>
				</label>
			</div>

			<div class="form-check form-check-inline">
				<h6
					style="border: 1px solid silver; padding: 5px 5px; width: 105%; border-radius: 2em; text-align: center; align-items: center; color: yellow;">
					<%
						try {
					%>
					<%=wonby%>
					:
					<%=total_run%>/<%=wickets%>
					(<%=total_balls / 6%>.<%=total_balls % 6%>)
					<%
						} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</h6>
			</div>

			<br> <br>

			<div class="form-group ">
				<select name="runs" id="" class="form-control selection" required>
					<option value="" disabled selected>Choose runs Scored</option>
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="6">6</option>
				</select>

			</div>
			<div class="form-group">

				<select name="extras" id="" class="form-control selection" required>

					<option value="no">Select if Extra</option>
					<option value="wide">wide</option>
					<option value="noball">No Ball</option>
					<option value="byes">Byes</option>
					<option value="legbyes">Leg Byes</option>
				</select>

			</div>
			<div class="form-group">
				<select name="status" id="" class="form-control selection" required>
					<option value="notout">not out</option>
					<option value="bowled">Bowled out</option>
					<option value="Caught">Caught</option>
					<option value="lbw">LBW</option>
					<option value="runout">Run out</option>
					<option value="hitwicket">Stumped</option>
					<option value="stumped">Hit wicket</option>
					<option value="retired">Retired</option>
					<option value="htbt">Hit the ball twice</option>
					<option value="otf">Obstructing the field</option>
					<option value="timedout">Timed out</option>
				</select>
			</div>

			<div class="form-group"></div>
			<%
				Connection con = null;
			PreparedStatement ps = null;
			try {
				Class.forName(driverName);
				con = DriverManager.getConnection(url, user, psw);
				String sql = "SELECT Player_name FROM players p,teams t where t.team_id=p.team_id and team_name=(select team_name from teams t, players p where t.team_id=p.team_id and Player_name='"
				+ bowler + "');";
				ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
			%>

			<select name="fielder" class="form-control selection">
				<option value="null">if out select fielder</option>
				<%
					while (rs.next()) {
					String fname = rs.getString("Player_name");
				%>

				<option value="<%=fname%>"><%=fname%></option>
				<%
					}
				%>
			</select>

			<%
				} catch (SQLException sqe) {
			out.println(sqe);
			}
			%>
			<br>
			<div class="form-group ">
				<button type="submit" class="btn">Update Score</button>
			</div>
		</form>

	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js "
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN "
		crossorigin="anonymous "></script>
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

