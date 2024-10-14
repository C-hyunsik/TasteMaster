package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	public void apiMemberJoin(@RequestBody  MemberDTO memberDTO, HttpServletResponse response) {
		
		//먼저 아이디 중복체크 로직 
		
		//
		int result = memberService.apiMemberJoin(memberDTO);
		if(result == 1) {
	        // 응답 코드 설정: 201 Created
	        response.setStatus(HttpServletResponse.SC_CREATED); // 201
	        return;
		}
		else {
			  // 요청이 잘못된 경우 응답 코드 설정: 400 Bad Request
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            return;
		}
	}
	
	
	@RequestMapping(value="/page/member/login")
	public String pageMemberLogin(){
		
		return "/member/login";
	}
	
	
	@RequestMapping(value="/api/member/login", method = RequestMethod.POST)
	@ResponseBody
	public void apiMemberLogin(@RequestParam String loginId, @RequestParam String pwd){
		Map<String, String> map = new HashMap<>();
		map.put("loginId", loginId);
		map.put("pwd", pwd);
		
		memberService.apiMemberLogin(map);
	}
	
	
	@RequestMapping(value="/api/member/delete",method = RequestMethod.POST)
	@ResponseBody
	public void apiMemberDelete(@RequestParam String loginId, @RequestParam String pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("loginId", loginId);
		map.put("pwd", pwd);
		memberService.apiMemberDelete(map);
	}
}





























