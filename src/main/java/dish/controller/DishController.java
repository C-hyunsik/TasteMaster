package dish.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dish.bean.DishDTO;
import dish.service.DishService;

@Controller
public class DishController {

	@Autowired
	private DishService dishService;


    @RequestMapping(value = "/page/dish/dishList")
  	public String pageChefDishLists(@RequestParam String chefId, Model model) throws IOException {
    	
    	List<DishDTO> dishList = dishService.apiDishList(chefId);
    	model.addAttribute("dishList", dishList);
  		return "/dish/dishList";
  	}
    
    

}
