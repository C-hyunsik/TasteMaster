package dish.service;

import java.util.List;

import dish.bean.DishDTO;

public interface DishService {

	public void uploadDishes(List<DishDTO> dishList);

	public List<DishDTO> getDishByChefId(int chefId);


}
