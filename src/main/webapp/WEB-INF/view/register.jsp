<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>찰칵V 가입 QR코드</h1>

<ul>
	<li>아래 QR코드를 찰칵V 앱으로 인식후 확인 버튼을 눌르면 가입됩니다.</li>
	<li>QR코드 인식 성공 후, 가입완료 링크를 클릭하여 페이지로 이동 합니다.</li>
</ul>

<img src="register.qr?userId=${userId}&telId=${telId}"/>


<a href="registerComplete?userId=${userId}&telId=${telId}">가입완료</a>

