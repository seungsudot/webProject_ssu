<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <%@ include file="dbconn.jsp"%>

    <%
    request.setCharacterEncoding("UTF-8");

    MultipartRequest multi = new MultipartRequest(request, "C:\\DEV\\eclipse-workspace\\ssuProject\\WebContent\\images", 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

    String pText = multi.getParameter("pText");
    int pTarget = Integer.parseInt(multi.getParameter("pTarget"));
    String pUrl = multi.getParameter("pUrl");
    String pTitle = multi.getParameter("pTitle");
    int pPrice = Integer.parseInt(multi.getParameter("pPrice"));

    int mSeq = (int)session.getAttribute("mSeq");

    int pSeq = 0;

    // post 업로드
    String sql = "INSERT INTO post(pText, pTarget, pUrl, pTitle, pPrice, pImage, mSeq, pTotal, pStatus) VALUES (?,?,?,?,?,?,?,?, ?)";
    try (PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        pstmt.setString(1, pText);
        pstmt.setInt(2, pTarget);
        pstmt.setString(3, pUrl);
        pstmt.setString(4, pTitle);
        pstmt.setInt(5, pPrice);
        pstmt.setString(6, multi.getOriginalFileName("pImage"));
        pstmt.setInt(7, mSeq);
        pstmt.setInt(8, 1);
        pstmt.setInt(9, 1);

        pstmt.executeUpdate();

        ResultSet generatedKeys = pstmt.getGeneratedKeys();
        if (generatedKeys.next()) {
            pSeq = generatedKeys.getInt(1);
        }
    }

    // attend 업로드
    String sql3 = "INSERT INTO attend(aBill, mSeq, pSeq) VALUES (?,?,?)";
    try (PreparedStatement pstmt3 = conn.prepareStatement(sql3)) {
        pstmt3.setInt(1, pPrice);
        pstmt3.setInt(2, mSeq);
        pstmt3.setInt(3, pSeq);
        pstmt3.executeUpdate();

        response.sendRedirect("products.jsp");
    } finally {
        // 리소스 해제
        if (conn != null) {
            conn.close();
        }
    }
    %>
</body>
</html>
