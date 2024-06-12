package kr.ac.kopo.savings.dao;

import kr.ac.kopo.savings.vo.SavingsAccountVO;
import java.util.List;

public interface SavingsAccountDAO {
	void savingsAccountRegister(SavingsAccountVO savingsAccount) throws Exception; 
    void savingsDeposit(String savingsAccountNum, int amount) throws Exception; 
    SavingsAccountVO findSavingsAccountByNumber(String savingsAccountNum) throws Exception;
    
    List<SavingsAccountVO> findAllSavingsAccounts() throws Exception;
    void updateSavingsAccount(SavingsAccountVO account) throws Exception;
    
}
