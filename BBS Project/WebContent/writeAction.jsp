<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.bbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent" />
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
		} else {
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('Please fill out all the information.')");
						script.println("history.back()");
						script.println("</script>");	
					} else {
						bbsDAO bbsDAO = new bbsDAO();
						int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
						if (result == -1) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('Failed to submit a post. (DB Error)')");
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
		}

	%>
	
	
	
	

	</body>
</html>