package post.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");

        // 리스트에서 createdAt을 String으로 변환하여 set
        for (PostDTO post : list) {
            Date createdAt = post.getCreatedAt();
            if (createdAt != null) {
                String formattedDate = formatter.format(createdAt);
                post.setCreatedAtToString(formattedDate);
            }
        }
		//페이징 처리
		int totalA = postDAO.getTotalA(dishId);
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

	@Override
	public void postWrite(PostDTO postDTO) {
		postDAO.postWrite(postDTO);
	}

	@Override
	public void apiUploadPost(PostDTO post) {
		postDAO.apiUploadPost(post);
	}
	
	@Override
	public List<PostDTO> getPostByChefId(int chefId) {
		List<PostDTO> postList = postDAO.getPostByChefId(chefId);
		return postList;
	}
	@Override
	public List<PostDTO> postInfo(int postId) {
		return postDAO.postInfo(postId);
	}
}
