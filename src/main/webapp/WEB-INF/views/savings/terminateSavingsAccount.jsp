<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>저축 계좌 해지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/home.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">JW은행</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">메인페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/accounts">내 계좌</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/transfer">계좌이체</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/accountRegister">계좌 개설</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/savingsAccountRegister">적금</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/loan/apply">대출</a></li>
            </ul>
        </div>
    </div>
</nav>
<section class="bg-light py-5">
    <div class="container px-5 my-5">
        <div class="text-center mb-5">
            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi-exclamation-triangle"></i></div>
            <h2 class="fw-bolder">저축 계좌 해지</h2>
            <form action="${pageContext.request.contextPath}/terminate" method="post">
                <input type="hidden" id="savingsAccountNum" name="savingsAccountNum" value="${account.savings_account_num}" required>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-danger">Terminate Account</button>
            </form>
            <c:if test="${not empty error}">
                <p style="color: red;">${error}</p>
            </c:if>
        </div>
    </div>
</section>
<footer class="py-5 bg-dark">
    <div class="container px-5"><p class="m-0 text-center text-white">&copy; 2024 Bank. All rights reserved.</p></div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
