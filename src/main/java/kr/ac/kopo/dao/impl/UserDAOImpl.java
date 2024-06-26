package kr.ac.kopo.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.dao.UserDAO;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int countByCustomerId(String customerId) {
        return sqlSession.selectOne("kr.ac.kopo.mapper.UserMapper.countByCustomerId", customerId);
    }

    @Override
    public int countByEmail(String email) {
        return sqlSession.selectOne("kr.ac.kopo.mapper.UserMapper.countByEmail", email);
    }

    @Override
    public int countByPhoneNumber(String phoneNumber) {
        return sqlSession.selectOne("kr.ac.kopo.mapper.UserMapper.countByPhoneNumber", phoneNumber);
    }

    @Override
    public int countBySSN(String ssn) {
        return sqlSession.selectOne("kr.ac.kopo.mapper.UserMapper.countBySSN", ssn);
    }
}
