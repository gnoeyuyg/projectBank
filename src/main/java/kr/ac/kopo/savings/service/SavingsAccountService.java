package kr.ac.kopo.savings.service;

import kr.ac.kopo.savings.vo.SavingsAccountVO;

public interface SavingsAccountService {
    void applyInterest();

	SavingsAccountVO savingsAccountRegister(SavingsAccountVO savingsAccount);

	boolean savingsDeposit(String savingsAccountNum, int amount);
}
