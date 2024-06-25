<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

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
