package kr.ac.kopo.account.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.transactiondetail.service.TransactionDetailService;
import kr.ac.kopo.transactiondetail.vo.TransactionDetailVO;

@Service
public class AccountServiceImpl implements AccountService {
	
    @Autowired
    private AccountDAO accountDao;
    
    @Autowired
    private TransactionDetailService transactionDetailService;
	
    @Override
    public AccountVO accountRegister(AccountVO account) {
        try {
            accountDao.accountRegister(account);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }

    @Transactional
    @Override
    public boolean deposit(String accountNum, int amount) {
        try {
            AccountVO account = accountDao.findById(accountNum);
            accountDao.deposit(accountNum, amount);
            
            TransactionDetailVO transaction = new TransactionDetailVO();
            transaction.setAccountNum(accountNum);
            transaction.setAmount(amount);
            transaction.setTransactionDate(new Date());
            transaction.setDepositorName(account.getCustomer_id());
            transaction.setToAccount(accountNum);
            transactionDetailService.recordTransaction(transaction);
            
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Transactional
    @Override
    public boolean withdraw(String accountId, String password, int amount) {
        AccountVO account = accountDao.findById(accountId);
        if (account != null && account.getAccount_password().equals(password) && account.getAccount_money() >= amount) {
            account.setAccount_money(account.getAccount_money() - amount);
            accountDao.update(account);
            
            TransactionDetailVO transaction = new TransactionDetailVO();
            transaction.setAccountNum(accountId);
            transaction.setAmount(-amount);
            transaction.setTransactionDate(new Date());
            transaction.setDepositorName(account.getCustomer_id());
            transaction.setFromAccount(accountId);
            transactionDetailService.recordTransaction(transaction);
            
            return true;
        }
        return false;
    }

    @Override
    public List<AccountVO> getAllAccounts() {
        return accountDao.getAllAccounts();
    }

    @Override
    public AccountVO getAccountById(String accountId) {
        return accountDao.getAccountById(accountId);
    }

    @Override
    public List<TransactionDetailVO> getTransactionsByAccountId(String accountId) {
        return accountDao.getTransactionsByAccountId(accountId);
    }

    @Override
    public List<AccountVO> getAccountsByCustomerId(String customer_id) throws Exception {
        return accountDao.getAccountsByCustomerId(customer_id);
    }

 
}
