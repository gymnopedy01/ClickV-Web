package com.plaync.nshop.api.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClicVMemberService {

	@Autowired
	MemberDao memberDao;
	
	public void registerMember(String userId, String telId) {
		memberDao.addMember(userId, telId);
	}

	public Map<String,String> listMember() {
		return memberDao.listMember();
	}
	
	public boolean isRegistered(String userId) {
		return memberDao.isRegisteredUserId(userId);
	}
	

}
