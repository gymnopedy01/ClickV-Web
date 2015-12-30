<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="http://static.plaync.co.kr/nshop2/ncommon/pg/ncoin/css/ncoin.css">
<script type="text/javascript" language="javascript" src="http://static.plaync.co.kr/common/js/lib/jquery_172_min.js"></script>
<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/resources/js/nshop_paymentpassword.js"></script>
<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/resources/js/nshop.js"></script>
<script type="text/javascript" src="http://static.plaync.co.kr/nshop2/ncommon/pg/ncoin/js/layer_message.js"></script>
<script type="text/javascript" src="http://static.plaync.co.kr/nshop2/ncommon/pg/ncoin/js/ncoin_layer.js"></script>
<script type="text/javascript" src="http://static.plaync.co.kr/nshop2/ncommon/pg/ncoin/js/custom.js"></script>


인증 완료되었습니다.
인증 계정 :: ${userId}<br/>
인증 단말기 :: 옵티머스G2 ${telId}<br/>

<script>
	
	PaymentPassword.submitParentForm('${param.returnFrm}');
	
</script>
