package com.controller.TasteMasters;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import chef.bean.ChefDTO;
import chef.service.ChefService;

@Controller
public class MainController {
	
	@Autowired
	private ChefService chefService;
	
	@RequestMapping(value="/page/index") //value => 요청 url
	public String index(Model model, HttpSession httpSession) {
		
		List<ChefDTO> chefList = chefService.apiChefList();
		model.addAttribute("chefList", chefList);//jsp에 띄우기
		String loginId = (String) httpSession.getAttribute("loginId");
		boolean isLogin = loginId == null ? false : true;
		//로그인 여부 true false
		
		model.addAttribute("isLogin", isLogin);//jsp에 띄우기
		model.addAttribute("loginId", loginId);//jsp에 띄우기
		return "/index"; // 파일경로
	}

	@RequestMapping(value="/page/search") //value => 요청 url
	public String search(Model model, HttpSession httpSession, @RequestParam String keyword) {
		
		List<ChefDTO> chefList = chefService.apiChefSearch(keyword);
		model.addAttribute("chefList", chefList);//jsp에 띄우기
		String loginId = (String) httpSession.getAttribute("loginId");
		boolean isLogin = loginId == null ? false : true;
		//로그인 여부 true false
		
		model.addAttribute("isLogin", isLogin);//jsp에 띄우기
		model.addAttribute("loginId", loginId);//jsp에 띄우기
		return "/search"; // 파일경로
	}
	
}
