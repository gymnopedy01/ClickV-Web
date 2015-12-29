package com.plaync.nshop.api.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class VerifyHistoryDao {

	Map<String,List<Map<String,String>>> verifyHistoryList = new HashMap<String,List<Map<String,String>>>();
	
	public void addVerifyHistory(String userId) {
		
		List<Map<String,String>> history = verifyHistoryList.get(userId);
		
		if (history == null) {
			history = new ArrayList<Map<String,String>>();
			verifyHistoryList.put(userId, history);
		}
		
		Map<String,String> userVerifyHisory = new HashMap<String,String>();
		userVerifyHisory.put("site", "nshop");
		userVerifyHisory.put("verificationName", "2차인증");
		userVerifyHisory.put("timestamp", String.valueOf(System.currentTimeMillis()));
		
		
		history.add(userVerifyHisory);
		
	}
	
	public List<Map<String, String>> listVerifyHistory(String userId) {
		return verifyHistoryList.get(userId);
	}
	
}
