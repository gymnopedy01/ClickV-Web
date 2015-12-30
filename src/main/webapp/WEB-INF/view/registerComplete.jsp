<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>결제 비밀번호 입력</title>


<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">

<script type="text/javascript">
//	document.domain="plaync.com";
	var shopName = 'aion';
	var gameCode = '27';
	var orderConfig = {
			shopName : 'aion',
			lineage1 : 'lineage',
			lineage2 : 'lineage2',
			aion : 'aion',
			bns : 'bns'
		};
</script>
<link rel="stylesheet" type="text/css" href="http://static.plaync.co.kr/nshop2/ncommon/pg/ncoin/css/ncoin.css">
<script type="text/javascript" language="javascript" src="http://static.plaync.co.kr/common/js/lib/jquery_172_min.js"></script>
<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/resources/js/nshop_paymentpassword.js"></script>
<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/resources/js/nshop.js"></script>
<script type="text/javascript" src="http://static.plaync.co.kr/nshop2/ncommon/pg/ncoin/js/layer_message.js"></script>
<script type="text/javascript" src="http://static.plaync.co.kr/nshop2/ncommon/pg/ncoin/js/ncoin_layer.js"></script>
<script type="text/javascript" src="http://static.plaync.co.kr/nshop2/ncommon/pg/ncoin/js/custom.js"></script>


<style>
	.click_obj {background:url('http://static.plaync.co.kr/nshop2/ncommon/pg/ncoin/image/keypad/num.gif') no-repeat left top; cursor:pointer;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		if (orderConfig.shopName == 'myshop') {
			// 마이샵에서는 팝업형태로 띄운다.
			resize();
			$(".oreder_renew .header .modal_close").hide();
		} else {
			// 주문서에서는 레이어 형태로 띄운다.
			setpos();
		}
		
		jQuery("#password1_1").focus();

		jQuery(".btn_txtgsmall").live("click",function(){
			jQuery(".secu_infoview").show();
		});

		jQuery(".secu_infoview .btns_close").live("click",function(){
			jQuery(".secu_infoview").hide();
		});
		
		jQuery("#label_check").live("click",function(){
			if (jQuery("#timeCheck").attr("checked")) {
				jQuery("#timeFlag").val(true);
			} else {
				jQuery("#timeFlag").val(false);
			}
		});
		 
		function resize() {
			// 위치제어
			var ifr = jQuery(".modal");
			var ifrw = ifr.width();
			var ifrh = ifr.height();
			
			window.resizeTo(ifrw + 25, ifrh + 75);
		}
		
		function setpos() {
			// 위치제어
			var ifr = jQuery(".modal");
			var ifrw = ifr.width();
			var ifrh = ifr.height();
			ifr.css({"position":"absolute","left":"50%","top":"50%","margin-left":-(ifrw/2),"margin-top":-(ifrh/2)});
			var winxxh = jQuery(parent.window).height();
			if (ifrh>winxxh) {
				var ifrxh = jQuery(parent.document).find("#layer_order");
				ifrxh.css("height",ifrh+10);
			}
		}
		
		// 현재 키패드의 커서값 저장
		var focuskey = 1;
		
		// paymentpassword.key pad
		var iskeypad = jQuery(".pad").length;
		if (iskeypad) {
			otparray = [0,1,2,3,4,5,6,7,8,9];
			keyarray = [];
			otparray.sort( function(){return Math.random()*2-1;} );
			
			for (var i=0; i<otparray.length; i++) {
				if (i<=5) {
					jQuery(".pad li:eq("+i+")").addClass("num"+otparray[i]).html(otparray[i]);
				} else if (i>=6) {
					jQuery(".pad li:eq("+(i+1)+")").addClass("num"+otparray[i]).html(otparray[i]);
				} else {
					
				}
				jQuery(".pad li:eq(6)").addClass("reset").html("모두 지우기");
			}
			
			// 키패드 클릭시
			jQuery(".pad li").click(function(){
				
				var isreset = jQuery(this).hasClass("reset");
				var isdelete = jQuery(this).hasClass("delete");
				if (isreset || isdelete) {
					return false;
				} else {
					if (keyarray.length >= 8) {
						alert('결제 비밀번호는 숫자 6자 이상 8자 이하만 가능합니다.');
						return false;
					}
					
					var otp_var = jQuery(this).html();
					jQuery("#password1_" + focuskey).val(otp_var);
					
					var otp_arr = keyarray.push(otp_var);
					var opt_res = keyarray.join('');
					jQuery("#password0").val(opt_res);
					
					focuskey++;
					
				}
				
				// 버튼 활성화
				//if(jQuery(".otp_form").val() == 0 || jQuery(".otp_form").val() == null) {
				//	$(".otp_keypad_guide").next(".btn_group").find("button").removeClass().addClass("btn b_type_3").css("cursor","default");
				//} else {
				//	$(".otp_keypad_guide").next(".btn_group").find("button").removeClass().addClass("btn b_type_1").css("cursor","pointer");
				//}
			});
			
			// reset
			jQuery(".pad li.reset").click(function(){
				keyarray = [];
				jQuery("#password0").val(keyarray);
				
				for(j=1; j<=focuskey; j++){
					jQuery("#password1_" + j).val('');
				}
				
				focuskey = 1;
			
			});
			
			// delete
			jQuery(".pad li.delete").click(function(){
				
				keyarray.pop();
				opt_res = keyarray.join('');
				jQuery("#password0").val(opt_res);
				
				if(focuskey > 1) {
					jQuery("#password1_" + (focuskey - 1)).val('');
					focuskey--;
				}
				
			});
			
		}
		
		
	});
	
	function setPasswordFocus(value) {
		jQuery("#focusType").val(value);
		return false;
	}
	
	PaymentPassword.confirmPassword = function(frm) {
		$("#" + frm).submit();
	};
	
</script>
</head>
<body class="oreder_renew">

<script language="javascript">
	window.onload = function() {
		
	
	}
</script>


	
		
	<div class="modal">
		<div class="header">
			<h3 class="otp">찰칵V 인증 서비스</h3>
			<span class="modal_close" onclick="closeModal();">modal window close</span>
		</div>
	
		<div class="content">
	
			
			<h3>찰칵V 가입 완료되었습니다</h3>
			
			가입 계정 :: ${userId}<br/>
			가입 단말기 :: ${telId}<br/>
	
		</div>
	
		<!-- button -->
		<div class="btn_guide">
			<button class="btnb_confirm" onclick="javascript:location.href='verify?userId=${userId}&telId=${telId}'">가입</button>
		</div>
	
	</div>
	
	













































<script type="text/javascript">
jQuery('.close').bind('click',function () {
	closeModal();
});

function closeModal() {
	if (parent.jQuery('#layer_modal').css('display')=='block') {
		parent._isProgress = false;
		var parent_win = jQuery(parent.document).find("#agrIframe");
		var parent_modal = jQuery(parent.document).find("#layer_modal");
		parent_modal.remove();
		parent_win.remove();	
	} else return;
}

</script>


</body>
</html>