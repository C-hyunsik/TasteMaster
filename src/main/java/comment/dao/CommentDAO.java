package comment.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import comment.bean.CommentDTO;


@Mapper
public interface CommentDAO {

	void apiCommentEnroll(CommentDTO comment);
	
	List<CommentDTO> apiCommentList(int postId);
}
