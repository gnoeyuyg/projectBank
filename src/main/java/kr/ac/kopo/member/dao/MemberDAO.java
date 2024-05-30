package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO member) throws Exception;

	void signUp(MemberVO member) throws Exception;
}
