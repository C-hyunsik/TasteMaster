package post.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import post.bean.PostDTO;


@Mapper
public interface PostDAO {

	public int getTotalA(int dishId);
	
	public List<PostDTO> dishPostList(Map<String, Integer> map);

	public void postWrite(PostDTO postDTO);

	public void apiUploadPost(PostDTO post);

	public List<PostDTO> getPostByChefId(int chefId);

	public List<PostDTO> postInfo(int postId);

	public void apiPostDelete(int postId);
	
}
