package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@RequestMapping(value = "/page/member/join")
	public String pageMemberJoin() {

		return "/member/join";

	}

	@RequestMapping(value = "/page/member/login")
	public String pageMemberLogin() {

		return "/member/login";

	}

	@RequestMapping(value = "/api/member/join", method = RequestMethod.POST)
	@ResponseBody
	public void apiMemberJoin(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response) {

		// 먼저 아이디 중복체크 로직
		int idcheck = memberService.apiIdCheck(memberDTO.getLoginId());

		if (idcheck == 1) { // 아이디가 중복
			response.setStatus(HttpServletResponse.SC_CONFLICT); // 409
			return;
		}
		//
		int result = memberService.apiMemberJoin(memberDTO);
		if (result == 1) {
			// 응답 코드 설정: 201 Created
			response.setStatus(HttpServletResponse.SC_CREATED); // 201
			return;
		} else {
			// 요청이 잘못된 경우 응답 코드 설정: 400 Bad Request
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
			return;
		}
	}

	@RequestMapping(value="/api/member/login", method = RequestMethod.POST)
	@ResponseBody
	public void apiMemberLogin(@ModelAttribute  MemberDTO memberDTO, HttpServletResponse response, HttpSession httpSession) {
		Map<String, String> map = new HashMap<>();
		map.put("loginId", memberDTO.getLoginId());
		map.put("pwd", memberDTO.getPwd());
		
		MemberDTO dto = memberService.apiMemberLogin(map);
		if(dto != null) {
		    httpSession.setAttribute("loginId", dto.getLoginId());
		    httpSession.setAttribute("memberDto", dto); //dto통째로 담기
			response.setStatus(HttpServletResponse.SC_OK); // 200 로그인 성공
			 
		     return;
		}else {
			 response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401 권한없음
		     return;
		}
	}

	@RequestMapping(value = "/api/member/delete", method = RequestMethod.POST)
	@ResponseBody
	public void apiMemberDelete(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response, HttpSession httpSession) {
		
		Map<String, String> map = new HashMap<>();
		map.put("loginId", memberDTO.getLoginId());
		map.put("pwd", memberDTO.getPwd());
		int result = memberService.apiMemberDelete(map);

		if (result == 1) {
			httpSession.invalidate();
			response.setStatus(HttpServletResponse.SC_OK); // 200 삭제 성공
			return;
		} else {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 삭제 실패
			return;
		}
	}

	@RequestMapping(value = "/page/member/mypage")
	public String pageMemberMypage() {

		return "/member/mypage";

	}
}
