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
<link rel="stylesheet" href="./css/index.css" type="text/css">

<title></title>
</head>

<body>
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
			<a href="#">Login Page</a>
		</nav>
	</div>

	<div class="body1">

		<form action="signup" method="post">
			<div class="form-group">
				<h1>
					<i class="fa fa-user-circle fa-x"></i>
				</h1>
				<h4>Admin SignUp</h4>

			</div>
			<div class="form-group">

				<input type="email" name="email" class="form-control"
					placeholder="Email" required>

			</div>

			<div class="form-group">
				<input type="password" name="password" class="form-control"
					placeholder="Password" name="password" id="password"
					onkeyup="checkPass()" required>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="password2"
					placeholder="Re-Enter Password" id="password2"
					onkeyup="checkPass()" required> <span id="confirmMessage"
					class="confirmMessage"></span>
			</div>

			<input type="submit" placeholder="submit">
		</form>
	</div>

	<script>
		function checkPass() {

			var get_elem = document.getElementById, pass1 = document
					.getElementById('password'), pass2 = document
					.getElementById('password2'), message = document
					.getElementById('confirmMessage'), colors = {
				goodColor : "#fff",
				goodColored : "#087a08",
				badColor : "#fff",
				badColored : "#ed0b0b"
			}, strings = {
				"confirmMessage" : [ "Password Match", "Check Password" ]
			};

			if (password.value === password2.value
					&& (password.value + password2.value) !== "") {
				password2.style.backgroundColor = colors["Password MatchColor"];
				message.style.color = colors["Password MatchColored"];
				message.innerHTML = strings["confirmMessage"][0];
			} else if (!(password2.value === "")) {
				password2.style.backgroundColor = colors["Check PasswordColor"];
				message.style.color = colors["Check PasswordColored"];
				message.innerHTML = strings["confirmMessage"][1];

			} else {
				message.innerHTML = "";
			}

		}
	</script>


</body>

</html>