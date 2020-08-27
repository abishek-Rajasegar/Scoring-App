<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/hadmin.css" type="text/css">

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
                    
                    <a href="index.jsp">Sign-out </a>
                </h5>
                <span class="text-muted"></span>
            </div>
        </div>
        
        <nav class="navbar ">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="fa fa-arrow-circle-down"></span>
         CrickZone </button>
            <a href="#">Home Page</a>
            <a href="shedulematch.jsp">
            <button class="btn btn-primary"> Schedule a match</button></a>
            
        </nav>
    </div>



<div class="body1">

        <div class="box">
            <div class="glass"></div>
            <div class="content">
                <span> <i class="fa fa-plus-circle fa-4x" aria-hidden="true"></i></span>
                <h4>
                    <a href="enterteam1.jsp"> Create a New Match </a></h4>
            </div>
        </div>

        <div class="box">
            <div class="glass"></div>
            <div class="content">
                <span><i class="fa fa-calendar-check-o fa-4x" aria-hidden="true"></i></span>
                <h4><a href="completedMatches.jsp">Completed Matches</a></h4>
            </div>
        </div>

        <div class="box">
            <div class="glass"></div>
            <div class="content">
                <i class="fa fa-chevron-circle-up fa-4x" aria-hidden="true"></i>
                <h4><a href="upcomingmatches.jsp"> Upcoming Matches</a></h4>
            </div>
        </div>

        <div class="box">
            <div class="glass"></div>
            <div class="content">
                <i class="fa fa-bars fa-4x" aria-hidden="true"></i>
                <h4><a href="teams.jsp">View Existing Teams </a></h4>
            </div>
        </div>



        <div class="box">
            <div class="glass"></div>
            <div class="content">
                <i class="fa fa-users fa-4x" aria-hidden="true"></i>
                <h4> <a href="adminPlayers.jsp">View Existing Players</a></h4>
            </div>
        </div>


        <div class="box">
            <div class="glass"></div>
            <div class="content">
                <i class="fa fa-dot-circle-o fa-4x" aria-hidden="true"></i>
                <h4> <a href="About.jsp"> All About CrickZone </a></h4>
            </div>
        </div>

    </div>



    <!-- Footer -->
    <footer class="page-footer  special-color-dark  pt-4">


        <div class="container">


            <ul class="list-unstyled list-inline text-center">
                <li class="list-inline-item">
                    <a class="btn-floating btn-fb mx-2">
                        <i class="fa fa-facebook-f fa-2x"> </i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-tw mx-2">
                        <i class="fa fa-twitter fa-2x"> </i>
                    </a>
                </li>

                <li class="list-inline-item">
                    <a class="btn-floating btn-dribbble mx-2">
                        <i class="fa fa-dribbble fa-2x"> </i>
                    </a>
                </li>
            </ul>


        </div>


    </footer>





    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js " integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN " crossorigin="anonymous "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js " integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q " crossorigin="anonymous "></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js " integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl " crossorigin="anonymous "></script>
</body>

</html>