<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>apply</title>
</head>
<%@ include file="./menu.jsp" %>
<%@ include file="dbconn.jsp" %>
<%
   if(!isName) {
%>
   <script>
      alert("�α����� �ʿ��մϴ�.");
      location.href="login.jsp"      
   </script>
<% 
   } else {
%>
<body>
<%
   int pseq = Integer.parseInt(request.getParameter("pseq"));
   int mseq = (int)session.getAttribute("mSeq"); // ����


   request.setCharacterEncoding("euc-kr");
   
   String id = request.getParameter("id");
   ResultSet rs = null;
   PreparedStatement pstmt = null;
   int pPrice = -1;
   int pTotal = -1;
   int pTarget = 0;
   int pStatus = 0;

   try {
      String sql1 = "select * from attend where pSeq = ? and mSeq = ?";
      pstmt = conn.prepareStatement(sql1);
      pstmt.setInt(1, pseq);
      pstmt.setInt(2, mseq);
      
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
         if(pstmt != null) 
            pstmt.close();
         if(rs != null) 
            rs.close();
      %>
         <script>
            alert("�ش� ���� �׸� �̹� �����Ͽ����ϴ�.");
            location.href="products.jsp"   
         </script>
      <%
      }
      if(pstmt != null) 
         pstmt.close();
      if(rs != null) 
         rs.close();
      
      String sql2 = "select pTotal, pPrice, pTarget, pStatus from post where pSeq = ?";
      pstmt = conn.prepareStatement(sql2);
      pstmt.setInt(1, pseq);
      
      rs = pstmt.executeQuery();
      
      if(!rs.next()) {
         if(pstmt != null) 
            pstmt.close();
         if(rs != null) 
            rs.close();
         %>
         <script>
            alert("�ش� ���� �׸��� �������� �ʴ� �׸��Դϴ�.");
            location.href="products.jsp"      
         </script>
         <% 
         response.sendRedirect("products.jsp");
      }else {
         pTotal = rs.getInt("pTotal");
         pPrice = rs.getInt("pPrice");
         pTarget = rs.getInt("pTarget");
         pStatus = rs.getInt("pStatus");
      }
      
      if(pstmt != null) 
         pstmt.close();
      if(rs != null) 
         rs.close();
      
      
      // ��û�ο��� ��ǥ�ο��� ������ ���
      if (pTotal >= pTarget || pStatus == 2){
        
          
          if(pstmt != null) 
              pstmt.close();
         %>
       <script>
       
          alert("��û�ο��� �� á�ų� �̹� �����Ǿ����ϴ�. �� �̻� ��û�� �� �����ϴ�.");
          location.href="products.jsp"      
       </script>
       <% 
      } else {
      
            String sql3 = "insert into attend(aBill, mSeq, pSeq) values(?, ?, ?)";
            pstmt = conn.prepareStatement(sql3);
            pstmt.setInt(1, pPrice);
            pstmt.setInt(2, mseq);
            pstmt.setInt(3, pseq);
            
            pstmt.executeUpdate();
            
            if(pstmt != null) 
                pstmt.close();
            
            String sql4 = "update post set pTotal=? where pSeq=?";
            pstmt = conn.prepareStatement(sql4);
            pstmt.setInt(1, pTotal + 1);
            pstmt.setInt(2, pseq);
            
            pstmt.executeUpdate();
            
            if(pstmt != null) 
                pstmt.close();
            
            
            if (pTotal+1 == pTarget){ // status ���� ��ȯ 
                String sql5= "update post set pStatus=? where pSeq=?";
                pstmt = conn.prepareStatement(sql5);
                pstmt.setInt(1,2);
                pstmt.setInt(2, pseq);
                
                pstmt.executeUpdate();
                
                if(pstmt != null) 
                    pstmt.close();
            }
      
      
      
      
            %>
            <script>
                alert("��û�� �Ϸ��Ͽ����ϴ�.");
                location.href="products.jsp"      
            </script>
            <%
        }
      
      
      
   } catch (SQLException ex) {
      out.println("Member ���̺� ������ �����߽��ϴ�.<br>");
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
<%} %>