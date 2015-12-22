package com.plaync.nshop.api.controller;

import java.net.URLEncoder;
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
import com.plaync.nshop.api.service.ClicVService;

@Controller
public class ClickVController {

	@Autowired
	ClicVService clickvservice;
	
	@ResponseBody
	@RequestMapping(value = "register.json", method = RequestMethod.GET)
	public Result register(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		System.out.println("ClickV register");
		
		String userId = params.get("userId");
		String telId = params.get("telId");
		
		if (clickvservice.isRegistered(userId)) {
			return new Result("ALREADY_REGISTERED");
		}
	
		clickvservice.registerMember(userId, telId);
		
		return new Result("SUCCESS");
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "list.json", method = RequestMethod.GET)
	public Result<Map<String, String>> list(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		System.out.println("ClickV list");
		
		return new Result<Map<String, String>>(clickvservice.listMember());
	}
	
	
	@RequestMapping(value = "register.qr", method = RequestMethod.GET)
	public String checkQR(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		String text = "clickv://register.json?"
				+ "userId=" +"fuga@ncsoft.com";
				
		return "forward:/qrImage?text=" + text;
	}

	@RequestMapping(value = "verify.qr", method = RequestMethod.GET)
	public String verifyQR(@RequestParam Map<String,String> params, Model model) throws Exception {
		
		String qrSecret = String.valueOf(8887);
		
		String text = "clickv://verify.json?"
				+ "userId=" + "fuga@ncsoft.com"
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
