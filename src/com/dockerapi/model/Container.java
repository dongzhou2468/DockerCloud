package com.dockerapi.model;

public class Container {
	
	private String Id;
	private String Command;
	private long Created;
    private String Image;
    private String[] Names;
    private Port[] Ports;
    private String Status;
    private String subId;
    private String name;
    private String containerStatus;
    private String website;
    
    public String getContainerStatus() {
		return containerStatus;
	}

	public void setContainerStatus() {
		this.containerStatus = Status.startsWith("Exited")? "Exited" : "Running";
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite() {
		if(Ports.length != 0)
			this.website = "http://222.201.187.162:" + Ports[0].PublicPort;
		else this.website = "javascript:void(0);";
	}

	public String getName() {
		return name;
	}

	public void setName() {
		this.name = Names[0].substring(1);
	}

	public String getSubId() {
		return subId;
	}

	public void setSubId() {
		this.subId = Id.substring(0,12);
	}

	public String getCommand() {
		return Command;
	}

	public void setCommand(String command) {
		Command = command;
	}

	public long getCreated() {
		return Created;
	}

	public void setCreated(long created) {
		Created = created;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public String[] getNames() {
		return Names;
	}

	public void setNames(String[] names) {
		Names = names;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Override
    public String toString() {
        return "Container{" + "id=" + Id + ", command=" + Command + ", image=" + Image + 
        		", created=" + Created + ", status=" + Status + ", containerStatus=" + containerStatus + ", names=" + name + ", website=" + website + ", subid=" + subId + ", ports" + Ports.length + '}';
    }

	public String getPorts() {
		return (Ports.length != 0)?Ports[0].toString():"Empty";
	}

	public void setPorts(Port[] ports) {
		this.Ports = ports;
	}

}
