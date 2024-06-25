<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

    <meta charset="UTF-8">
    <title>로그아웃</title>
</head>
<body>
    <h1>로그아웃</h1>
    
    <p>로그아웃 되었습니다.</p>
    
    <%-- 로그인 페이지로 이동하는 링크 --%>
    <a href="${pageContext.request.contextPath}/managerLogin">로그인 페이지로 이동</a>
</body>
</html>
