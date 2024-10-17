package dish.service;

import java.util.List;

import chef.bean.ChefDTO;
import dish.bean.DishDTO;

public interface DishService {

	public void uploadDishes(List<DishDTO> dishList);

	public List<DishDTO> getDishByChefId(int chefId);

	public List<DishDTO> apiDishList(String chefId);

<<<<<<< HEAD
	public List<ChefDTO> apiChefInfo(String chefId);
=======
>>>>>>> 8cd5e5732af9271e8e3f51f633ce12c580ae7483
}
