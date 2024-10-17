package post.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dish.bean.DishDTO;
import post.bean.PostDTO;
import post.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	@RequestMapping(value="/page/post/dishPostList", method = RequestMethod.GET)
	public String pagePostDishPostList(@RequestParam(required = false, defaultValue = "1") String pg, @RequestParam(defaultValue = "1") int dishId,  Model model) {
		Map<String, Object> map2 = postService.dishPostList(pg, dishId);
		List<DishDTO> dishInfo = postService.apiDishInfo(dishId);
		model.addAttribute("map2",map2);
		model.addAttribute("dishInfo",dishInfo);
		model.addAttribute("pg",pg);
		return "/post/dishPostList";
	}
	
	@RequestMapping(value="/page/post/dishPostWrite", method = RequestMethod.GET)
	public String dishPostList(@RequestParam(value = "dishId", required = false, defaultValue = "0") Integer dishId, Model model) {
		model.addAttribute("dishId",dishId);
		return "/post/dishPostWrite";
	}
	@RequestMapping(value="/api/post/postWrite")
	public void apiPostPostWrite(@ModelAttribute PostDTO postDTO) {
		postService.postWrite(postDTO);
	}
}
