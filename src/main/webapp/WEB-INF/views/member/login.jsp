<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="${ pageContext.request.contextPath }/"">JW은행</a>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/table.css">
<script>
	let checkForm = function() {
		let f = document.loginForm
		let customer_id = f.customer_id
		let password = f.password
		
		if(customer_id.value === '') {
			alert('ID를 입력해주세요')
			customer_id.focus()
			return false
		}
		
		if(password.value === '') {
			alert('패스워드를 입력해주세요')
			password.focus()
			return false
		}
		return true
	}
</script>
</head>
<body>

	<%-- <header>
		<jsp:include page="../include/topMenu.jsp"/>
	</header> --%>
	<section>
<div align="center">
		<hr>
		<h2>로그인</h2>
		<hr>
		<br>
		<form:form modelAttribute="M" method="post" onsubmit="return checkForm()" name="loginForm">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><form:input type="text" name="customer_id" path="customer_id"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><form:input type="password" name="password" path="password"/></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인">
		</form:form>
	</div>
	</section>
	<footer>

	</footer>
</body>
</html>
