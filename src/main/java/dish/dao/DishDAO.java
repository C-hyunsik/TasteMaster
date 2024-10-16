package dish.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dish.bean.DishDTO;


@Mapper
public interface DishDAO {

	void uploadDishes(List<DishDTO> dishList);

	
}
