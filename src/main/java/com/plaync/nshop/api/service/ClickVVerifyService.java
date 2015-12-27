package com.plaync.nshop.api.service;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClickVVerifyService {

	@Autowired
	VerifyDao verifyDao;
	
	public String makeQrSecret(String userId) {
		
		Random random = new Random();
		String qrSecret = String.valueOf(random.nextInt(1000));
		
		verifyDao.addQrSecret(userId, qrSecret);
		
		return qrSecret;
	}

	public Map<String, String> listVerify() {
		// TODO Auto-generated method stub
		return verifyDao.listVerify();
	}

	public boolean verify(String userId, String qrSecret) {
		return verifyDao.verify(userId, qrSecret);
	}

}
