<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="kr.ac.kopo.member.vo.MemberVO" %>

<%
    // 로그인 여부 확인
    MemberVO userVO = (MemberVO) session.getAttribute("userVO");
    String customerId = null;
    if (userVO != null) {
        customerId = userVO.getCustomer_id();
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>적금 가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script>
        // 비밀번호 유효성을 검사하는 함수
        async function checkSavingsPasswordValidity(savingsPassword) {
            try {
                const response = await fetch('${pageContext.request.contextPath}/checkSavingsPassword', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ savingsPassword: savingsPassword })
                });
                const result = await response.json();
                if (result.valid) {
                    document.getElementById('passwordMessage').textContent = '비밀번호가 유효합니다.';
                    document.getElementById('passwordMessage').style.color = 'green';
                } else {
                    document.getElementById('passwordMessage').textContent = '비밀번호가 유효하지 않습니다.';
                    document.getElementById('passwordMessage').style.color = 'red';
                }
            } catch (error) {
                console.error('Error:', error);
            }
        }

        // 비밀번호 입력 필드에 이벤트 리스너 추가
        document.addEventListener('DOMContentLoaded', () => {
            const passwordInput = document.getElementById('savings_account_password');
            passwordInput.addEventListener('input', () => {
                const savingsPassword = passwordInput.value;
                if (savingsPassword.length === 6) {
                    checkSavingsPasswordValidity(savingsPassword);
                } else {
                    document.getElementById('passwordMessage').textContent = '숫자 6자리로 입력해주세요.';
                    document.getElementById('passwordMessage').style.color = 'red';
                }
            });

            // 최초 적금양 초기값 설정
            document.getElementById('amount').value = 10000;

            // deposit_type 변경 시 product_number 값을 설정
            document.getElementById('deposit_type').addEventListener('change', function() {
                setProductNumber(this.value);
            });
        });

        function setProductNumber(depositType) {
            var productNumber = 0;

            if (depositType === '청년적금') {
                productNumber = 1;
            } else if (depositType === '희망적금') {
                productNumber = 2;
            } else if (depositType === 'TYPE3') {
                productNumber = 3;
            }

            document.getElementById('product_number').value = productNumber;
        }

        // 약관 동의 체크 확인
        function validateForm() {
            const termsCheckbox = document.getElementById('terms');
            if (!termsCheckbox.checked) {
                alert('약관에 동의하셔야 적금 가입이 가능합니다.');
                return false;
            }
            // 비밀번호 확인 체크
            const password = document.getElementById('savings_account_password').value;
            const confirmPassword = document.getElementById('confirm_password').value;
            if (password !== confirmPassword) {
                alert('비밀번호가 일치하지 않습니다.');
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
<h2>적금 가입</h2>
<% if (request.getAttribute("registerSuccess") != null) { %>
    <p style="color: green;">상품 가입이 완료되었습니다.</p>
<% } else if (request.getAttribute("registerFailure") != null) { %>
    <p style="color: red;">상품 가입에 실패하였습니다.</p>
<% } %>

<form action="${pageContext.request.contextPath}/savingsAccountRegister" method="post" onsubmit="return validateForm()">
    <div>
        <label for="deposit_type">적금 유형:</label>
        <select id="deposit_type" name="depositType" required>
            <c:forEach var="depositType" items="${depositTypes}">
                <option value="${depositType}">${depositType}</option>
            </c:forEach>
        </select>
    </div>

    <input type="hidden" id="product_number" name="product_number" value="1" />

    <div>
        <label for="customer_id">고객 ID:</label>
        <input type="text" id="customer_id" name="customer_id" value="<%= customerId %>" required readonly>
    </div>
   
    <div>
        <label for="savings_account_password">계좌 비밀번호:</label> 
        <input type="password" id="savings_account_password" name="savings_account_password" required pattern="[0-9]{6}" title="숫자 6자리로 입력해주세요."> [6자리 숫자]
        <span id="passwordMessage" style="color: red;"></span>
    </div>
    <div>
        <label for="confirm_password">비밀번호 확인:</label> 
        <input type="password" id="confirm_password" name="confirm_password" required pattern="[0-9]{6}" title="숫자 6자리로 입력해주세요."> [6자리 숫자]
    </div>
    <div>
        <label for="amount">최초 적금양:</label> 
		<input type="number" id="amount" name="amount" value="10000" required pattern="[0-9]" title="10억 미만의 수">
    </div>
    <div>
        <h3>약관 동의</h3>
        <textarea id="termsText" rows="10" cols="50" readonly>
1. 본인은 본 적금 상품의 가입 조건 및 이자율에 대해 충분히 설명을 받았으며, 이에 동의합니다.
2. 본인은 정기적으로 월 납입 금액을 예치할 것이며, 이를 이행하지 않을 경우 발생할 수 있는 불이익에 대해 충분히 이해합니다.
3. 본인은 적금 기간 중 중도 해지 시 발생할 수 있는 손실 및 이자 혜택의 상실에 대해 이해하고 동의합니다.
4. 본인은 본인의 개인정보가 적금 계좌 관리 및 관련 서비스 제공을 위해 사용될 수 있음에 동의합니다.
5. 본인은 적금 만기일 이전에 금융 기관의 통지 없이 조건을 변경할 수 없음을 이해합니다.
6. 본인은 본 적금 상품에 관련된 모든 약관 및 조건을 확인하고 이에 동의합니다.
7. 본인은 위의 모든 사항을 읽고 이해한 후, 이에 동의하여 적금 상품에 가입합니다.
        </textarea>
        <br>
    </div>
    
    <div>
        <input type="checkbox" id="terms" name="terms">
        <label for="terms">약관에 동의합니다.</label><br>
    </div>
    <button type="submit">가입하기</button><br>
</form>
</body>
</html>
