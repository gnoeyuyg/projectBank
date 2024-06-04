package kr.ac.kopo.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDAO accountDao;

    @Override
    public AccountVO accountRegister(AccountVO account) {
        try {
            accountDao.accountRegister(account);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }

    @Override
    public boolean deposit(String accountNum, int amount) {
        try {
            accountDao.deposit(accountNum, amount);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
