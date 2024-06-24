package kr.ac.kopo.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;
    private static final String NAMESPACE = "kr.ac.kopo.member.dao.MemberDAO.";
    @Override
    public MemberVO login(MemberVO member) throws Exception {
    	System.out.println(member);
        MemberVO loginVO = sqlSession.selectOne("dao.MemberDAO.login", member);
        return loginVO;
    }

    @Override
    public void signUp(MemberVO member) throws Exception {
        sqlSession.insert("dao.MemberDAO.signUp", member);
    }
    
    @Override
    public MemberVO getMemberById(String id) throws Exception {
    	System.out.println(id + "dao1");
    	MemberVO m = sqlSession.selectOne("dao.MemberDAO.getMemberById", id);
    	System.out.println(m + "dao");
        return sqlSession.selectOne("dao.MemberDAO.getMemberById", id);
    }

    @Override
    public void updateMember(MemberVO member) throws Exception {
        sqlSession.update("dao.MemberDAO.updateMember", member);
    }
    
    @Transactional
	public int update_mypage(MemberVO member) throws Exception{
		return sqlSession.update("member.update_mypage", member);
	}
    
    public MemberVO findById(String userId) {
        return sqlSession.selectOne("dao.MemberDAO.findById", userId);
    }

    @Override
    public void delete(String userId) {
        sqlSession.delete("dao.MemberDAO.delete", userId);
    }
    //중복체크
    @Override
    public MemberVO findByCustomerId(String customer_id) {
        return sqlSession.selectOne(NAMESPACE + "findByCustomerId", customer_id);
    }

    @Override
    public MemberVO findBySSN(String SSN) {
        return sqlSession.selectOne(NAMESPACE + "findBySSN", SSN);
    }

    @Override
    public MemberVO findByEmail(String email) {
        return sqlSession.selectOne(NAMESPACE + "findByEmail", email);
    }
}
