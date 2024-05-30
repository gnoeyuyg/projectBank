package kr.ac.kopo.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDao;
    
    @Override
    public MemberVO login(MemberVO member) throws Exception {
        return memberDao.login(member);
    }

    @Override
    public void signUp(MemberVO member) throws Exception {
        memberDao.signUp(member);
    }
}
