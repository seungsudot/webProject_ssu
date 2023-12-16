<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp"%>

<%

	int pSeq = Integer.parseInt(request.getParameter("pSeq"));
	PreparedStatement pstmt = null;


	try{String sql = "update post set pStatus=2  where pSeq = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,pSeq);
	pstmt.executeUpdate();

	}catch (SQLException ex){
		out.println("member 변수 호출 실패");
	}finally{
		if(pstmt != null){
			pstmt.close();
		}if(conn!=null){
			conn.close();
		}
		
		 
		
		//response.sendRedirect("myPage.jsp");
	} 
	

	
%>
<script>
	alert("완료처리 되었습니다");

	window.location.href = "myPage.jsp"

</script>


</body>
</html>