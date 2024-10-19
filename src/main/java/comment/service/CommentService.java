package comment.service;

import java.util.List;

import comment.bean.CommentDTO;

public interface CommentService {

	public void apiCommentEnroll(CommentDTO comment);

	public List<CommentDTO> apiCommentList(int postId);

	public boolean apiCommentDelete(CommentDTO commentDTO);

	public boolean apiCommentUpdate(CommentDTO commentDTO);
}
