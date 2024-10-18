package comment.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import comment.bean.CommentDTO;
import comment.service.CommentService;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "/api/comment/enroll", method = RequestMethod.POST)
	@ResponseBody
	public String apiCommentEnroll(@RequestParam String postId, @RequestParam String content, HttpSession session
			, HttpServletResponse httpServletResponse) {
		/*
		String memberIdString = (String) session.getAttribute("memberId");
		System.out.println(memberIdString);
		if(memberIdString == null) {
			httpServletResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			return null;
		}	int memeberId = (int) session.getAttribute("memberId");
		*/
		int memeberId = (int) session.getAttribute("memberId");

		CommentDTO comment = new CommentDTO();
		comment.setPostId(Integer.parseInt(postId));
		comment.setMemberId(memeberId);
		comment.setContent(content);
		commentService.apiCommentEnroll(comment); // 게시글 정보 DB에 저장

		// 결과 메시지 구성
		return "댓글 등록";
	}
}
