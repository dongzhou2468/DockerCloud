package com.dockerapi.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dockerapi.dao.DBConn;

//import entity.User;

@Controller
public class LoginCtrl {

	private static boolean AUTHEN = false;
	private static boolean REDIRECT = false; //to containers.jsp
	private static String PAGE = "1";
	
	@Resource
	private ContainerCtrl containerCtrl;
	@Resource
	private ImageCtrl imageCtrl;
	@Resource
	private DBConn dbConn;
	
	@RequestMapping("/login")
	public ModelAndView loginAuth(String email, String password) {
		
		String dest = "index";
		System.out.println("email=" + email + "password=" + password);
		AUTHEN = dbConn.loginAuth(email, password);
		REDIRECT = true;
		if(REDIRECT) {
			return containerCtrl.listContainers(PAGE, "");
		}
		
		ModelAndView mv = new ModelAndView(dest);
		return mv;
	}
	
	
	
	
}
