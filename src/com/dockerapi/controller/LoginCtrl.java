package com.dockerapi.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dockerapi.model.ContainerInfo;

//import entity.User;

@Controller
public class LoginCtrl {

	private static boolean AUTHEN = false;
	private static boolean REDIRECT = false; //to containers.jsp
	private static String PAGE = "1";
	
	@Resource
	private ContainerCtrl containerCtrl;
	
	@RequestMapping("/login")
	public ModelAndView loginAuth() {
		
		String dest = "index";
		
		//authentication
		AUTHEN = true;
		REDIRECT = true;
		if(REDIRECT) {
			return containerCtrl.listContainers(PAGE, "");
		}
		
		ModelAndView mv = new ModelAndView(dest);
		return mv;
	}
	
	
	
	
}
