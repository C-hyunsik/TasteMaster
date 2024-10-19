package member.dao;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import member.bean.MemberDTO;


@Mapper
public interface MemberDAO {

	public int apiMemberJoin(MemberDTO memberDTO);
	
	public MemberDTO apiMemberLogin(Map<String, String> map);

	public int apiMemberDelete(Map<String, String> map);

	public Integer apiIdCheck(String loginId);

	public MemberDTO apiMemberInfo(String loginId);

	public int apiMemberUpdate(MemberDTO memberDTO);
}
