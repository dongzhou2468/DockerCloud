package com.dockerapi.client;

import java.lang.reflect.Type;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.dockerapi.model.Container;
import com.dockerapi.model.Image;
import com.dockerapi.util.HttpHandler;
import com.dockerapi.util.JsonData;
import com.google.gson.reflect.TypeToken;

@Component
public class DockerImagesImpl {

	private String dockerUrlResource = "http://222.201.187.162:2375/";
	private Type listType;
	private ArrayList<Image> iList;

	public ArrayList<Image> getiList() {
		return iList;
	}

	public void setiList(ArrayList<Image> iList) {
		this.iList = iList;
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
	
	public void runContainers(String cmd) {

//      Map contaiterCmd=new HashMap();
//      contaiterCmd.put("Hostname", "aaa");
		
		HttpHandler.runContainers(dockerUrlResource, cmd);
		resetUrl();
	}
	
	public void removeImages() {
		
		HttpHandler.httpDelete(dockerUrlResource);
		resetUrl();
	}
	
	public void resetUrl() {
		dockerUrlResource = "http://222.201.187.162:2375/";
	}
}
