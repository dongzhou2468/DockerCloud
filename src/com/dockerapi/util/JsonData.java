package com.dockerapi.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import com.dockerapi.client.DockerContainersImpl;
import com.dockerapi.model.Container;
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
	
	public static void jsonToObject1(String jsonData, DockerContainersImpl dci) {
		Gson gson = new Gson();
		System.out.println(jsonData);
		ContainerInfo ci = gson.fromJson(jsonData, ContainerInfo.class);
		
		System.out.println(ci.toString());
	}
	
	
}
