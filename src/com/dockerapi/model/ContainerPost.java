package com.dockerapi.model;

public class ContainerPost {
	
	private String jsonPost;
	
	private String Cmd;
	private String Image;
	private String HostConfig;
	private String Volumes;
	
	public String getCmd() {
		return Cmd;
	}
	public void setCmd(String cmd) {
		Cmd = cmd;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public String getHostConfig() {
		return HostConfig;
	}
	public void setHostConfig(String hostConfig) {
		HostConfig = hostConfig;
	}
	public String getVolumes() {
		return Volumes;
	}
	public void setVolumes(String volumes) {
		Volumes = volumes;
	}
	
	
}
