package dish.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dish.dao.DishDAO;
import dish.service.DishService;

@Service
public class DishServiceImpl implements DishService {
	@Autowired
	private DishDAO dishDAO;

	
	
}
