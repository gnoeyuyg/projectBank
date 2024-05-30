package kr.ac.kopo.member.service;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {

    MemberVO login(MemberVO member) throws Exception;

    void signUp(MemberVO member) throws Exception;
}
