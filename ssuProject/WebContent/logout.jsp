<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Logout</title>
</head>
<body>
<%@ include file="session_check.jsp" %>
<%
	// boolean isSessionValid = request.isRequestedSessionIdValid();
	// String name = (String)session.getAttribute("mName");
	if(isSessionValid) {
		session.invalidate();
%>
<script>
		alert("로그아웃 하였습니다.");
		location.href="welcome.jsp"
</script>
<%
	} else {
%>
<script>
		alert("이미 로그아웃 되어있습니다.");
		location.href="welcome.jsp"
</script>
<%	
	}
%>

</body>
</html>