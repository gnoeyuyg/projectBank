<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String memberId = (String) session.getAttribute("memberId");%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/CSS/home.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="${ pageContext.request.contextPath }/">JW은행</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
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
     <div class="container my-5">
    <h2>마이페이지</h2>
    <table class="table table-bordered">
        <tr>
            <th>아이디</th>
            <td>${member.customer_id}</td>
        </tr>
        <tr>
            <th>이름</th>
            <td>${member.customer_name}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${member.email}</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${member.phone_number}</td>
        </tr>
        <tr>
            <th>주소</th>
            <td>${member.address}</td>
        </tr>
    </table>
    <a href="${ pageContext.request.contextPath }/member/update" class="btn btn-primary">수정하기</a>
    <a href="${ pageContext.request.contextPath }/deleteAccount" class="btn btn-primary">회원탈퇴하기</a>
</div>
     

</body>
</html>