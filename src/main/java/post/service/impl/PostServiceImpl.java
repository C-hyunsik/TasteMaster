package post.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dish.service.DishService;
import post.dao.PostDAO;

@Service
public class PostServiceImpl implements DishService {
	@Autowired
	private PostDAO postDAO;

	
	
}
