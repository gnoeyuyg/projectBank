package kr.ac.kopo.savings.dao;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.savings.vo.SavingsAccountVO;
import kr.ac.kopo.transactiondetail.vo.TransactionDetailVO;

public interface SavingsAccountDAO {
    List<SavingsAccountVO> findAllSavingsAccounts() throws Exception;
    void savingsAccountRegister(SavingsAccountVO savingsAccount) throws Exception;
    void savingsDeposit(String savingsAccountNum, int amount) throws Exception;
    void createSavings(SavingsAccountVO account) throws Exception;
    SavingsAccountVO readSavings(String savingsAccountNum) throws Exception;
    void updateSavingsAccount(SavingsAccountVO account) throws Exception;
    void deleteSavings(String depositType) throws Exception;
    void applyInterest(SavingsAccountVO account) throws Exception;
    SavingsAccountVO findSavingsAccountByNumber(String savingsAccountNum) throws Exception;
    int getProductNumber(String depositType) throws Exception;
    boolean isAccountNumberExists(String accountNumber) throws Exception;
    List<String> getAllDepositTypes() throws Exception;
    void updateAllSavingsAccounts() throws Exception;
    List<SavingsAccountVO> getAccountsByCustomerId(String customerId);
    SavingsAccountVO getAccountById(String accountId);
    List<TransactionDetailVO> getTransactionsByAccountId(String accountId);
    int countBySavingsAccountNumber(String accountNumber);
    SavingsAccountVO findByAccountNum(String accountNum);
    SavingsAccountVO getAccountById2(String accountId);
    void deleteAccount(String accountId);
    void insertTransactionHistory(TransactionDetailVO transactionHistory);
    void updateAccountBalance(String targetAccountId, int amount);
    boolean transfer(String fromAccountNum, String toAccountNum, double amount) throws Exception;
    void saveTransaction(TransactionDetailVO transaction) throws Exception;
    void delete(String savingsAccountNum) throws Exception;
    int checkPassword(Map<String, Object> params) throws Exception;
}

