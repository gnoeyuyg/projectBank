<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>계좌 개설 성공</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script>
        function goHome() {
            window.location.href = "${pageContext.request.contextPath}/";
        }
    </script>
</head>
<body>
    <h2>계좌 개설 성공</h2>
    <p>계좌 번호: ${accountNumber}</p>
    <button onclick="goHome()">확인</button>
</body>
</html>
