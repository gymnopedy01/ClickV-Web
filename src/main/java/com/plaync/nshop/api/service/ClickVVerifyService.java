package com.plaync.nshop.api.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClickVVerifyService {

	@Autowired
	VerifyDao verifyDao;
	
	@Autowired
	VerifyHistoryDao verifyHistoryDao;
	
	public String makeQrSecret(String userId) {
		
		Random random = new Random();
		String qrSecret = String.valueOf(random.nextInt(1000));
		
		verifyDao.addQrSecret(userId, qrSecret);
		
		return qrSecret;
	}

	public Map<String, Map<String, String>> listVerify() {
		// TODO Auto-generated method stub
		return verifyDao.listVerify();
	}

	public boolean verify(String userId, String qrSecret) {
		verifyHistoryDao.addVerifyHistory(userId);
		return verifyDao.verify(userId, qrSecret);
	}

	public List<Map<String,String>> historyVerify(String userId) {
		return verifyHistoryDao.listVerifyHistory(userId);
	}

	public boolean isVerified(String userId) {
		Map<String,String> verify = verifyDao.getVerify(userId);
		
		if (verify == null) {
			return false;
		}
		
		return "Y".equals(verify.get("verify"));
	}
	
}
