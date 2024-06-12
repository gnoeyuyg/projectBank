<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script>
        // 비밀번호 유효성을 검사하는 함수
        async function checkPasswordValidity(password) {
            try {
                const response = await fetch('${pageContext.request.contextPath}/checkPassword', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ password: password })
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

        // 페이지가 로드되면 비밀번호 입력 필드에 이벤트 리스너를 추가
        document.addEventListener('DOMContentLoaded', () => {
            const passwordInput = document.getElementById('password');
            passwordInput.addEventListener('input', () => {
                const password = passwordInput.value;
                if (password.length >= 8 && password.length <= 15) {
                    checkPasswordValidity(password);
                } else {
                    document.getElementById('passwordMessage').textContent = '비밀번호는 8글자에서 15글자로 입력해주세요.';
                    document.getElementById('passwordMessage').style.color = 'red';
                }
            });
        });

        function validatePassword() {
            var passwordInput = document.getElementById("password");
            var password = passwordInput.value;
            var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;

            if (!passwordRegex.test(password)) {
                alert("비밀번호는 영문자, 숫자, 특수 문자의 조합으로 8글자에서 15글자로 입력해주세요.");
                passwordInput.value = "";
                passwordInput.focus();
                return false;
            }
            return true;
        }

        function validateId() {
            var idInput = document.getElementById("customer_id");
            var id = idInput.value;
            var idRegex = /^[a-zA-Z0-9]+$/;

            if (!idRegex.test(id)) {
                alert("아이디는 영문자와 숫자로만 입력해주세요.");
                idInput.value = "";
                idInput.focus();
                return false;
            }
            return true;
        }

        function validateName() {
            var nameInput = document.getElementById("customer_name");
            var name = nameInput.value;
            var nameRegex = /^[가-힣]+$/;

            if (!nameRegex.test(name)) {
                alert("이름은 한글로만 입력해주세요.");
                nameInput.value = "";
                nameInput.focus();
                return false;
            }
            return true;
        }

        function validatePhone() {
            var phoneInput = document.getElementById("phone_number");
            var phone = phoneInput.value;
            var phoneRegex = /^010-\d{4}-\d{4}$/;

            if (!phoneRegex.test(phone)) {
                alert("연락처는 010-숫자4자리-숫자4자리 형식으로 입력해주세요.");
                phoneInput.value = "";
                phoneInput.focus();
                return false;
            }
            return true;
        }

        function validateEmail() {
            var emailInput = document.getElementById("email");
            var email = emailInput.value;
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailRegex.test(email)) {
                alert("유효한 이메일 주소를 입력하세요.");
                emailInput.value = "";
                emailInput.focus();
                return false;
            }
            return true;
        }

        function validateForm() {
            return validateId() && validatePassword() && validateName() && validatePhone() && validateEmail();
        }

        async function checkDuplicate() {
            const customerId = document.getElementById('customer_id').value;
            try {
                const response = await fetch('${pageContext.request.contextPath}/checkDuplicateId', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ customer_id: customerId })
                });
                const result = await response.json();
                if (result.isDuplicate) {
                    alert('아이디가 중복됩니다. 다른 아이디를 입력해주세요.');
                    document.getElementById('customer_id').focus();
                } else {
                    alert('사용 가능한 아이디입니다.');
                }
            } catch (error) {
                console.error('Error:', error);
            }
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="#!">JW은행</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="home">메인페이지</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="mypage">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="myaccount.jsp">내 계좌</a></li>
                <li class="nav-item"><a class="nav-link" href="account.jsp">계좌 개설</a></li>
                <li class="nav-item"><a class="nav-link" href="savings.jsp">적금</a></li>
                <li class="nav-item"><a class="nav-link" href="loans.jsp">대출</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <h2>회원가입</h2>
    <% if (request.getAttribute("signupSuccess") != null) { %>
        <p style="color: green;">회원가입 성공!</p>
    <% } else if (request.getAttribute("signupFailure") != null) { %>
        <p style="color: red;">회원가입 실패!</p>
    <% } %>
    <form action="${pageContext.request.contextPath}/signup" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="customer_id">아이디</label>
            <input type="text" id="customer_id" name="customer_id" required pattern="[a-zA-Z0-9]+" title="아이디는 영문자와 숫자로만 입력해주세요.">
            <button type="button" onclick="checkDuplicate()">중복 체크</button>
        </div>
        <div class="form-group">
            <label for="password">패스워드</label>
            <input type="password" id="password" name="password" required pattern="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$" title="비밀번호는 영문자, 숫자, 특수 문자의 조합으로 8글자에서 15글자로 입력해주세요.">
            <span id="passwordMessage" style="color: red;"></span>
        </div>
        <div class="form-group">
            <label for="customer_name">이름</label>
            <input type="text" id="customer_name" name="customer_name" required pattern="[가-힣]+" title="이름은 한글로만 입력해주세요.">
        </div>
        <div class="form-group">
            <label for="phone_number">연락처</label>
            <input type="text" id="phone_number" name="phone_number" required pattern="010-\d{4}-\d{4}" title="연락처는 010-숫자4자리-숫자4자리 형식으로 입력해주세요.">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="address">주소</label>
            <input type="text" id="address" name="address" pattern=".*\S.*">
        </div>
        <button type="submit">가입하기</button>
    </form>
</div>
</body>
</html>
