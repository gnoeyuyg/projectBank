package kr.ac.kopo.savings.dao;

import kr.ac.kopo.savings.vo.SavingsAccountVO;
import java.util.List;

public interface SavingsAccountDAO {
    void savingsAccountRegister(SavingsAccountVO savingsAccount) throws Exception;
    void savingsDeposit(String savingsAccountNum, int amount) throws Exception;
    SavingsAccountVO findSavingsAccountByNumber(String savingsAccountNum) throws Exception;
    List<SavingsAccountVO> findAllSavingsAccounts() throws Exception;

    // 적금 상품 CRUD 메소드
    void createSavings(SavingsAccountVO account) throws Exception;
    SavingsAccountVO readSavings(String savingsAccountNum) throws Exception;
    void updateSavingsAccount(SavingsAccountVO savingsAccount)throws Exception;
    void deleteSavings(String depositType) throws Exception;
    
    // 적금 계좌에 이자율을 적용하여 잔액을 업데이트하는 메소드
    void applyInterest(SavingsAccountVO account) throws Exception;

    // 적금 금액 실행 쿼리
    void updateAllSavingsAccounts() throws Exception;

    // 추가 메소드
    int getProductNumber(String depositType) throws Exception;
    boolean isAccountNumberExists(String accountNumber) throws Exception;
    List<String> getAllDepositTypes() throws Exception;
}
