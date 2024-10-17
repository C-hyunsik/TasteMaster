package dish.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chef.bean.ChefDTO;
import dish.bean.DishDTO;
import dish.dao.DishDAO;
import dish.service.DishService;

@Service
public class DishServiceImpl implements DishService {
	@Autowired
	private DishDAO dishDAO;

	@Override
	public void uploadDishes(List<DishDTO> dishList) {
		dishDAO.uploadDishes(dishList);
		
	}

	@Override
	public List<DishDTO> getDishByChefId(int chefId) {
		List<DishDTO> dishList = dishDAO.getDishByChefId(chefId);
		return dishList;
	}
	
	public List<DishDTO> apiDishList(String chefId) {
		return dishDAO.apiDishList(chefId);
	}
	@Override
	public List<ChefDTO> apiChefInfo(String chefId) {
		return dishDAO.apiChefInfo(chefId);
	}

	@Override
	public DishDTO apiDishInfo(int dishId) {
		return dishDAO.apiDishInfo(dishId);
	}

	
	
}
