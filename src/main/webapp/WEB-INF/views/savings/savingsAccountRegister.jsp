<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.member.vo.MemberVO" %>
<%@ page import="kr.ac.kopo.account.dao.RandomAccountNumberGenerator" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // 로그인 여부 확인
    MemberVO userVO = (MemberVO) session.getAttribute("userVO");
    String customerId = null;
    if (userVO != null) {
        customerId = userVO.getCustomer_id();
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>적금 가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="${ pageContext.request.contextPath }/">JW은행</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/">메인페이지</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="mypage">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="myaccount.jsp">내 계좌</a></li>
                        <li class="nav-item"><a class="nav-link" href="account.jsp">계좌 개설</a></li>
                        <li class="nav-item"><a class="nav-link" href="savings.jsp">적금</a></li>
                        <li class="nav-item"><a class="nav-link" href="loans.jsp">대출</a></li>
                    </ul>
                </div>
            </div>
     </nav>
    <h2>적금 가입</h2>
     <% if (request.getAttribute("registerSuccess") != null) { %>
    <p style="color: green;">상품 가입이 완료되었습니다.</p>
		<% } else if (request.getAttribute("registerFailure") != null) { %>
    <p style="color: red;">상품 가입에 실패하였습니다.</p>
		<% } %>

    <form action="${pageContext.request.contextPath}/savingsAccountRegister" method="post">
        <div>
    		<label for="savings_account_num">계좌 번호:</label>
    		<input type="text" id="savings_account_num" name="savings_account_num" value="<%= kr.ac.kopo.account.dao.RandomAccountNumberGenerator.generateRandomAccountNumber() %>" required readonly>
		</div>

        <div>
		    <label for="customer_id">고객 ID:</label>
		    <!-- 세션에서 가져온 고객 ID를 입력 필드에 자동으로 채워넣기 -->
		    <input type="text" id="customer_id" name="customer_id" value="<%= customerId %>" required readonly>
		</div>

        <div>
            <label for="account_holder">계좌명:</label>
            <!-- 계좌명 입력 필드를 비활성화 -->
            <input type="text" id="account_holder" name="account_holder">
        </div>
        <div>
            <label for="savings_account_password">계좌 비밀번호:</label> 
			<input type="password" id="savings_account_password" name="savings_account_password" required pattern="[0-9]{6}" title="숫자 6자리로 입력해주세요."> [6자리 숫자]
        </div>
        <div>
            <label for="deposit_type">상품 종류:</label> 
			<input type="text" id="deposit_type" name="deposit_type">
        </div>
        <div>
            <label for="amount">적금양:</label> 
			<input type="number" id="amount" name="amount" required pattern="[0-9]" title="10억 미만의 수">
        </div>
        <button type="submit">등록</button>
    </form>
</body>
</html>
