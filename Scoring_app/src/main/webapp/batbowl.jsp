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
					<a href="home.html">Home Page | </a> <a href="completedMatches.jsp">Completed
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
			<a href="#">Batsman-Bowler</a>
		</nav>
	</div>


	<div class="body1">

		<form action="batBowl" method="post">
			<h3>Batsman - Bowler</h3>

			<div class="form-group ">
				<input type="text" class="form-control" name="bname1"
					id="bates_man_1" placeholder="Enter Striker" required> <small
					style="font-size: xx-small; color: lightslategray;">
					<p>please use the same format and spelling which you used before
					</p>
				</small>

			</div>
			<div class="form-group ">

				<input type="text" class="form-control " name="bname2"
					id="bates_man_1" placeholder="Enter Non-Striker" required>
				<small style="font-size: xx-small; color: lightslategray;">
					<p> please use the same format and spelling which you used before
					</p>
				</small>

			</div>
			<div class="form-group ">

				<input type="text" class="form-control " name="bowler" id="bowler"
					placeholder="Enter Bowler" required> <small
					style="font-size: xx-small; color: lightslategray;">
					<p>please use the same format and spelling which you used before
					</p>
				</small>

			</div>
			<a><button class="btn">Finish</button> </a> <small
				style="font-size: xx-small; color: red;">
				<p>All the texts are case sensitive and make sure there are no
					Typos.</p>
			</small>
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