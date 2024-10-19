package comment.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import comment.bean.CommentDTO;


@Mapper
public interface CommentDAO {

	public void apiCommentEnroll(CommentDTO comment);
	
	public List<CommentDTO> apiCommentList(int postId);

	public boolean apiCommentDelete(CommentDTO commentDTO);

	public boolean apiCommentUpdate(CommentDTO commentDTO);
}
