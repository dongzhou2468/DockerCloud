package com.dockerapi.model;

public class Container {
	
	private String Id;
	private String Command;
	private long Created;
    private String Image;
    private String[] Names;
    private Port[] Ports;   //Example value "49164->6900, 49165->7100"
//    private int SizeRootFs;
//    private int SizeRw;
    private String Status;
    private String subId;
	
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
        		", created=" + Created + ", status=" + Status + ", names=" + Names[0] + ", subid=" + subId + ", ports" + Ports.length + '}';
    }

	public String getPorts() {
		return (Ports.length != 0)?Ports[0].toString():"Empty";
	}

	public void setPorts(Port[] ports) {
		this.Ports = ports;
	}

}
