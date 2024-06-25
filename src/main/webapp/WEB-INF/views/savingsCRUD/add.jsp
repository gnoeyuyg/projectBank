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
    <title>적금 상품 추가</title>
    <script>
        function validateProductNumber() {
            var productNumber = document.getElementById("product_number").value;
            var productNumberMessage = document.getElementById("productNumberMessage");

            if (/^\d{2}$/.test(productNumber)) {
                productNumberMessage.textContent = "유효한 상품 코드입니다.";
                productNumberMessage.style.color = "green";
                return true;
            } else {
                productNumberMessage.textContent = "상품 코드는 숫자 2자리여야 합니다.";
                productNumberMessage.style.color = "red";
                return false;
            }
        }

        function validateForm() {
            return validateProductNumber();
        }

        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById("product_number").addEventListener("input", validateProductNumber);
        });
    </script>
</head>
<body>
    <h1>적금 상품 추가</h1>
    <form:form modelAttribute="savingsAccount" method="post" onsubmit="return validateForm()">
        <table>
            <tr>
                <td>적금 종류:</td>
                <td><form:input path="deposit_type" /></td>
            </tr>
            <tr>
                <td>이자율:</td>
                <td><form:input path="interest_rate" /></td>
            </tr>
            <tr>
                <td>상품코드:</td>
                <td>
                    <form:input path="product_number" id="product_number" />
                    <span id="productNumberMessage" style="color:red;"></span>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="추가" /></td>
            </tr>
        </table>
    </form:form>
    <c:if test="${addSuccess}">
        <p>적금 상품이 성공적으로 추가되었습니다.</p>
    </c:if>
    <c:if test="${addFailure}">
        <p>적금 상품 추가에 실패했습니다. 다시 시도해주세요.</p>
    </c:if>
</body>
</html>
