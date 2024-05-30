<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
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
		<strong>2024년 서버구축실습중...</strong>
	</footer>
</body>
</html>
