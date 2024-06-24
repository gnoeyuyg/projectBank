<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>거래내역</title>
</head>
<body>
    <h1>거래내역</h1>
    <h2>계좌 정보</h2>
    <table border="1">
        <tr>
            <th>계좌번호</th>
            <td>${account.account_num}</td>
        </tr>
        <tr>
            <th>예금주</th>
            <td>${account.name}</td>
        </tr>
        <tr>
            <th>잔액</th>
            <td>${account.account_money}</td>
        </tr>
    </table>
    
    <h2>거래내역</h2>
    <table border="1">
        <thead>
            <tr>
                <th>거래번호</th>
                <th>날짜</th>
                <th>거래금액</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="transaction" items="${transactions}">
                <tr>
                    <td>${transaction.transactionId}</td>
                    <td>${transaction.transactionDate}</td>
                    <td>${transaction.amount}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
