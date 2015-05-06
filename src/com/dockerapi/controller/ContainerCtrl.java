package com.dockerapi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dockerapi.client.DockerContainersImpl;
import com.dockerapi.dao.DBConn;
import com.dockerapi.model.Container;

@Component
@Controller
public class ContainerCtrl {

	@Resource
	private DBConn dbConn;
	private DockerContainersImpl containerImpl;
	private static String RETRIEVE = "1";

	@Resource
	public void setContainerImpl(DockerContainersImpl containerImpl) {
		this.containerImpl = containerImpl;
	}

	@RequestMapping("/container/list")
	public ModelAndView listContainers(String forwardPage, String retrieve) {
		System.out.println(forwardPage);
		//retrieve list when page 1
		if(forwardPage.equals("1") || retrieve.equals("1")) {
			// get ip:port from .properties
			String dockerUrl = "/json?all=1";
			containerImpl.setDockerUrlResource(dockerUrl);
			containerImpl.listContainers();
		}
		
		// set website url
		String url = "";
		ArrayList<Container> temp = containerImpl.getcList();
		for (int i = 0; i < temp.size(); i++) {
			url = dbConn.imageInfo(temp.get(i).getName(), "url");
			temp.get(i).setWebsite(url);
		}
		
		ModelAndView mv = new ModelAndView("containers1");
		mv.addObject("currentPage", forwardPage);
		mv.addObject("count", temp.size());
		mv.addObject("cts", temp);
		return mv;
	}

	@RequestMapping("/container/start")
	public ModelAndView startContainers(String i, String currentPage) {
		System.out.println(i);
		String id = containerImpl.getcList().get(Integer.parseInt(i)).getSubId();
		System.out.println(id);
		String dockerUrl = "/" + id + "/start";
		containerImpl.setDockerUrlResource(dockerUrl);
		containerImpl.startContainers();
		//retrieve list
		return listContainers(currentPage, RETRIEVE);
	}
	
	@RequestMapping("/container/stop")
	public ModelAndView stopContainers(String i, String currentPage) {
		System.out.println(i);
		String id = containerImpl.getcList().get(Integer.parseInt(i)).getSubId();
		System.out.println(id);
		String dockerUrl = "/" + id + "/stop?t=5";
		containerImpl.setDockerUrlResource(dockerUrl);
		containerImpl.stopContainers();
		return listContainers(currentPage, RETRIEVE);
	}
	
	@RequestMapping("/container/info")
	public ModelAndView infoContainers(String i) {
		System.out.println(i);
		String id = containerImpl.getcList().get(Integer.parseInt(i)).getSubId();
		System.out.println(id);
		String dockerUrl = "/" + id + "?v=";
		containerImpl.setDockerUrlResource(dockerUrl);
		containerImpl.infoContainers();
		
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("started", "hello world");
		return mv;
	}
	
	@RequestMapping("/container/remove")
	public ModelAndView removeContainers(String i, String currentPage) {
		System.out.println(i);
		String id = containerImpl.getcList().get(Integer.parseInt(i)).getSubId();
		System.out.println(id);
		
		//v: Remove the volumes associated to the container. Default false
		String dockerUrl = "/" + id;
		containerImpl.setDockerUrlResource(dockerUrl);
		containerImpl.removeContainers();
		return listContainers(currentPage, RETRIEVE);
	}
	
	
}
