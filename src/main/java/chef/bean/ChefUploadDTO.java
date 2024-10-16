package chef.bean;

import java.util.List;

import dish.bean.DishDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChefUploadDTO {
	private ChefDTO chef;                  // 쉐프 정보
    private List<DishDTO> dishes;          // 요리 정보 리스트

}
