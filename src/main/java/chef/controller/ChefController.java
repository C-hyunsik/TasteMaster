package chef.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import chef.service.ChefService;

@Controller
public class ChefController {

	@Autowired
	private ChefService chefService;

}
