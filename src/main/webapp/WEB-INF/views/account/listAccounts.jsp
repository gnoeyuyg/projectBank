<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>내 계좌</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/CSS/home.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="${ pageContext.request.contextPath }/">JW은행</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/">메인페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="accounts">내 계좌</a></li>
                        <li class="nav-item"><a class="nav-link" href="transfer">계좌이체</a></li>
                        <li class="nav-item"><a class="nav-link" href="account">계좌 개설</a></li>
                        <li class="nav-item"><a class="nav-link" href="savings">적금</a></li>
                        <li class="nav-item"><a class="nav-link" href="loans">대출</a></li>
                    </ul>
                </div>
            </div>
     </nav>
     <section class="bg-light py-5">
    <div class="container px-5 my-5">
        <div class="text-center mb-5">
            <h1 class="fw-bolder">내 계좌 목록</h1>
            <p class="lead fw-normal text-muted mb-0">나의 계좌 정보를 확인 하세요!</p>
        </div>
        <div class="row gx-5 justify-content-center">
            <!-- 계좌 정보 카드 반복 시작 -->
            <c:forEach var="account" items="${accounts}">
                <div class="col-lg-6 col-xl-4">
                    <div class="card mb-5 mb-xl-0">
                        <div class="card-body p-5">
                            <div class="small text-uppercase fw-bold text-muted"><strong>잔액</strong></div>
                            <div class="mb-3">
                                <span class="display-4 fw-bold"><fmt:formatNumber value="${account.account_money}" type="number" groupingUsed="true" /></span>
                                <span class="text-muted"></span>
                            </div>
                            <ul class="list-unstyled mb-4">
                                <li class="mb-2">
                                    <i class="bi bi-check text-primary"></i>
                                    <strong>예금주</strong>
                                </li>
                                <li class="mb-2">
                                    <i class="bi bi-check text-primary"></i>
                                    ${account.name}
                                </li>
                                <li class="mb-2">
                                    <i class="bi bi-check text-primary"></i>
                                    <strong>계좌번호</strong>
                                </li>
                                <li class="mb-2">
                                    <i class="bi bi-check text-primary"></i>
                                    ${account.account_num}
                                </li>
                            </ul>
                            <div class="d-grid">
                                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/account/${account.account_num}">거래 내역</a>
                                <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/close/${account.account_num}">계좌 해지</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- 계좌 정보 카드 반복 끝 -->
        </div>
    </div>
    <section class="py-5 border-bottom" id="features">
            <div class="container px-5 my-5">
                <div class="row gx-5">
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-star"></i></div>
                        <h2 class="h4 fw-bolder">내 적금 계좌</h2>
                        <p>내 적금 계좌 확인하기</p>
                        <a class="text-decoration-none" href="${ pageContext.request.contextPath }/savigsaccounts">
                            여기를 클릭!!
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </section>
</section>
<footer class="py-5 bg-dark">
            <div class="container px-5"><p class="m-0 text-center text-white">&copy; 2024 Bank. All rights reserved.</p></div>
        </footer>
</body>
</html>
