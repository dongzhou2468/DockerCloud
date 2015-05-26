package com.dockerapi.client;

import java.lang.reflect.Type;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.dockerapi.model.Container;
import com.dockerapi.model.Image;
import com.dockerapi.model.ImageFromHub;
import com.dockerapi.util.HttpHandler;
import com.dockerapi.util.JsonData;
import com.google.gson.reflect.TypeToken;

@Component
public class DockerImagesImpl {

	private String dockerUrlResource = "http://222.201.187.162:2375/";
	private Type listType;
	private ArrayList<Image> iList;
	private ArrayList<ImageFromHub> iFromHubList;

	public ArrayList<Image> getiList() {
		return iList;
	}
	public void setiList(ArrayList<Image> iList) {
		this.iList = iList;
	}
	public ArrayList<ImageFromHub> getiFromHubList() {
		return iFromHubList;
	}
	public void setiFromHubList(ArrayList<ImageFromHub> iFromHubList) {
		this.iFromHubList = iFromHubList;
	}
	
	public void setDockerUrlResource(String dockerUrl, int i) {
		if (i == 0) {
			dockerUrlResource = dockerUrlResource + "images" + dockerUrl;
		} else if (i == 1) {
			dockerUrlResource = dockerUrlResource + "containers" + dockerUrl;
		}
		System.out.println(dockerUrlResource);
	}
	
	public void listImages() {

		listType = new TypeToken<ArrayList<Image>>() {
		}.getType();
		
		String result = HttpHandler.httpGet(dockerUrlResource);
		JsonData.jsonImageToObject(result, DockerImagesImpl.this, listType);
		
		resetUrl();
	}
	
	public int runContainers(String cmd) {

//      Map contaiterCmd=new HashMap();
//      contaiterCmd.put("Hostname", "aaa");
		
		int responseCode = HttpHandler.runContainers(dockerUrlResource, cmd);
		resetUrl();
		return responseCode;
	}
	
	public int removeImages() {
		
		int responseCode = HttpHandler.httpDelete(dockerUrlResource);
		resetUrl();
		return responseCode;
	}
	
	public void searchImages() {
		
		listType = new TypeToken<ArrayList<ImageFromHub>>() {
		}.getType();
		
		String result = HttpHandler.httpGet(dockerUrlResource);
		JsonData.imageFromHubToObject(result, DockerImagesImpl.this, listType);
		
		resetUrl();
	}
	
	public void resetUrl() {
		dockerUrlResource = "http://222.201.187.162:2375/";
	}
}
