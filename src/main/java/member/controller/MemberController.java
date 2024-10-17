package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chef.bean.ChefDTO;
import chef.service.ChefService;
import member.bean.MemberDTO;
import member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
    private ChefService chefService;

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
	public void apiMemberLogin(@RequestParam String loginId, @RequestParam String pwd, HttpServletResponse response, HttpSession httpSession) {
		Map<String, String> map = new HashMap<>();
		map.put("loginId", loginId);
		map.put("pwd", pwd);
		MemberDTO dto = memberService.apiMemberLogin(map);

		if(dto != null) {
		    httpSession.setAttribute("loginId", loginId);
		    //httpSession.setAttribute("memberDto", dto); //dto통째로 담기
		    httpSession.setAttribute("role", dto.getRole());
		    httpSession.setAttribute("memberId", dto.getMemberId());
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
	public String pageMemberMypage(Model model, HttpServletResponse response, HttpSession httpSession) throws IOException {
		String loginId = (String) httpSession.getAttribute("loginId");
	    // 회원 정보 조회
	    MemberDTO memberDTO = memberService.apiMemberInfo(loginId);
	    
	    if (memberDTO == null) {
	    	 response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404 회원 정보 없음
	    	 response.sendRedirect("/TasteMasters/page/member/login"); // 로그인 페이지로 리다이렉트
	    	 return null; // 리다이렉트 후 메서드를 종료
	    }
	    
	    model.addAttribute("memberDTO", memberDTO);

		return "/member/mypage";

	}
		

	@RequestMapping(value = "/api/member/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public void apiMemberIdCheck(@RequestParam String loginId, HttpServletResponse response) {
		
		int idcheck = memberService.apiIdCheck(loginId);

		if (idcheck == 1) { // 아이디가 중복
			response.setStatus(HttpServletResponse.SC_CONFLICT); // 409
			return;
		}
		else {
			response.setStatus(HttpServletResponse.SC_OK); // 200
			return;
		}
		
	}

	@RequestMapping(value = "/api/member/update")
	@ResponseBody
	public void apiMemberUpdate(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response, HttpSession httpSession) {
		int result = memberService.apiMemberUpdate(memberDTO);
		
		if (result == 1) {
	        response.setStatus(HttpServletResponse.SC_OK); // 200 수정 성공
	        httpSession.setAttribute("loginId", memberDTO.getLoginId());
	        return;
	    } else {
	        response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 수정 실패
	        return;
	    }
	}

	@RequestMapping(value = "/api/member/logout")
	public String apiMemberLogout(HttpSession httpSession, HttpServletResponse response) throws IOException {
		httpSession.invalidate();
		response.sendRedirect("/TasteMasters/page/index"); // 로그인 페이지로 리다이렉트
		return null;
	}
	
	@RequestMapping(value = "/page/member/admin")
	public ModelAndView pageMemberAdmin(HttpSession httpSession, HttpServletResponse response) throws IOException {
		String role = (String) httpSession.getAttribute("role");
		List<ChefDTO> chefList = chefService.apiChefList();
		
		ModelAndView mav = new ModelAndView("/admin/adminMain");
		
	    if (role == null || role.equals("ADMIN") == false) {
	    	 response.sendRedirect("/TasteMasters/page/index"); // 메인 페이지로 리다이렉트
	    	 return null; // 리다이렉트 후 메서드를 종료
	    }
	    
	    mav.addObject("chefList", chefList);
	    mav.addObject("role", role);
		  
		return mav;

	}
	
	@Autowired
	JavaMailSenderImpl mailSender;

	//이메일 인증
	@PostMapping("/api/member/EmailAuth")
	@ResponseBody
	public int emailAuth(String email) {
		
		System.out.println("전달 받은 이메일 주소 : " + email);
		
		//난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		
		//이메일 보낼 양식
		String setFrom = "gustlr887@naver.com"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
		String toMail = email;
		String title = "TasteMasters 웹 페이지 회원가입 인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다." +
						 "<br>" +
						 "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("랜덤숫자 : " + checkNum);
		return checkNum;
	}
	
}
