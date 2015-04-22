package com.dockerapi.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dockerapi.client.DockerImagesImpl;

@Component
@Controller
public class ImageCtrl {
	
	private DockerImagesImpl imagesImpl;

	@Resource
	public void setImagesImpl(DockerImagesImpl imagesImpl) {
		this.imagesImpl = imagesImpl;
	}
	
	@RequestMapping("/image/list")
	public ModelAndView listContainers() {
		
		//get ip:port from .properties
		String dockerUrl = "/json";
		imagesImpl.setDockerUrlResource(dockerUrl);
		imagesImpl.listImages();
		
		ModelAndView mv = new ModelAndView("images");
		mv.addObject("count", imagesImpl.getiList().size());
		mv.addObject("imgs", imagesImpl.getiList());
		return mv;
	}
	
	
}
