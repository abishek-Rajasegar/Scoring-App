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
			<a href="#">Login Page</a>
		</nav>
	</div>

	<div class="body1">


		<form action="Login" method="post">
			<div class="form-group">
				<h1>
					<label for="Email1">Login</label>
				</h1>
			</div>
			<div class="form-group ">

				<input type="email" class="form-control" name="uname" id="Email1"
					placeholder="Enter email Address" required>
			</div>
			<div class="form-group ">

				<input type="password" class="form-control" name="password"
					id="Password1" placeholder="Enter Password" required>
			</div>


			<small>need an account?</small><a href="signup.jsp">signUp</a>
			<div class="form-group ">
				<input type="submit" placeholder="submit">
			</div>

		</form>
	</div>

</body>

</html>