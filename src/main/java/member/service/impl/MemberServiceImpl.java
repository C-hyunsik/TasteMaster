package member.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;
import member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int apiMemberJoin(MemberDTO memberDTO) {
		return memberDAO.apiMemberJoin(memberDTO);
	}
	
	@Override
	public void apiMemberLogin(Map<String, String> map) {
		memberDAO.apiMemberLogin(map);
	}
	@Override
	public int apiMemberDelete(Map<String, String> map) {
		return memberDAO.apiMemberDelete(map);
	}
}
