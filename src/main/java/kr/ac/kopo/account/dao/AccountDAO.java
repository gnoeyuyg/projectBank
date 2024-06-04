package kr.ac.kopo.account.dao;

import kr.ac.kopo.account.vo.AccountVO;

public interface AccountDAO {
    void accountRegister(AccountVO account) throws Exception; // 계좌개설 메소드
    AccountVO findAccountByNumber(String accountNum) throws Exception; // 계좌번호로 등록된 계좌 찾기
    void updateAccount(AccountVO account) throws Exception; // 계좌 업데이트 메소드
    void deposit(String accountNum, int amount) throws Exception; // 입금 메소드
}
