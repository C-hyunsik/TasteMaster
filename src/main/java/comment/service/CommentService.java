package comment.service;

import java.util.List;

import comment.bean.CommentDTO;

public interface CommentService {

	void apiCommentEnroll(CommentDTO comment);

	List<CommentDTO> apiCommentList(int postId);
}
