<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.bbs" %>
<%@ page import="bbs.bbsDAO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width" initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>JSP Bulletin Board</title>
	</head>
	
	<body>
		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
			if(userID == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('You have to be logged in')");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");		
								
			}
			int bbsID = 0;
			if (request.getParameter("bbsID") != null) {
				bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
			if (bbsID == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('This post is unavailable')");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");		
				
			}
			bbs bbs = new bbsDAO().getBbs(bbsID);
			if (!userID.equals(bbs.getUserID())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('You don't have a permission for this action')");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");		
												
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
					<li><a href="main.jsp">Main</a></li>
					<li class="active"><a href="bbs.jsp">Board</a></li>
				</ul>
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

			</div>
		</nav>
	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
			<table class="table table-striped" style="text align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">  Edit Post	
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="Title" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="Write Post" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>
					</tr>
				</tbody>
				</table>	
				<input type="submit" class="btn btn-primary pull-right" value="Edit Post">
				
			</form>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>