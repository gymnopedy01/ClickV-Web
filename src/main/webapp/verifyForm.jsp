<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h1>찰칵V 인증</h1>

<ul>
	<li>인증을 위한 QR코드를 생성 합니다.</li>
</ul>

<form action="verify" >
	계정 :: <input name="userId" type="text" value="${userId}" style=""/><br/>
	사이트명: <input name="site" type="text" value="${site}" style=""/><br/>
	인증구분: <input name="verificationName" type="text" value="${verificationName}" style=""/><br/>
	<input type="submit" value="ClickV verify" /><br/>	
</form>

