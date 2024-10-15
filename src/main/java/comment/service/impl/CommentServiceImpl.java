package comment.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.dao.CommentDAO;
import dish.service.DishService;

@Service
public class CommentServiceImpl implements DishService {
	@Autowired
	private CommentDAO commentDAO;

	
	
}
