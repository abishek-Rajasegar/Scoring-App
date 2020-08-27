<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/result.css" type="text/css">

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
        
		<nav class="navbar ">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarToggleExternalContent"
				aria-controls="navbarToggleExternalContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="fa fa-arrow-circle-down"></span> CrickZone
			</button>
			<a href="#">First Half</a>
		</nav>
	</div>

	<%!String driverName = "com.mysql.jdbc.Driver";%>
	<%!String url = "jdbc:mysql://localhost:3306/userlogin";%>
	<%!String user = "root";%>
	<%!String psw = "asdfghjkl0";%>
	<%
		HttpSession sec = request.getSession(false);
	Integer target = (Integer) session.getAttribute("target");
	Integer wickets = (Integer) session.getAttribute("wickets");
	%>

	<div class="body1">

		<div class="box">
			<div class="glass"></div>
			<div class="content">
				<form action="bresult" method="Post">
					<h1 style="text-align: center;">Match Result</h1>

					<h6>
						Total Runs Scored :<%=target%>/<%=wickets%>

						Start next Innings
					</h6>

					<div class="form-group">
						<a><button class="btn">Start</button></a>
					</div>
				</form>
			</div>
		</div>
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