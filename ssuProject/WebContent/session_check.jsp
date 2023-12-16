<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>session_check</title>
</head>
<body>
<%
	boolean isSessionValid = request.isRequestedSessionIdValid();
	String nameforCheck = (String)session.getAttribute("mName");
	boolean isName = nameforCheck != null;
%>
</body>
</html>