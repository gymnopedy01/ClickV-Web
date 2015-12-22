package com.plaync.nshop.api.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	
	Map<String,String> memberList = new HashMap<String,String>();
	
	public void addMember(String userId, String telId) {
		memberList.put(userId, telId);
	}

	public Map<String,String> listMember() {
		return memberList;
	}
	
	public boolean isRegistered(String userId) {
		return memberList.containsKey(userId);
	}

}
