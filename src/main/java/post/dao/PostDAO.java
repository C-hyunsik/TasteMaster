package post.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import dish.bean.DishDTO;
import member.bean.MemberDTO;
import post.bean.PostDTO;


@Mapper
public interface PostDAO {

	public int getTotalA();
	
	public List<PostDTO> dishPostList(Map<String, Integer> map);

<<<<<<< HEAD
	public List<DishDTO> apiDishInfo(int dishId);

	public void postWrite(PostDTO postDTO);
=======

	public void apiUploadPost(PostDTO post);

	public List<PostDTO> getPostByChefId(int chefId);

>>>>>>> 8cd5e5732af9271e8e3f51f633ce12c580ae7483

	
}
