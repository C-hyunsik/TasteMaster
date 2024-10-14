package member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.bean.MemberDTO;
import member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/page/member/join")
	public String pageMemberJoin() {
		return "/member/join";
	}
	@RequestMapping(value="/api/member/join", method = RequestMethod.POST)
	@ResponseBody
	public void apiMemberJoin(@ModelAttribute MemberDTO memberDTO) {
		memberService.apiMemberJoin(memberDTO);
	}
	@RequestMapping(value="/page/member/login")
	public String pageMemberLogin(){
		
		return "/member/login";
	}
	@RequestMapping(value="/api/member/login", method = RequestMethod.POST)
	@ResponseBody
	public void apiMemberLogin(@RequestParam String login_id, @RequestParam String pwd){
		Map<String, String> map = new HashMap<>();
		map.put("login_id", login_id);
		map.put("pwd", pwd);
		
		memberService.apiMemberLogin(map);
	}
	@RequestMapping(value="/api/member/delete",method = RequestMethod.POST)
	@ResponseBody
	public void apiMemberDelete(@RequestParam String login_id, @RequestParam String pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("login_id", login_id);
		map.put("pwd", pwd);
		memberService.apiMemberDelete(map);
	}
}





























