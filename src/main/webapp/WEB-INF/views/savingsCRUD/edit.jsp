<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

    <meta charset="UTF-8">
    <title>적금 상품 수정</title>
</head>
<body>
    <h1>적금 상품 수정</h1>
    <form:form modelAttribute="savingsAccount" method="post" action="${pageContext.request.contextPath}/savingsCRUD/edit">
        <table>
            <tr>
                <td>상품명:</td>
                <td><form:input path="deposit_type" /></td>
            </tr>
            <tr>
                <td>이자율:</td>
                <td><form:input path="interest_rate" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="수정" /></td>
            </tr>
        </table>
    </form:form>
    <c:if test="${editSuccess}">
        <p>적금 상품이 성공적으로 수정되었습니다.</p>
    </c:if>
    <c:if test="${editFailure}">
        <p>적금 상품 수정에 실패했습니다. 다시 시도해주세요.</p>
    </c:if>
</body>
</html>
