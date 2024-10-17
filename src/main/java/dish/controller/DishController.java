package dish.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dish.service.DishService;

@Controller
public class DishController {

	@Autowired
	private DishService dishService;

	@RequestMapping(value="/page/dish/dishlist")
	public String pageDishDishList() {
		return "/dish/dishList";
	}
}
