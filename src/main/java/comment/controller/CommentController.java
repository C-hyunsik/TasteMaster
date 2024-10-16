package comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import comment.service.CommentService;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;

}
