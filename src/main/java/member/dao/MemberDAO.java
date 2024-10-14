package member.dao;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import member.bean.MemberDTO;


@Mapper
public interface MemberDAO {

	public void apiMemberJoin(MemberDTO memberDTO);
	
	public void apiMemberLogin(Map<String, String> map);

	public void apiMemberDelete(Map<String, String> map);

}
