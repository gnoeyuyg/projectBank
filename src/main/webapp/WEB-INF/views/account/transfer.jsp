<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.member.vo.MemberVO" %>
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
<html>
<head>
<meta charset="UTF-8">
<title>계좌 이체</title>
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
  <aside class="side-bar">
  <section class="side-bar__icon-box">
    <section class="side-bar__icon-1">
      <div></div>
      <div></div>
      <div></div>
    </section>
  </section>
  <ul>
    <li>
      <a href="${ pageContext.request.contextPath }/deposit"><i class="fa-solid fa-cat"></i>입금</a>
    </li>
    <li>
      <a href="#">출금</a>
    </li>
  </ul>
</aside>

    <h2>계좌 이체</h2>

    <%-- 계좌 이체 양식 --%>
    <form action="${pageContext.request.contextPath}/transfer" method="post" enctype="application/x-www-form-urlencoded">
        <label for="fromAccount">보내는 계좌:</label>
        <input type="text" id="from_Account" name="from_Account" required><br><br>
        
        <label for="toAccount">받는 계좌:</label>
        <input type="text" id="to_Account" name="to_Account" required><br><br>
        
        <label for="amount">이체 금액:</label>
        <input type="number" id="amount" name="amount" required><br><br>
        
        <label for="depositor_name">입금자명:</label>
        <input type="text" id="depositorName" name="depositorName" required><br><br>
        <button type="submit">이체</button>
    </form>
</body>
</html>
