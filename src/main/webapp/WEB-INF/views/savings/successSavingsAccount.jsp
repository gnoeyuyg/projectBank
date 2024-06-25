<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

    <meta charset="UTF-8">
    <title>적금 계좌 개설 성공</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <h2>적금 계좌 개설 성공</h2>
    <p>계좌 번호: ${accountNumber}</p>
    <p>적금액: ${amount}</p>
    <p>만기일자: 5년 뒤</p>
    <p>이자율: ${interestRate}%</p>
    
    <form action="${pageContext.request.contextPath}/" method="get">
        <button type="submit">확인</button>
    </form>
</body>
</html>
