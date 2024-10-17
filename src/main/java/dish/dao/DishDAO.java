package dish.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import chef.bean.ChefDTO;
import dish.bean.DishDTO;


@Mapper
public interface DishDAO {

	public void uploadDishes(List<DishDTO> dishList);
<<<<<<< HEAD
=======

	public List<DishDTO> getDishByChefId(int chefId);
>>>>>>> 8cd5e5732af9271e8e3f51f633ce12c580ae7483

	public List<DishDTO> apiDishList(String chefId);

	public List<ChefDTO> apiChefInfo(String chefId);

	
}
