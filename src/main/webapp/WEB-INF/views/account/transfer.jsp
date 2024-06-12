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
<script>
    // transfer.js (or wherever your JavaScript code resides)

    function checkAccountPassword(accountNum, accountPassword) {
        fetch('${pageContext.request.contextPath}/checkAccountPassword', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ accountNum: accountNum, accountPassword: accountPassword })
        })
        .then(response => response.json())
        .then(data => {
            if (data.valid) {
                // 계좌 비밀번호 일치 시 이체 처리
                // 이 곳에 이체 처리 로직 추가
            } else {
                // 계좌 비밀번호 불일치 시 처리
                alert('보내는 계좌의 비밀번호가 일치하지 않습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }

    // 이체 버튼 클릭 이벤트 핸들러
    document.getElementById('transferButton').addEventListener('click', function() {
        var fromAccount = document.getElementById('from_Account').value;
        var toAccount = document.getElementById('to_Account').value;
        var amount = document.getElementById('amount').value;
        var depositorName = document.getElementById('depositorName').value;
        var fromAccountPassword = document.getElementById('from_Account_Password').value;

        // 보내는 계좌의 비밀번호 확인
        checkAccountPassword(fromAccount, fromAccountPassword);
    });
</script>

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
        
        <label for="fromAccountPassword">보내는 계좌 비밀번호:</label>
		<input type="password" id="from_Account_Password" name="from_Account_Password" required><br><br>
        
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
