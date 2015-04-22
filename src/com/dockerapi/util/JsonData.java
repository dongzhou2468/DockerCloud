package com.dockerapi.util;

import java.lang.reflect.Type;
import java.util.ArrayList;

import com.dockerapi.client.DockerContainersImpl;
import com.dockerapi.client.DockerImagesImpl;
import com.dockerapi.model.*;
import com.dockerapi.model.ContainerInfo;
import com.google.gson.Gson;

/*
 * map json data to objects
 * dci: class context
 */
public class JsonData {

	public static void jsonToObject(String jsonData, DockerContainersImpl dci, Type listType) {
		Gson gson = new Gson();
		System.out.println(jsonData);
		ArrayList<Container> cList = gson.fromJson(jsonData, listType);
		for (int i = 0; i < cList.size(); i++) {
			cList.get(i).setSubId();
			cList.get(i).setName();
			cList.get(i).setContainerStatus();
			cList.get(i).setWebsite();
		}
		dci.setcList(cList);
		System.out.println(dci.toString());
		System.out.println(cList.get(0).toString());
		System.out.println(cList.get(1).toString());
	}
	
	public static void jsonImageToObject(String jsonData, DockerImagesImpl dii, Type listType) {
		Gson gson = new Gson();
		System.out.println(jsonData);
		ArrayList<Image> iList = gson.fromJson(jsonData, listType);
		for (int i = 0; i < iList.size(); i++) {
			iList.get(i).setDate();
			iList.get(i).setName();
			iList.get(i).setSubId();
			iList.get(i).setSizeUnit();
		}
		dii.setiList(iList);
		System.out.println(dii.toString());
		System.out.println(iList.get(0).toString());
		System.out.println(iList.get(1).toString());
	}
	
	public static void jsonToObject1(String jsonData, DockerContainersImpl dci) {
		Gson gson = new Gson();
		System.out.println(jsonData);
		ContainerInfo ci = gson.fromJson(jsonData, ContainerInfo.class);
		
		System.out.println(ci.toString());
	}
	
	
}
