package kr.ac.kopo.account.dao;

import kr.ac.kopo.account.vo.AccountVO;

public interface AccountDAO {
    void accountRegister(AccountVO account) throws Exception; 
    AccountVO findAccountByNumber(String accountNum) throws Exception; 
    void updateAccount(AccountVO account) throws Exception; 
    void deposit(String accountNum, int amount) throws Exception;
}
