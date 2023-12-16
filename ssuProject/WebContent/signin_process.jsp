<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	PreparedStatement pstmt = null;

	ResultSet rs = null;

	try {
		// TODO : 이미 아이디 있는 지 확인해야 함 
		String sql = "select mId from member where mId like ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String account = request.getParameter("account");
	
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
%>
		<script>
			alert("해당 아이디가 이미 존재합니다.");
			location.href="signin.jsp"		
		</script>			
<% 
		}
		
		sql = "insert into member(mId, mPassword, mName, mPhone, mAccount) values(? ,? ,? ,?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setString(4, phone);
		pstmt.setString(5, account);
		pstmt.executeUpdate();
%>
	
		<script>
			alert("회원가입에 성공하였습니다.");
			location.href="login.jsp"		
		</script>			
<%
	} catch (SQLException ex) {
		out.println("Member 테이블 삽입이 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	} finally {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>
</body>
</html>
