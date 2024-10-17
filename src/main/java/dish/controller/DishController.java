package dish.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
=======
import org.springframework.web.bind.annotation.RequestMapping;
>>>>>>> 5fa3749c47eba32b6377cf019fb812eb633a7aa3

import dish.bean.DishDTO;
import dish.service.DishService;

@Controller
public class DishController {

	@Autowired
	private DishService dishService;

<<<<<<< HEAD
    @RequestMapping(value = "/page/dish/dishList")
  	public String pageChefDishLists(@RequestParam String chefId, Model model) throws IOException {
    	
    	List<DishDTO> dishList = dishService.apiDishList(chefId);
    	model.addAttribute("dishList", dishList);
  		return "/dish/dishList";
  	}
    
    
=======
	@RequestMapping(value="/page/dish/dishlist")
	public String pageDishDishList() {
		return "/dish/dishList";
	}
>>>>>>> 5fa3749c47eba32b6377cf019fb812eb633a7aa3
}
