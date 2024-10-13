package com.controller.TasteMasters;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/page/index") //value => 요청 url
	public String index() {
		return "/index"; // 파일경로
	}
	
}
