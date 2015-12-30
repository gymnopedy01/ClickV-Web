package com.plaync.nshop.api.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class VerifyDao {

	Map<String, Map<String,String>> verifyList = new HashMap<String, Map<String,String>>();
	
	public void addQrSecret(String userId, String qrSecret) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("qrSecret", qrSecret);
		map.put("verify", "N");
		
		verifyList.put(userId, map);
	}

	public Map<String,Map<String,String>> listVerify() {
		return verifyList;
	}

	public boolean verify(String userId, String qrSecret) {
	
		Map<String, String> verify = verifyList.get(userId);
		
		if (qrSecret.equals(verify.get("qrSecret"))) {
			
			if("N".equals(verify.get("verify"))) {
				//베리파이 완료된것을 넣어준다.
				verify.put("verify", "Y");
				return true;
			}
			
		}
		
		return false;
		
	}

	public Map<String,String> getVerify(String userId) {
		return verifyList.get(userId);
	}

}
