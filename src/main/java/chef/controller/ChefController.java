package chef.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import chef.service.ChefService;

@Controller
public class ChefController {

	@Autowired
	private ChefService chefService;

	// 셰프 누르면 음식 목록 띄우기
	@RequestMapping(value = "/page/chef/dishes")
	public String pageMemberMypage() {

		return "/member/mypage";

	}
	
}
