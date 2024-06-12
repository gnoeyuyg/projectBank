package kr.ac.kopo.savings.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.ac.kopo.savings.dao.SavingsAccountDAO;
import kr.ac.kopo.savings.vo.SavingsAccountVO;

import java.util.List;

@Service
public class SavingsAccountServiceImpl implements SavingsAccountService {

    @Autowired
    private SavingsAccountDAO savingsAccountDAO;

    // 한달마다
    @Scheduled(cron = "0 0 0 1 * ?")
    @Transactional
    @Override
    public void applyInterest() {
        try {
            List<SavingsAccountVO> savingsAccounts = savingsAccountDAO.findAllSavingsAccounts();
            for (SavingsAccountVO account : savingsAccounts) {
                double newBalance = calculateNewBalance(account);
                account.setAmount(newBalance);
                savingsAccountDAO.updateSavingsAccount(account);
            }
        } catch (Exception e) {
            // 예외 처리: 롤백
            throw new RuntimeException("적금 계좌 이자 적용 중 오류 발생: " + e.getMessage(), e);
        }
    }

    private double calculateNewBalance(SavingsAccountVO account) {
        double dailyInterestRate = account.getInterest_rate() / 365;
        return account.getAmount() * (1 + dailyInterestRate);
    }
    @Override
    public SavingsAccountVO savingsAccountRegister(SavingsAccountVO savingsAccount) {
        try {
        	savingsAccountDAO.savingsAccountRegister(savingsAccount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return savingsAccount;
    }

    @Override
    public boolean savingsDeposit(String savingsAccountNum, int amount) {
        try {
        	savingsAccountDAO.savingsDeposit(savingsAccountNum, amount);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
