package dish.service.impl;

import java.util.List;
import java.util.Map;

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

	@Override
	public void apiUpdateDish(DishDTO existingDish) {
		dishDAO.apiUpdateDish(existingDish);
		
	}
	@Override
	public void apiDishDeliciousCount(int dishId) {
		dishDAO.apiDishDeliciousCount(dishId);
		
	}
	@Override
	public void apiDishEasyCount(int dishId) {
		dishDAO.apiDishEasyCount(dishId);
	}

	@Override
	public void apiDishDelete(Map map) {
		dishDAO.apiDishDelete(map);
		
	}
}
