package com.dockerapi.model;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class Image {

	private String Id;
	private String ParentId;
	private long Created;
    private long Size;
    private long VirtualSize;
    private String[] RepoTags;
    
    private String repoTag;
    private String name;
    private String date;
    private String subId;
    private String sizeUnit;
    
    public String getSizeUnit() {
		return sizeUnit;
	}
	public void setSizeUnit() {
		DecimalFormat df = new DecimalFormat("#.00");
		String temp = df.format(VirtualSize / Math.pow(1024, 3));
		if(Double.parseDouble(temp) < 1){
			sizeUnit = df.format(VirtualSize / Math.pow(1024, 2)) + "MB";
		} else {
			sizeUnit = temp + "GB";
		}
	}
	public String getSubId() {
		return subId;
	}
	public void setSubId() {
		subId = Id.substring(0, 12);
	}
	public String getDate() {
		return date;
	}
	public void setDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		date = sdf.format(new Date(Created*1000L));
	}
	public String getRepoTag() {
		return repoTag;
	}
	public String getName() {
		return name;
	}
	public void setName() {
		repoTag = "";
    	for(int i = 0; i < RepoTags.length; i++){
    		repoTag = repoTag + RepoTags[i].split(":")[1] + " ";
    	}
    	name = RepoTags[0].split(":")[0];
	}
    
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getParentId() {
		return ParentId;
	}
	public void setParentId(String parentId) {
		ParentId = parentId;
	}
	public long getCreated() {
		return Created;
	}
	public void setCreated(long created) {
		Created = created;
	}
	public long getSize() {
		return Size;
	}
	public void setSize(long size) {
		Size = size;
	}
	public long getVirtualSize() {
		return VirtualSize;
	}
	public void setVirtualSize(long virtualSize) {
		VirtualSize = virtualSize;
	}
	public String[] getRepoTags() {
		return RepoTags;
	}
	public void setRepoTags(String[] repoTags) {
		RepoTags = repoTags;
	}
	
	@Override
	public String toString() {
		return "Image [Id=" + subId + ", ParentId=" + ParentId + ", date="
				+ date + ", Size=" + Size + ", VirtualSize=" + sizeUnit
				+ ", name=" + name + "]";
	}
}
