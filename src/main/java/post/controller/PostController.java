package post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import post.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	@RequestMapping(value="/page/post/dishpostlist")
	public String pagepostdishpostlist() {
		return "/post/dishPostList";
	}
}
