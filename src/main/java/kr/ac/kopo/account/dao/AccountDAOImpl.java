package kr.ac.kopo.account.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.account.vo.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public void accountRegister(AccountVO account) throws Exception {
        sqlSession.insert("dao.AccountDAO.accountRegister", account);
    }

    @Override
    public AccountVO findAccountByNumber(String accountNum) throws Exception {
        return sqlSession.selectOne("dao.AccountDAO.findAccountByNumber", accountNum);
    }

    @Override
    public void updateAccount(AccountVO account) throws Exception {
        sqlSession.update("dao.AccountDAO.updateAccount", account);
    }

    @Override
    public void deposit(String accountNum, int amount) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("account_num", accountNum);
        params.put("amount", amount);
        sqlSession.update("dao.AccountDAO.deposit", params);
    }
}
