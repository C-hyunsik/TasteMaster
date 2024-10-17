package dish.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dish.bean.DishDTO;


@Mapper
public interface DishDAO {

	public void uploadDishes(List<DishDTO> dishList);

	public List<DishDTO> getDishByChefId(int chefId);

	
}
