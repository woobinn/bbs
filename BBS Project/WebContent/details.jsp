<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width" initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>JSP Bulletin Board</title>
		<style>
				
		</style>
	</head>
	
	<body>
	  <div class="bg">
		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		%>
	
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main.jsp">Woobin's BBS</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="main.jsp">Main</a></li>
					<li><a href="bbs.jsp">Board</a></li>
				</ul>
				<%
					if(userID == null) {
				%>		
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Login
						<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">Sign In</a></li>
						<li><a href="join.jsp">Sign Up</a></li>
					</ul>
				
				
				
				
				</li>
				</ul>						
				<% 		
					} else {
				%>
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Manage Account<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">Sign Out</a></li>
					</ul>
				
				
				
				
				</li>
				</ul>			
				<%	
					}
				%>

			</div>
		</nav>
		<div class="container">
			<div class="jumbotron">
				<div class="container">
					<h1>Woobin's Bulletin Board System</h1>
					<p> This website is made using bootstrap, JSP, and MySQL.
					
					</p>
					<a class="btn btn-primary btn-pull" href="details.jsp" role="button">GitHub Code</a>
					<a class="btn btn-primary btn-pull" href="details.jsp" role="button">Details</a>
					<a class="btn btn-primary btn-pull" href="details.jsp" role="button">Details</a>
				</div>
			</div>
		</div>

	
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</div>
</body>
</html>