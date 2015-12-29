package com.plaync.nshop.api.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.plaync.nshop.api.controller.ClickVUserInfo;

@Repository
public class MemberDao {

	
	Map<String,String> memberList = new HashMap<String,String>();
	
	public void addMember(String userId, String telId) {
		memberList.put(userId, telId);
	}

	public Map<String,String> listMember() {
		return memberList;
	}
	
	public boolean isRegisteredUserId(String userId) {
		return memberList.containsKey(userId);
	}

	public ClickVUserInfo getMember(String telId) {
		
		
		if (!memberList.containsValue(telId)) {
			return null;
		}
		
		for(String userId : memberList.keySet()) {
			
			if ( telId.equals(memberList.get(userId))) {
				
				ClickVUserInfo clickvUserInfo = new ClickVUserInfo();
				clickvUserInfo.setUserId(userId);
				clickvUserInfo.setTelId(telId);
				
				return clickvUserInfo;

			}
			
		}
		
		return null;
		
	}

}
