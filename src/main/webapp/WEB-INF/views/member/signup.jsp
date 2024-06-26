<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/home.css">
    
    <script>
    var isIdValid = false;
    var isEmailValid = false;
    var isPhoneValid = false;
    var isSSNValid = false;

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
        var nameInput = document.getElementById("name");
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
            alert("유효하지 않은 번호입니다.");
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

    function validateSSN() {
        var ssnInput = document.getElementById("ssn");
        var ssn = ssnInput.value;
        var ssnRegex = /^\d{6}-\d{7}$/;

        if (!ssnRegex.test(ssn)) {
            alert("유효하지 않은 주민번호입니다.");
            ssnInput.value = "";
            ssnInput.focus();
            return false;
        }
        return true;
    }

    function validateForm() {
        if (!isIdValid || !isEmailValid || !isPhoneValid || !isSSNValid) {
            alert("모든 필드가 유효한지 확인해주세요.");
            return false;
        }
        return validateId() && validatePassword() && validateName() && validatePhone() && validateEmail() && validateSSN();
    }

    function checkDuplicateId(id) {
       fetch('${pageContext.request.contextPath}/checkId/' + id)
       .then((response) => response.json()) 
       .then(function(response) {
          if(response == false) {
               alert('이미 사용중인 아이디입니다');
               isIdValid = false;
          } else {
             alert('사용가능한 아이디입니다');
             isIdValid = true;
          }
       });
    }

    function checkDuplicateEmail(email) {
       fetch('${pageContext.request.contextPath}/checkEmail/' + email)
       .then((response) => response.json()) 
       .then(function(response) {
          if(response == false) {
               alert('이미 사용중인 이메일입니다');
               isEmailValid = false;
          } else {
             alert('사용가능한 이메일입니다');
             isEmailValid = true;
          }
       });
    }

    function checkDuplicatePhone(phone) {
       fetch('${pageContext.request.contextPath}/checkPhone/' + phone)
       .then((response) => response.json()) 
       .then(function(response) {
          if(response == false) {
               alert('이미 사용중인 전화번호입니다');
               isPhoneValid = false;
          } else {
             alert('사용가능한 전화번호입니다');
             isPhoneValid = true;
          }
       });
    }

    function checkDuplicateSSN(ssn) {
       fetch('${pageContext.request.contextPath}/checkSSN/' + ssn)
       .then((response) => response.json()) 
       .then(function(response) {
          if(response == false) {
               alert('이미 사용중인 주민번호입니다');
               isSSNValid = false;
          } else {
             alert('사용가능한 주민번호입니다');
             isSSNValid = true;
          }
       });
    }

    function checkDuplicate(field) {
        var fieldInput = document.getElementById(field);
        var value = fieldInput.value.trim();

        if (value === '') {
            alert(field + "를 입력해주세요.");
            fieldInput.focus();
            return;
        }

        switch (field) {
            case 'customer_id':
                checkDuplicateId(value);
                break;
            case 'email':
                checkDuplicateEmail(value);
                break;
            case 'phone_number':
                checkDuplicatePhone(value);
                break;
            case 'ssn':
                checkDuplicateSSN(value);
                break;
        }
    }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">JW은행</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">메인페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/accounts">내 계좌</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/transfer">계좌이체</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/accountRegister">계좌 개설</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/savingsAccountRegister">적금</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/loan/apply">대출</a></li>
            </ul>
        </div>
    </div>
</nav>
<section class="bg-light py-5">
    <div class="container px-5 my-5 px-5">
        <div class="text-center mb-5">
            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
            <h2 class="fw-bolder">회원가입</h2>
            <p class="lead mb-0">고객님의 정보를 알려주세요!</p>
            <% if (request.getAttribute("signupSuccess") != null) { %>
                <p style="color: green;">회원가입 성공!</p>
            <% } else if (request.getAttribute("signupFailure") != null) { %>
                <p style="color: red;">회원가입 실패!</p>
            <% } %>
        </div>
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-6">
                <form action="${pageContext.request.contextPath}/signup" method="post" onsubmit="return validateForm()" id="contactForm">
                    <div class="form-floating mb-3">
                        <input class="form-control" type="text" id="customer_id" name="customer_id" required pattern="[a-zA-Z0-9]+" title="아이디는 영문자와 숫자로만 입력해주세요." />
                        <button class="btn btn-primary btn-lg" type="button" onclick="checkDuplicate('customer_id')">중복 체크</button>
                        <label for="customer_id">아이디</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="password" id="password" name="password" required pattern="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$" title="비밀번호는 영문자, 숫자, 특수 문자의 조합으로 8글자에서 15글자로 입력해주세요." />
                        <label for="password">비밀번호</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="text" id="customer_name" name="customer_name" required pattern="[가-힣]+" title="이름은 한글로만 입력해주세요." />
                        <label for="name">이름</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="text" id="ssn" name="ssn" required pattern="^\d{6}-\d{7}$" title="하이픈은 포함하여 주민번호 13자리를 입력해주세요!" />
                        <button class="btn btn-primary btn-lg" type="button" onclick="checkDuplicate('ssn')">중복 체크</button>
                        <label for="ssn">주민번호</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="text" id="phone_number" name="phone_number" required pattern="010-\d{4}-\d{4}" title="연락처는 010-숫자4자리-숫자4자리 형식으로 입력해주세요." />
                        <button class="btn btn-primary btn-lg" type="button" onclick="checkDuplicate('phone_number')">중복 체크</button>
                        <label for="phone">전화번호</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="email" id="email" name="email" required />
                        <button class="btn btn-primary btn-lg" type="button" onclick="checkDuplicate('email')">중복 체크</button>
                        <label for="email">이메일</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="text" id="address" name="address" pattern=".*\S.*">
                        <label for="address">주소</label>
                    </div>
                    <div class="d-grid"><button class="btn btn-primary btn-lg" type="submit">가입하기</button></div>
                </form>
            </div>
        </div>
    </div>
</section>
<footer class="py-5 bg-dark">
    <div class="container px-5"><p class="m-0 text-center text-white">&copy; 2024 Bank. All rights reserved.</p></div>
</footer>
</body>
</html>
