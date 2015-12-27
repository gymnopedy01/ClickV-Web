package com.plaync.nshop.api.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class VerifyDao {

	Map<String,String> verifyList = new HashMap<String,String>();
	
	public void addQrSecret(String userId, String qrSecret) {
		verifyList.put(userId, qrSecret);
	}

	public Map<String,String> listVerify() {
		return verifyList;
	}

	public boolean verify(String userId, String qrSecret) {
	
		if (qrSecret.equals(verifyList.get(userId))) {
			return true;
		}
		
		return false;
		
	}

}
