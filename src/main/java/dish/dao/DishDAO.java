package dish.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import chef.bean.ChefDTO;
import dish.bean.DishDTO;


@Mapper
public interface DishDAO {

	public void uploadDishes(List<DishDTO> dishList);


	public List<DishDTO> getDishByChefId(int chefId);

	public List<DishDTO> apiDishList(String chefId);

	public List<ChefDTO> apiChefInfo(String chefId);

	public DishDTO apiDishInfo(int dishId);


	public DishDTO getDishByDishId(int parseInt);


	public void apiUpdateDish(DishDTO existingDish);


	public void apiDishDeliciousCount(int dishId);

	public void apiDishEasyCount(int dishId);


	public void apiDishDelete(Map map);

	
}
