package kr.ac.kopo.account.dao;

import java.util.List;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.transactiondetail.vo.TransactionDetailVO;

public interface AccountDAO {
    // 계좌 등록
    void accountRegister(AccountVO account) throws Exception;
    
    // 계좌 번호로 계좌 조회
    AccountVO findAccountByNumber(String accountNum) throws Exception; 
    
    // 계좌 업데이트
    void updateAccount(AccountVO account) throws Exception; 
    
    // 입금
    void deposit(String accountNum, int amount) throws Exception;
    
    // ID로 계좌 조회
    AccountVO findById(String accountId);
    
    // 계좌 업데이트
    void update(AccountVO account);
    
    // 모든 계좌 조회
    List<AccountVO> getAllAccounts();
    
    // ID로 계좌 조회
    AccountVO getAccountById(String accountId);
    
    // 계좌 ID로 거래 내역 조회
    List<TransactionDetailVO> getTransactionsByAccountId(String accountId);
    
    // 고객 ID로 계좌 조회
    List<AccountVO> getAccountsByCustomerId(String customer_id);

}
