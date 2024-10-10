<h1>프로젝트 소개 : 스프링 기반으로 은행 기능을 구현해 웹으로 호스팅</h1>

<b>작업 기간	: 2024/05/01 ~ 2024/07/01</b>

<b>인력 구성	: Back-End 2명</b>

<b>프로젝트 목적 :	스프링 기반의 웹 서비스로 은행의 기본적인 기능을 구현해 실제 이용자에게 제공하는 것이 목표.</b>

<b>주요업무 및 상세역할	</b>
  - 은행 프로그램을 개발
  - 회원가입부터 계좌 개설, 이체 및 입출금, 상품 기능, 관리자 기능 전반을 담당
  - 오라클의 테이블을 구성 

<b>사용언어 및 개발환경</b>
  - JAVA, JavaScript, HTML, CSS, ORACLE, Spring, JQuery, MyBatis
    
<b>느낀 점</b>
  - 기간을 정해두고 프로젝트를 진행하며 관리하는 방법을 배움
  - 파트 별로 역할 분담의 중요성을 깨달음 ( git 형상관리)
  - 변수 명 등 프로젝트 진행에 합의를 하고 시작하는 방법을 배움

<b>개요 및 목적</b>
  - 실제 은행 프로그램을 만들어보기 위해 Spring 프레임워크를 기반으로 제작. 
  - 데이터베이스를 구현하기 위해 ORACLE 사용
  - MVC 패턴을 적용시켜 실제 웹에서 동작하도록 구현
  - 은행의 기본적인 모든 기능을 사용하도록 기능을 구현 (이체, 계좌 개설, 상품 가입 등)

<b>ERD</b>	 
![ERD](https://github.com/user-attachments/assets/ceac1875-3f57-4f6c-a602-7e593736be1b)

<h3>실행 흐름도</h3>

1.초기 입금 처리
  - 입금, 출금, 이체 등의 거래 발생
  - 거래 내역 테이블에 거래 내역 기록
  - 계좌 테이블의 해당 계좌 잔액 업데이트
  - 계좌출금 및 이체 시 Transaction 처리
2.계좌 개설
  - 고객이 계좌 개설 요청
  - 계좌 유형 선택 (예: 보통예금, 당좌예금)
  - 계좌 테이블에 새 계좌 정보 생성
  - 일정한 양식으로 계좌 번호 생성 및 중복 방지
3.적금 상품 가입
  - 고객이 적금 상품 선택
  - 적금 테이블에 새 적금 계좌 정보 생성
  - 자동이체 설정 (선택적)
4.정기 업무
  - 이자 계산 및 지급 (적금, 예금)
  - 대출 이자 정산
5.상품 관리
  - 관리자가 처리 및 응대
6.고객 등록
  - 온라인으로 계정 생성 요청
  - 고객 정보 입력 (이름, 주소, 전화번호, 이메일, 주민번호 등)
  - 고객 테이블에 정보 저장

<b>기대 효과 및 보완점</b>
  - 현재는 하나의 서버, 하나의 데이터베이스만 구축 되어있다. 또한 아직 같은 네트워크 망 내에서만 사용이 가능하다. 외부 접속으로 모두가 이용 가능하게 만드는 것이 목표이기 때문에 AWS나 쿠버네티스 같은 클라우드 환경에 구축 할 것이다. 또한 구현한 기능은 기본이 되는 기능만 구현했기 때문에 점차 어디서나 이용 가능한 실제 은행을 만들어야 한다.
