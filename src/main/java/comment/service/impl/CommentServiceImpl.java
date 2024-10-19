package comment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.bean.CommentDTO;
import comment.dao.CommentDAO;
import comment.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public void apiCommentEnroll(CommentDTO comment) {
		// TODO Auto-generated method stub
		commentDAO.apiCommentEnroll(comment);
	}

	@Override
	public List<CommentDTO> apiCommentList(int postId) {
		// TODO Auto-generated method stub
		return commentDAO.apiCommentList(postId);
	}

	@Override
	public boolean apiCommentDelete(CommentDTO commentDTO) {
		return commentDAO.apiCommentDelete(commentDTO);

	}

	@Override
	public boolean apiCommentUpdate(CommentDTO commentDTO) {
		return commentDAO.apiCommentUpdate(commentDTO);
	}

	
	
}
