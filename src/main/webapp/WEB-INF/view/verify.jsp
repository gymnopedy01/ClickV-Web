<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

인증 계정 :: ${userId}<br/>

<img src="verify.qr?userId=${userId}"/>


<a href="verifyComplete?userId=${userId}">인증완료</a>