package dish.service;

import java.util.List;
import java.util.Map;

import chef.bean.ChefDTO;
import dish.bean.DishDTO;

public interface DishService {

	public void uploadDishes(List<DishDTO> dishList);

	public List<DishDTO> getDishByChefId(int chefId);

	public List<DishDTO> apiDishList(String chefId);

	public List<ChefDTO> apiChefInfo(String chefId);

	public void apiUpdateDish(DishDTO existingDish);

	public DishDTO apiDishInfo(int dishId);

	public void apiDishDeliciousCount(int dishId);

	public void apiDishEasyCount(int dishId);

	public void apiDishDelete(Map map);

}
