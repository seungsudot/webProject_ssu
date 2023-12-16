<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
	<%
		Connection conn = null;
	
		String url = "jdbc:mysql://localhost:3306/JSPBookDB?characterEncoding=UTF-8&serverTimezone=UTC";
		String user = "root";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,password);
	%>
</body>
</html>