package post.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import member.bean.MemberDTO;
import post.bean.PostDTO;


@Mapper
public interface PostDAO {

	public int getTotalA();
	
	public List<PostDTO> dishPostList(Map<String, Integer> map);

	public void apiUploadPost(PostDTO post);

	
}
