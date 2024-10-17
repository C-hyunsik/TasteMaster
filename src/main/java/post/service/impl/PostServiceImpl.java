package post.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dish.bean.DishDTO;
import post.bean.PostDTO;
import post.bean.PostPaging;
import post.dao.PostDAO;
import post.service.PostService;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private PostPaging postPaging;
	
	@Override
	public Map<String, Object> dishPostList(String pg, int dishId) {
		//1페이지당 5개씩
		int endnum = 5;
		int startnum = (Integer.parseInt(pg) * endnum) - endnum;
		Map<String, Integer> map = new HashMap<>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("dishId", dishId);
		List<PostDTO> list = postDAO.dishPostList(map);
		
		//페이징 처리
		int totalA = postDAO.getTotalA();
		postPaging.setTotalA(totalA);
		postPaging.setCurrentPage((Integer.parseInt(pg)));
		postPaging.setPageBlock(3);
		postPaging.setPageSize(endnum);
		postPaging.makePagingHTML();
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("list", list);
		map2.put("postPaging", postPaging);
		map2.put("pg",pg);
		return map2;
	}
<<<<<<< HEAD
	@Override
	public List<DishDTO> apiDishInfo(int dishId) {
		
		return postDAO.apiDishInfo(dishId);
	}
	@Override
	public void postWrite(PostDTO postDTO) {
		postDAO.postWrite(postDTO);
	}
=======

	@Override
	public void apiUploadPost(PostDTO post) {
		postDAO.apiUploadPost(post);
	}
	
	@Override
	public List<PostDTO> getPostByChefId(int chefId) {
		List<PostDTO> postList = postDAO.getPostByChefId(chefId);
		return postList;
	}
	
>>>>>>> 8cd5e5732af9271e8e3f51f633ce12c580ae7483
}
