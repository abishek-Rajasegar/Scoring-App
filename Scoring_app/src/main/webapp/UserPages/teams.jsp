
<%@ page import="java.util.*"%>

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
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/players.css" type="text/css">

<title></title>
</head>

<body>

	<div class="pos-f-t">
		<div class="collapse" id="navbarToggleExternalContent">
			<div class=" p-4">
				<h5 class="text-white">
					<a href="home.html">Home Page | </a> <a href="completedMatches.jsp">Completed
						Matches | </a> <a href="upcomingmatches.jsp">Upcoming Matches | </a> <a
						href="teams.jsp">Teams | </a> <a href="players.jsp">Players
						| </a> <a href="about.html">About | </a>
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
			<a href="#">Teams</a>
		</nav>
	</div>



	<div class="body1">
		<%
			try {
			connection = DriverManager.getConnection(connectionUrl + database, userid, password);
			statement = connection.createStatement();
			String sql1 = "select team_name from teams order by team_name;";
			resultSet = statement.executeQuery(sql1);
			while (resultSet.next()) {
		%>
		<div class="box">
			<div class="glass"></div>
			<div class="content">

				<i class="fa fa-users fa-5x" aria-hidden="true"></i>

				<h3><%=resultSet.getString("team_name")%></h3>

				<h6></h6>
				<h6></h6>
				<h6></h6>


			</div>
		</div>

		<%
			}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

	</div>


	<!-- Footer -->
	<footer class="page-footer font-large special-color-dark pt-4">

		<!-- Footer Elements -->
		<div class="container">

			<!-- Social buttons -->
			<ul class="list-unstyled list-inline text-center">
				<li class="list-inline-item"><a
					class="btn-floating btn-fb mx-2"> <i
						class="fa fa-facebook-f fa-lg"> </i>
				</a></li>
				<li class="list-inline-item"><a
					class="btn-floating btn-tw mx-2"> <i
						class="fa fa-twitter fa-lg"> </i>
				</a></li>

				<li class="list-inline-item"><a
					class="btn-floating btn-dribbble mx-2"> <i
						class="fa fa-dribbble fa-lg"> </i>
				</a></li>
			</ul>


		</div>


	</footer>





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