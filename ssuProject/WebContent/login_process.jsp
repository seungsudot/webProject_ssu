<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
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
		// TODO : �̹� ���̵� �ִ� �� Ȯ���ؾ� �� 
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
			alert("�α��� �Ϸ�!!");
			location.href="welcome.jsp"		
		</script>
	<% 
		} else { // ���̵� ���� ��
	%>
		<script>
			alert("���̵� Ȥ�� ��й�ȣ�� �߸� �ԷµǾ����ϴ�!!")
			location.href="login.jsp"		
		</script>
	<% 
		}
	} catch (SQLException ex) {
		
		out.println("Member ���̺� ������ �����߽��ϴ�.<br>");
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