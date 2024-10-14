package member.service;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberService {

	public void apiMemberJoin(MemberDTO memberDTO);
	
	public void apiMemberLogin(Map<String, String> map);

	public void apiMemberDelete(Map<String, String> map);
	
}
