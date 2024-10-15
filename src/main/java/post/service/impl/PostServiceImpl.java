package post.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dish.service.DishService;
import post.dao.PostDAO;
import post.service.PostService;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDAO postDAO;

	
	
}
