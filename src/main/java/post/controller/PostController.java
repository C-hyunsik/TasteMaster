package post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import post.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;

}
