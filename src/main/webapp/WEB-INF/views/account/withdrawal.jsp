<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>출금</title>
</head>
<body>
    <h1>출금</h1>
    <form action="${ pageContext.request.contextPath }/withdrawal" method="post">
        <label for="accountId">출금할 계좌 번호:</label>
        <input type="text" id="accountId" name="accountId" required><br>

        <label for="password">계좌 비밀 번호:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="amount">출금할 금액:</label>
        <input type="number" id="amount" name="amount" required><br>

        <input type="submit" value="Withdraw">
    </form>
    
    <c:if test="${not empty successMessage}">
        <p style="color:green;">${successMessage}</p>
    </c:if>
    
    <c:if test="${not empty errorMessage}">
        <p style="color:red;">${errorMessage}</p>
    </c:if>
</body>
</html>
