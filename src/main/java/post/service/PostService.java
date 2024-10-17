package post.service;

import java.util.List;
import java.util.Map;

import dish.bean.DishDTO;
import post.bean.PostDTO;

public interface PostService {

	public Map<String, Object> dishPostList(String pg, int dishId);

	public void postWrite(PostDTO postDTO);

	public void apiUploadPost(PostDTO post);

	public List<PostDTO> getPostByChefId(int chefId);

	public List<PostDTO> postInfo(int postId);

	public void apiPostDelete(int postId);


}
