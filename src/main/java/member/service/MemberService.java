package member.service;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberService {

	public int apiMemberJoin(MemberDTO memberDTO);
	
	public MemberDTO apiMemberLogin(Map<String, String> map);

	public int apiMemberDelete(Map<String, String> map);
	
	public int apiIdCheck(String loginId);
}
