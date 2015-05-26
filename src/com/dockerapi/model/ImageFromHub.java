package com.dockerapi.model;

public class ImageFromHub {

	private String name;
	private String description;
	private int star_count;
	private boolean is_official;
	private boolean is_trusted;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getStar_count() {
		return star_count;
	}
	public void setStar_count(int star_count) {
		this.star_count = star_count;
	}
	public boolean isIs_official() {
		return is_official;
	}
	public void setIs_official(boolean is_official) {
		this.is_official = is_official;
	}
	public boolean isIs_trusted() {
		return is_trusted;
	}
	public void setIs_trusted(boolean is_trusted) {
		this.is_trusted = is_trusted;
	}
	
	@Override
	public String toString() {
		return "ImageFromHub [name=" + name + ", description=" + description
				+ ", star_count=" + star_count + ", is_official=" + is_official
				+ ", is_trusted=" + is_trusted + "]";
	}
	
}
