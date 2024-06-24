package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO member) throws Exception;

	void signUp(MemberVO member) throws Exception;
	
	 MemberVO getMemberById(String id) throws Exception;
	 
     void updateMember(MemberVO member) throws Exception;
     
     MemberVO findById(String userId);
     void delete(String userId);
     
     //중복체크
     MemberVO findByCustomerId(String customer_id);
     MemberVO findBySSN(String SSN);
     MemberVO findByEmail(String email);
}
