package com.plaync.nshop.api.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.plaync.nshop.Result;
import com.plaync.nshop.api.service.ClicVMemberService;
import com.plaync.nshop.api.service.ClickVVerifyService;



/**
 * ��ĬV��Ʈ�ѷ�
 * 
 * HOME IP : 123.98.179.219
 * 
 */
@Controller
public class ClickVController {

	@Autowired
	ClicVMemberService clickvMemberService;

	@Autowired
	ClickVVerifyService clickvVerifyService;
	
//API START 
	
	//����� ���� API
	@ResponseBody
	@RequestMapping(value = "register.json", method = RequestMethod.GET)
	public Result registerJson(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		System.out.println("ClickV register");
		
		String userId = params.get("userId");
		String telId = params.get("telId");
		
		if (userId == null || telId == null) {
			return new Result("INVALID_PARAMETER");
		}
		
		
		if (clickvMemberService.isRegistered(userId)) {
			return new Result("ALREADY_REGISTERED");
		}
	
		clickvMemberService.registerMember(userId, telId);
		
		return new Result("SUCCESS");
		
	}
	
	//����� ����Ʈ API
	@ResponseBody
	@RequestMapping(value = "userList.json", method = RequestMethod.GET)
	public Result<Map<String, String>> userListJson(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		System.out.println("ClickV list");
		
		return new Result<Map<String, String>>(clickvMemberService.listMember());
	}
	
	//���� API
	@ResponseBody
	@RequestMapping(value = "verify.json", method = RequestMethod.GET)
	public Result verifyJson(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		
		String userId = params.get("userId");
		String qrSecret = params.get("qrSecret");
		
		System.out.println("ClickV verify : " + userId );
		
		if (!clickvMemberService.isRegistered(userId)) {
			return new Result("NOT_REGISTERED");
		}
	
		if (!clickvVerifyService.verify(userId, qrSecret)) {
			return new Result("INVALID_QRCODE");
		}
		
		return new Result("SUCCESS");
		
	}
	
	//Ȱ��ȭ�� ����QR ����Ʈ
	@ResponseBody
	@RequestMapping(value = "verifyList.json", method = RequestMethod.GET)
	public Result<Map<String, Map<String, String>>> list(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		System.out.println("ClickV list");
		
		return new Result<Map<String, Map<String, String>>>(clickvVerifyService.listVerify());
	}

	@ResponseBody
	@RequestMapping(value = "verifyHistory.json", method = RequestMethod.GET)
	public Result<List<Map<String,String>>> verifyhistory(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		System.out.println("ClickV History");
		
		String userId = params.get("userId");
		return new Result<List<Map<String,String>>>(clickvVerifyService.historyVerify(userId));
	}
	
	@ResponseBody
	@RequestMapping(value = "userInfo.json", method = RequestMethod.GET)
	public Result<ClickVUserInfo> clickvUserInfo(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		System.out.println("ClickV History");
		
		String telId = params.get("telId");
		return new Result<ClickVUserInfo>(clickvMemberService.getMember(telId));
	}
	
//API END 

//	WEB PAGE START
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		String userId = params.get("userId");
		String telId = params.get("telId");

		model.addAttribute("userId", userId);
		model.addAttribute("telId", telId);
		
		//���Կ��� Ȯ��
		if (clickvMemberService.isRegistered(userId)) {
			return "alreadyRegister";
		}
		
		return "register";
	}

	@RequestMapping(value = "verify", method = RequestMethod.GET)
	public String verify(@RequestParam Map<String,String> params, Model model) throws Exception {

		String userId = params.get("userId");
		if (userId == null) {userId = "fuga@ncsoft.com";}
		model.addAttribute("userId", userId);
		
		//���Կ��� �׽�Ʈ
		if (!clickvMemberService.isRegistered(userId)) {
			return "notRegister";
		}
		
		return "verify";
	}

	@RequestMapping(value = "registerComplete", method = RequestMethod.GET)
	public String registerComplete(@RequestParam Map<String,String> params, Model model) throws Exception {

		String userId = params.get("userId");
		model.addAttribute("userId", userId);
		
		//���Կ��� �׽�Ʈ
		if (!clickvMemberService.isRegistered(userId)) {
			String telId = params.get("telId");
			model.addAttribute("telId", telId);
			return "notRegister";
		}
		
		model.addAttribute("telId", clickvMemberService.listMember().get(userId));
		
		return "registerComplete";
	}

	@RequestMapping(value = "verifyComplete", method = RequestMethod.GET)
	public String verifyComplete(@RequestParam Map<String,String> params, Model model) throws Exception {

		String userId = params.get("userId");
		if (userId == null) {userId = "fuga@ncsoft.com";}
		model.addAttribute("userId", userId);
		
		//���Կ��� �׽�Ʈ
		if (!clickvMemberService.isRegistered(userId)) {
			return "notRegister";
		}
		
		model.addAttribute("telId", clickvMemberService.listMember().get(userId));
		
		if (!clickvVerifyService.isVerified(userId)) {
			return "notVerify";
		}
		
		return "verifyComplete";
	}
	
//	WEB PAGE END
	
	
	
//QR  IMAGE START	
	
	@RequestMapping(value = "register.qr", method = RequestMethod.GET)
	public String registerQR(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		String userId = params.get("userId");
		String telId = params.get("telId");
		
		//���Կ��� Ȯ��
		if (clickvMemberService.isRegistered(userId)) {
			return "alreadyRegister";
		}
		
		String text = "clickv://register.json"
				+ "?userId=" + userId
				+ "&telId=" + telId;
		
		return "forward:/qrImage?text=" + URLEncoder.encode(text);
	}

	@RequestMapping(value = "verify.qr", method = RequestMethod.GET)
	public String verifyQR(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		String userId = params.get("userId");
		//���Կ��� �׽�Ʈ
		if (!clickvMemberService.isRegistered(userId)) {
			return "notRegister";
		}
		
		String qrSecret = clickvVerifyService.makeQrSecret(userId);
		
		String text = "clickv://verify.json?"
				+ "userId=" + userId
				+ "&qrSecret=" + qrSecret;
		
		return "forward:/qrImage?text=" + URLEncoder.encode(text);
	}

	
	@RequestMapping(value = "qrImage", method = RequestMethod.GET)
	public void qrImage(@RequestParam Map<String,String> params, Model model, HttpServletResponse response) throws Exception {
	
		
		QRCodeWriter qrWriter = new QRCodeWriter();

		String text = params.get("text");

		if( text == null ) {
			text = "";
		}

		int width = 100;
		int height = 100;

		//text = new String(text.getBytes("UTF-8"), "ISO-8859-1");
		
		BitMatrix bitMatrix = qrWriter.encode(text, BarcodeFormat.QR_CODE, width, height);
		
//		out.clear(); // clear buffer

		ServletOutputStream outputStream = response.getOutputStream();

		MatrixToImageWriter.writeToStream(bitMatrix, "png", outputStream);
		
	}

}
