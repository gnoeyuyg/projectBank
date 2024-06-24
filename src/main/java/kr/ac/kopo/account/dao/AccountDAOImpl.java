package kr.ac.kopo.account.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.transactiondetail.vo.TransactionDetailVO;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    private static final String NAMESPACE = "kr.ac.kopo.account.dao.AccountDAO.";
    
    @Override
    public void accountRegister(AccountVO account) throws Exception {
        sqlSession.insert(NAMESPACE + "accountRegister", account);
    }

    @Override
    public AccountVO findAccountByNumber(String accountNum) throws Exception {
        return sqlSession.selectOne(NAMESPACE + "findAccountByNumber", accountNum);
    }

    @Override
    public void updateAccount(AccountVO account) throws Exception {
        sqlSession.update(NAMESPACE + "updateAccount", account);
    }

    @Override
    public void deposit(String accountNum, int amount) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("accountNum", accountNum);
        params.put("amount", amount);
        sqlSession.update(NAMESPACE + "deposit", params);
    }

    @Override
    public AccountVO findById(String accountId) {
        return sqlSession.selectOne(NAMESPACE + "findById", accountId);
    }

    @Override
    public void update(AccountVO account) {
        sqlSession.update(NAMESPACE + "updateAccount", account);
    }

    @Override
    public List<AccountVO> getAllAccounts() {
        return sqlSession.selectList(NAMESPACE + "getAllAccounts");
    }

    @Override
    public AccountVO getAccountById(String accountId) {
        return sqlSession.selectOne(NAMESPACE + "getAccountById", accountId);
    }

    @Override
    public List<TransactionDetailVO> getTransactionsByAccountId(String accountId) {
        return sqlSession.selectList(NAMESPACE + "getTransactionsByAccountId", accountId);
    }

    @Override
    public List<AccountVO> getAccountsByCustomerId(String customer_Id) {
        return sqlSession.selectList(NAMESPACE + "getAccountsByCustomerId", customer_Id);
    }


}
