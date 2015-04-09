package com.dockerapi.model;

public class Port {
	
    public int PrivatePort;
    public int PublicPort;
    public String Type;
    public String IP;

    public String toString() {
        return IP + ":" + PublicPort + "->" + PrivatePort + 
        		"/" + Type;
    }
    
}
