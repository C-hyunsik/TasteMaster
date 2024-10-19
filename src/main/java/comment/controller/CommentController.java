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
	
	@RequestMapping(value = "/api/comment/delete")
	@ResponseBody
	public boolean apiCommentDelete(@RequestParam int commentId, HttpSession session, HttpServletResponse httpServletResponse) {
	    Integer memberId = (Integer) session.getAttribute("memberId");
	    
	    CommentDTO commentDTO = new CommentDTO();
	    commentDTO.setCommentId(commentId);
	    commentDTO.setMemberId(memberId); // Optional: 확인 용도

	    // 댓글 삭제 서비스 호출
	    boolean isDeleted = commentService.apiCommentDelete(commentDTO);
	    
	    return isDeleted;
	}
	
	@RequestMapping(value = "/api/comment/update")
	@ResponseBody
	public boolean apiCommentUpdate(@RequestParam("commentId") int commentId, @RequestParam("content") String content, HttpSession session, HttpServletResponse httpServletResponse ) {
		Integer memberId = (Integer) session.getAttribute("memberId");
	
	    CommentDTO commentDTO = new CommentDTO();
	    commentDTO.setCommentId(commentId);
	    commentDTO.setContent(content);
	    commentDTO.setMemberId(memberId);  // 확인 용도
	    System.out.println(commentDTO.getContent());

	    // 댓글 수정 서비스 호출
	    boolean isUpdated = commentService.apiCommentUpdate(commentDTO); // 서비스 메소드 작성 필요

	    return isUpdated;
	}
}
