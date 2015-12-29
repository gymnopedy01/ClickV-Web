<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h1>찰칵V 인증</h1>

<ul>
	<li>인증을 위한 QR코드를 생성 합니다.</li>
</ul>

<form action="verify" >
	계정 :: <input name="userId" type="text" value="fuga@ncsoft.com" style=""/><br/>
	사이트명: nshop
	인증구분: 2차인증
	<input type="submit" value="ClickV verify" /><br/>	
</form>

