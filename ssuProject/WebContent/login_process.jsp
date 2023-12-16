<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int mSeq = -1;
	String mId = null;
	String mName = null;
	String mPhone = null;

	try {
		// TODO : 이미 아이디 있는 지 확인해야 함 
		String sql = "select * from member where mId like ? and mPassword like ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			mSeq = rs.getInt("mSeq");
			mId = rs.getString("mId");
			mName = rs.getString("mName");
			mPhone = rs.getString("mPhone");
			
			session.setAttribute("mSeq", mSeq);
			session.setAttribute("mId", mId);
			session.setAttribute("mName", mName);
			session.setAttribute("mPhone", mPhone);
			
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
	%>
		<script>
			alert("로그인 완료!!");
			location.href="welcome.jsp"		
		</script>
	<% 
		} else { // 아이디가 없을 때
	%>
		<script>
			alert("아이디 혹은 비밀번호가 잘못 입력되었습니다!!")
			location.href="login.jsp"		
		</script>
	<% 
		}
	} catch (SQLException ex) {
		
		out.println("Member 테이블 삽입이 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	} finally {
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>
</body>
</html>