<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

<meta charset="UTF-8">
<title>Manager Login</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/table.css">
<script>
    function checkForm() {
        var customer_id = document.getElementById("id").value;
        var password = document.getElementById("password").value;

        if (customer_id.trim() === '') {
            alert('아이디를 입력하세요.');
            return false;
        }

        if (password.trim() === '') {
            alert('비밀번호를 입력하세요.');
            return false;
        }

        return true;
    }
</script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="${ pageContext.request.contextPath }/">JW은행</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">메인페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/mypage">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/accounts">내 계좌</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/transfer">계좌이체</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/accountRegister">계좌 개설</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/savingsAccountRegister">적금</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/loan/apply">대출</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <section>
        <div align="center">
            <hr>
            <h2>로그인</h2>
            <hr>
            <br>
            <form:form modelAttribute="M" method="post" onsubmit="return checkForm()" name="managerloginForm">
                <table border="1">
                    <tr>
                        <th>아이디</th>
                        <td><form:input type="text" id="id" path="id"/></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><form:input type="password" id="password" path="password"/></td>
                    </tr>
                </table>
                <br>
                <input type="submit" value="관리자로그인">
            </form:form>
        </div>
    </section>

    <footer>

    </footer>
</body>
</html>
