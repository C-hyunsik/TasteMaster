package post.service;

import java.util.Map;

import post.bean.PostDTO;

public interface PostService {

	public Map<String, Object> dishPostList(String pg, int dishId);

	public void apiUploadPost(PostDTO post);

}
