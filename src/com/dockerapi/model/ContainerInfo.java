package com.dockerapi.model;

public class ContainerInfo {

	private String Id;
	private String Name;
	private String Image;
	private String Created;
	private String Running;
	private String StartedAt;
	private String PublishAllPorts;
	private String Links;
	private String OpenStdin;
	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	@Override
	public String toString() {
		return "ContainerInfo [Id=" + Id + ", Name=" + Name + ", Image="
				+ Image + ", Created=" + Created + ", Running=" + Running
				+ ", StartedAt=" + StartedAt + ", PublishAllPorts="
				+ PublishAllPorts + ", Links=" + Links + ", OpenStdin="
				+ OpenStdin + "]";
	}
	public void setName(String name) {
		Name = name;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public String getCreated() {
		return Created;
	}
	public void setCreated(String created) {
		Created = created;
	}
	public String getRunning() {
		return Running;
	}
	public void setRunning(String running) {
		Running = running;
	}
	public String getStartedAt() {
		return StartedAt;
	}
	public void setStartedAt(String startedAt) {
		StartedAt = startedAt;
	}
	public String getPublishAllPorts() {
		return PublishAllPorts;
	}
	public void setPublishAllPorts(String publishAllPorts) {
		PublishAllPorts = publishAllPorts;
	}
	public String getLinks() {
		return Links;
	}
	public void setLinks(String links) {
		Links = links;
	}
	public String getOpenStdin() {
		return OpenStdin;
	}
	public void setOpenStdin(String openStdin) {
		OpenStdin = openStdin;
	}
	
}
