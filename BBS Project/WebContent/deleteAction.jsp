<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.bbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP Bulletin Board</title>
	</head>
	
	<body>
	<%
	
	String userID = null;
		if(session.getAttribute("userID") != null) {
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
											
		} else  {
			
				bbsDAO bbsDAO = new bbsDAO();
				int result = bbsDAO.delete(bbsID);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('Failed to delete a post. (DB Error)')");
					script.println("history.back()");
					script.println("</script>");
				}		
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
					}
				
				}

	%>
	
	
	
	

	</body>
</html>