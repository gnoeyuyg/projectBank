package kr.ac.kopo.savings.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.ac.kopo.savings.vo.SavingsAccountVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SavingsAccountDAOImpl implements SavingsAccountDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public List<SavingsAccountVO> findAllSavingsAccounts() throws Exception {
        return sqlSession.selectList("dao.SavingsAccountDAO.findAllSavingsAccounts");
    }

    @Override
    public void updateSavingsAccount(SavingsAccountVO account) throws Exception {
        sqlSession.update("dao.SavingsAccountDAO.updateSavingsAccount", account);
        
    }
    @Override
    public void savingsAccountRegister(SavingsAccountVO savingsAccount) throws Exception {
        sqlSession.insert("dao.SavingsAccountDAO.savingsAccountRegister", savingsAccount);
    }

    @Override
    public void savingsDeposit(String savingsAccountNum, int amount) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("savings_account_num", savingsAccountNum);
        params.put("amount", amount);
        sqlSession.update("dao.SavingsAccountDAO.savingsDeposit", params);
    }

    @Override
    public SavingsAccountVO findSavingsAccountByNumber(String savingsAccountNum) throws Exception {
        return sqlSession.selectOne("dao.SavingsAccountDAO.findSavingsAccountByNumber", savingsAccountNum);
    }
}
