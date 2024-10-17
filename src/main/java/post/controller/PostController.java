package post.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import post.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	@RequestMapping(value="/page/post/dishpostlist")
	public String pagePostDishPostList(@RequestParam(required = false, defaultValue = "1") String pg, @RequestParam(defaultValue = "1") int dishId,  Model model) {
		Map<String, Object> map2 = postService.dishPostList(pg, dishId);
		model.addAttribute("map2",map2);
		model.addAttribute("pg",pg);
		return "/post/dishPostList";
	}
	
	@RequestMapping(value="/page/post/dishpostwrite")
	public String pagePostDishPostWrite(){
		return "/post/dishPostWrite";
	}
}
