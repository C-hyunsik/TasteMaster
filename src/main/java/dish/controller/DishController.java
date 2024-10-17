package dish.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import chef.bean.ChefDTO;
import chef.service.ChefService;
import dish.bean.DishDTO;
import dish.service.DishService;

@Controller
public class DishController {

	@Autowired
	private DishService dishService;


	@Autowired
	private ChefService chefService;

    @RequestMapping(value = "/page/dish/dishList")
  	public String pageDishDishLists(@RequestParam String chefId, Model model) throws IOException {
    	
    	List<DishDTO> dishList = dishService.apiDishList(chefId);
    	ChefDTO chefInfo = chefService.apiChefGetDTO(Integer.parseInt(chefId));
    	model.addAttribute("dishList", dishList);
    	model.addAttribute("chefInfo", chefInfo);
  		return "/dish/dishList";
  	}
    
    @RequestMapping(value = "/page/dish/updateDishForm")
    public String updateDishForm(@RequestParam int dishId, Model model) {
    	DishDTO dishDTO = dishService.apiDishInfo(dishId);
    	
    	model.addAttribute("dishDTO", dishDTO);
    	
    	return "/dish/updateDishForm";
    }
}
