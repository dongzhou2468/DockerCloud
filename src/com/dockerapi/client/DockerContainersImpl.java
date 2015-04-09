package com.dockerapi.client;

import java.lang.reflect.Type;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.dockerapi.model.Container;
import com.dockerapi.util.HttpHandler;
import com.dockerapi.util.JsonData;
import com.google.gson.reflect.TypeToken;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

@Component("containerImpl")
public class DockerContainersImpl {

	private String dockerUrlResource = "http://222.201.187.162:2375/containers";
	private Type listType;
	private ArrayList<Container> cList;
	// private static final Logger LOGGER = LoggerFactory.getLogger(ListContainersCmdExec.class);

	public ArrayList<Container> getcList() {
		return cList;
	}

	public void setcList(ArrayList<Container> cList) {
		this.cList = cList;
	}

	public void setDockerUrlResource(String dockerUrl) {
		dockerUrlResource = dockerUrlResource + dockerUrl;
		System.out.println(dockerUrlResource);
	}

	public void listContainers() {

		listType = new TypeToken<ArrayList<Container>>() {
		}.getType();
		
		String result = HttpHandler.httpGet(dockerUrlResource);
		JsonData.jsonToObject(result, DockerContainersImpl.this, listType);
		
		resetUrl();
	}

	public void startContainers() {
			
		HttpHandler.httpPost(dockerUrlResource, "start");
		resetUrl();
	}

	public void stopContainers() {

		HttpHandler.httpPost(dockerUrlResource, "stop");
		resetUrl();
	}
	
	public void infoContainers() {

		String result = HttpHandler.httpGet(dockerUrlResource);
		JsonData.jsonToObject1(result, DockerContainersImpl.this);
		resetUrl();
	}
	
	public void removeContainers() {

		HttpHandler.httpDelete(dockerUrlResource);
		resetUrl();
	}
	
	// reset url since singleton
	public void resetUrl() {
		dockerUrlResource = "http://222.201.187.162:2375/containers";
	}

}
