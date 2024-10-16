package dish.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import dish.service.DishService;

@Controller
public class DishController {

	@Autowired
	private DishService dishService;

}
