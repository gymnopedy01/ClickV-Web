<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<link rel="shortcut icon" href="http://static.plaync.co.kr/nshop2/ncommon/image/plaync.ico" type="http://static.plaync.co.kr/nshop2/ncommon/image/x-icon" />
	<link rel="icon" href="http://static.plaync.co.kr/nshop2/ncommon/image/plaync.ico" type="http://static.plaync.co.kr/nshop2/ncommon/image/x-icon" />

	
	
	
	<link rel="stylesheet" type="text/css" href="http://static.plaync.co.kr/nshop2/ncommon/css/order.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="http://static.plaync.co.kr/nshop2/ncommon/css/nshop.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="http://static.plaync.co.kr/nshop2/common/css/global.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="http://static.plaync.co.kr/nshop2/common/css/popup.css" media="screen" />

	
	
	
	<script type="text/javascript" language="javascript" src="http://static.plaync.co.kr/common/js/global.js"></script>

	<script type="text/javascript" language="javascript" src="http://static.plaync.co.kr/common/js/lib/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" language="javascript" src="http://static.plaync.co.kr/nshop2/ncommon/js/nshop_layer_message.js"></script>
	<script type="text/javascript" language="javascript" src="http://static.plaync.co.kr/nshop2/ncommon/js/modal_order.js"></script>
	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/nshop_paymentpassword.js"></script>

	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/order_shop.js"></script>
	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/nshop_layer.js"></script>
	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/nshop.js"></script>

	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/nshop_bill.js"></script>
	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/nshop_bill_others.js"></script>
	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/nshop_bill_coupon.js"></script>
	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/common/jquery-common.js"></script>
	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/orderform_data.js"></script>
	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/nshop_bill_game.js"></script>
	<script type="text/javascript" language="javascript" src="http://aionnshop.plaync.com/aion/resources/js/nshop_bill_optional.js"></script>

	<script type="text/javascript">
		//document.domain="plaync.com";
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
	<title>상품구매</title>
</head>
<body>
	











































































































<script type="text/javascript">

	// document ready
	$(document).ready(function() {

		// UI 제어
		controllUI();
		// DOM event
		eventUI();
		// 사용 가능 쿠폰 리스트 가져오기 (nshop_order_coupon.js)
		//CouponFunction.getUsableCouponCount();

		// 보상값 계산
		var goodsId = $("#representGoodsId").val();
		BillFunction.modifyGoodsCount(goodsId);

		// N포인트 부족 여부 체크
		BillFunction.displayLackNCoin();
	});

	// UI 제어
	function controllUI() {
		// 레이어 조정
		setpos();

		// 쿠폰 수량에 포커스
		$(".goodsCount").focus();
		// 쿠폰 취소 버튼 hide
		$("#btn_coupon_cancel").hide();
		// 적용쿠폰 영역 hide (text area)
		$("#applyCoupon").hide();
	}

	// UI event
	function eventUI() {
		// 결제 알람 메일.show
		$(".chargeNotice").on("click",function(){
			$(".charge_notice_ly").show();
		});
	}

	// 구매 취소 alert
	function orderformCancel() {
		confirmCancel("구매를 취소하시겠습니까?");
	}

	// "동의 및 구매" 버튼 클릭 시 구매 진행 (참고 : 충전 완료 시 해당 function 호출 됨)
	function purchase() {
		// 받는 캐릭터 목록 추출
		OrderGameCommon.makeReceiverCharacterHtml();
		// 구매 진행
		BillFunction.purchase();
	}

</script>


<form id="paymentPasswordForm" name="paymentPasswordForm" action="javascript:callbackPaymentPassword();"></form>

<div class="order_container">
	<div class="header">
		<h1 class="order">
			<span class="order">상품구매</span>
		</h1>
		<span class="close" onclick="orderformCancel();">닫기</span>
	</div>

	<form id="purchaseForm" name="purchaseForm" action="purchase.jsp" method="post">
	
	
	<input type="hidden" id="totalRewardAmount" name="totalRewardAmount">
	<input type="hidden" id="representGoodsId" value="200411">

	
	<input type="hidden" id="useCoupon" name="useCoupon" value="false"> 
	<input type="hidden" id="discountUserCouponId" name="discountUserCouponId" value="0"> 
	<input type="hidden" id="couponDiscountAmount" name="couponDiscountAmount" value="0"> 
	<input type="hidden" id="discountValueType"> 
	<input type="hidden" id="discountValue"> 

	
	<input type="hidden" id="ncoinURL" value="https://ncoin.plaync.com">
	<input type="hidden" id="tid" name="tid" value="tid:832917ba-98ba-4183-bede-435d04ec4a15">
	<input type="hidden" id="receiverCharacterHtml" name="receiverCharacterHtml">
	<input type="hidden" id="goodsTypeName" value="item">
	<input type="hidden" id="portalName" value="애로다이노스">
	

	<div class="content" class="background:white">
		<!-- ========================================================= -->
		<!-- 받는 계정 -->
		<!-- ========================================================= -->
		




































































































































	
	

	
	
	
	
	

	
	
		
			
				











































<script type="text/javascript">

function checkReceiveCharacter(event) {
	// 내 캐릭터 선택
	BillFunction.checkAionCharacter(event);
	// make param
	makeReceiverInfo(event);
	//결제 금액 계산
	BillFunction.setTotalAmount();

	// 캐릭터 선택 전 이미 쿠폰을 사용한 경우
	var useCoupon = $("#useCoupon").val();
	if (useCoupon == "true") {
		var representGoodsId = $("#representGoodsId").val();
		var discountValueType = $("#discountValueType").val();
		var discountValue = $("#discountValue").val();
		BillFunction.setUseCouponAmount(representGoodsId, discountValueType, discountValue);
	}
}

function makeReceiverInfo(event) {

	// 1회 구매 수량 체크
	$("input[name=goodsCounts]").each(function() {
		var maxOrderCount = $(this).attr('maxOrderCount');
		if (maxOrderCount == 1) {
			var characterCount = $("input[id^=checkboxSelectCharacter]:checked").size();

			if ( characterCount > maxOrderCount) {
				$(event).attr('checked', false);
				LayerFunction.alert('캐릭터를 하나만 선택해 구매할 수 있는 상품입니다.');
				return false;
			}
		}
	});

	// 패키지이용권 구매 시 받는 사람 한 명 선택되어 있는지 체크
	var goodsTypeName = $("#goodsTypeName").val();
	if (goodsTypeName == "playPackage") {
		var characterCount = $("input[id^=checkboxSelectCharacter]:checked").size();
		if (characterCount > 1) {
			$(event).attr('checked', false);
			LayerFunction.alert('해당 상품은 1회 당 최대 1개까지 주문이 가능 합니다.');
			return false;
		}
	}

	$("#receiverCharacter").val(""); // 받는 사람 초기화
	var receiverCharacter = "";
	$("input[id^=checkboxSelectCharacter]:checked").each(function() {
		var receiverInfoArr = $(this).val();
		receiverCharacter += receiverInfoArr + ",";
	});

	// 받는 사람 셋팅
	var receiverResult = receiverCharacter.substring(0, receiverCharacter.length - 1);
	$("#receiverCharacter").val(receiverResult);

	$("input[name=goodsCounts]").each(function() {
		if ($(this).attr("id") != null) {
			var goodsId = $(this).attr("id").replace(/goodsCount/, '');
			BillFunction.modifyGoodsCount(goodsId);
		}
	});
}

$(document).ready(function(){

	var selectedCharactorAreaTxt = "수령하실 <span class='emphasis'>캐릭터</span>를 선택해 주세요. <span class='btn_receiver_char showList'>받는 캐릭터</span>";
	$("#selectedCharactorArea").html(selectedCharactorAreaTxt);

	$("input[id^=checkboxSelectCharacter]").on("click",function(){
		var characterCount = $("input[id^=checkboxSelectCharacter]:checked").size();
		if (characterCount == 0) { // 선택한 캐릭터가 없을 때
			$("#selectedCharactorArea").html(selectedCharactorAreaTxt);
			$(".cell_nchar").text("0개");
		} else {
			$("#selectedCharactorArea").html("<span class='link showchar'>" + characterCount + "</span>개의 캐릭터가 선택되었습니다. <span class='btn_receiver_char showList'>받는 캐릭터</span>");
			$(".cell_nchar").text(characterCount + "개");
		}

		$("#characterCount").text(characterCount);

		var html = "";
		$("input[id^=checkboxSelectCharacter]:checked").each( function(index) {
			var charInfo = $(this).parent().find("label").text();
			html += "<li>" + charInfo + "</li>";
		});
		$("#orderAllMyList > li").remove();
		$("#orderAllMyList").append(html);


		// 받는 서버 선택 show
		$(".showList").on("click", showList);
	});

	// 받는 서버 선택 show
	$(".showList").on("click", showList);

	function showList(e) {

		// 부가서비스를 통한 구매 요청 시 control
		var pass = OrderGameOptional.receiverCharacterButtonControl();
		if (pass) {
			return;
		}

		var characterListCnt = $(".character > li").size();
		if (characterListCnt == 0) {
			LayerFunction.alert("받는 캐릭터가 존재하지 않습니다.");
			return;
		}

		$("#receiveCharacterBalloonHelp").hide();
		$(".info_serverlist").show();
	}

	// 확인 버튼 클릭 시 레이어 닫기
	$(".btn_stext,.close").on("click", function() {
		$(".info_serverlist").hide();
	});

	// show character (받는 캐릭터 선택 풍선 레이어)
	$(document).on("mouseover", ".showchar",function(){
		var pos = jQuery(this).offset();
		/*var posx = (pos.left) - 490;
		console.log("posx "+posx);*/
		var setno = jQuery(".set").length;
		if(setno==1) {
			//var posy = (pos.top)-45;
			var posy = (pos.top)-27;
		} else {
			//var posy = (pos.top)+25;
			var posy = (pos.top)-65;
		}
		var obj = jQuery(".info_charlist");
		obj.css({"top":posy});
		obj.show();
	});
	$(document).on("mouseleave", ".showchar" ,function(){
		$(".info_charlist").hide();
	});

	// 부가서비스 구매 화면 control
	OrderGameOptional.receiverChracterOptionalControl();
});

</script>

<input type="hidden" id="receiverCharacter" name="receiverCharacter">

<div class="info_nickname dashline">
	<div class="set">
		<span class="btnw_reciChar">받는 캐릭터 선택</span>
		<span class="nick" id="selectedCharactorArea"></span>
	</div>

	<p class="msg_selser" id="receiveCharacterBalloonHelp" style="display:none;"><span>받는 캐릭터를 선택해 주세요.</span></p>
	<div class="info_serverlist">
		<span class="close">close server list</span>
		<ol class="character">
			
			<li id="146677">
				<input type="checkbox" id="checkboxSelectCharacter_76_146677" name="checkboxSelectCharacter_76_146677" value="76_2ECD3AA6-8DD4-E011-89B1-E61F135E992F_146677_매초풍071" onclick="checkReceiveCharacter(this);" />
				<label for="checkboxSelectCharacter_76_146677">
					매초풍071 Lv.1  [아누하르트] 천족 정찰자
				</label>
				<input type="hidden" id="characterInfo_76_146677" value="76_146677_매초풍071_천족_정찰자_1_0_여" />
			</li>
			
			<li id="146676">
				<input type="checkbox" id="checkboxSelectCharacter_76_146676" name="checkboxSelectCharacter_76_146676" value="76_2ECD3AA6-8DD4-E011-89B1-E61F135E992F_146676_가카071" onclick="checkReceiveCharacter(this);" />
				<label for="checkboxSelectCharacter_76_146676">
					가카071 Lv.1  [아누하르트] 천족 법사
				</label>
				<input type="hidden" id="characterInfo_76_146676" value="76_146676_가카071_천족_법사_1_0_여" />
			</li>
			
			<li id="146674">
				<input type="checkbox" id="checkboxSelectCharacter_76_146674" name="checkboxSelectCharacter_76_146674" value="76_2ECD3AA6-8DD4-E011-89B1-E61F135E992F_146674_운지071" onclick="checkReceiveCharacter(this);" />
				<label for="checkboxSelectCharacter_76_146674">
					운지071 Lv.1  [아누하르트] 천족 정찰자
				</label>
				<input type="hidden" id="characterInfo_76_146674" value="76_146674_운지071_천족_정찰자_1_0_여" />
			</li>
			
			<li id="1500748">
				<input type="checkbox" id="checkboxSelectCharacter_49_1500748" name="checkboxSelectCharacter_49_1500748" value="49_2ECD3AA6-8DD4-E011-89B1-E61F135E992F_1500748_두쿠043" onclick="checkReceiveCharacter(this);" />
				<label for="checkboxSelectCharacter_49_1500748">
					두쿠043 Lv.15  [페르노스] 천족 치유성
				</label>
				<input type="hidden" id="characterInfo_49_1500748" value="49_1500748_두쿠043_천족_치유성_15_0_남" />
			</li>
			
			<li id="1577509">
				<input type="checkbox" id="checkboxSelectCharacter_49_1577509" name="checkboxSelectCharacter_49_1577509" value="49_2ECD3AA6-8DD4-E011-89B1-E61F135E992F_1577509_윈두043" onclick="checkReceiveCharacter(this);" />
				<label for="checkboxSelectCharacter_49_1577509">
					윈두043 Lv.44  [페르노스] 천족 살성
				</label>
				<input type="hidden" id="characterInfo_49_1577509" value="49_1577509_윈두043_천족_살성_44_0_남" />
			</li>
			
			<li id="1512822">
				<input type="checkbox" id="checkboxSelectCharacter_49_1512822" name="checkboxSelectCharacter_49_1512822" value="49_2ECD3AA6-8DD4-E011-89B1-E61F135E992F_1512822_루크043" onclick="checkReceiveCharacter(this);" />
				<label for="checkboxSelectCharacter_49_1512822">
					루크043 Lv.1  [페르노스] 천족 정찰자
				</label>
				<input type="hidden" id="characterInfo_49_1512822" value="49_1512822_루크043_천족_정찰자_1_0_남" />
			</li>
			
			<li id="657419">
				<input type="checkbox" id="checkboxSelectCharacter_46_657419" name="checkboxSelectCharacter_46_657419" value="46_2ECD3AA6-8DD4-E011-89B1-E61F135E992F_657419_육고030" onclick="checkReceiveCharacter(this);" />
				<label for="checkboxSelectCharacter_46_657419">
					육고030 Lv.2  [카룬] 천족 정찰자
				</label>
				<input type="hidden" id="characterInfo_46_657419" value="46_657419_육고030_천족_정찰자_2_0_남" />
			</li>
			
		</ol>
		<p class="btn"><span class="btn_stext">확인</span></p>
	</div>

	<div class="info_charlist">
		<span class="bullet">bullet</span>
		<ul id="orderAllMyList">
			
		</ul>
	</div>
</div>
			
			
		
	






















































		<!-- ========================================================= -->
		<!-- 구매정보 -->
		<!-- ========================================================= -->
		














































































































<script type="text/javascript">

	//document ready
	$(document).ready(function() {

		// 상품 상세 정보 ie7 fix
		if ((navigator.userAgent.toLowerCase().indexOf('msie 7') != -1)) {
			if($(".tb_oinfo .cell_name").length>2) {
				$(".info_buyinfo .src").css("height","102px");
			} else {
				$(".info_buyinfo .src").css("height","53px");
			}
		}

		// 추가 구성 상품
		$(".tb_oinfo a.link").on("click",function(){
			$(".item_addition").show();
		});
		$(".item_addition .close, .item_addition .btn_popclose").on("click",function(){
			$(".item_addition").hide();
		});
	});

</script>

<div class="info_buyinfo dashline">
	<h2 class="gtitle">
		<strong id="orderInfoTitle" class="orderinfo"></strong>
		<span class="btn_coupon" id="btn_coupon" onclick="CouponFunction.getUsableCouponList('200411');"><span id="couponCnt">사용가능 쿠폰</span></span>
	</h2>

	<ul id="infoTitle" class="oinfo_title">
		<li class="hname"><span>상품명</span></li>
		<li class="hqty"><span>수량</span></li>
		
		









































































































































	
	

	
	
	
	
	

	
	
		
			
				
					<script>$(".oinfo_title").addClass("quat");</script>
					<li class="nchar"><span>받는 캐릭터 수</span></li>
				
			
			
		
	
















































		<li class="hprice"><span>상품가격</span></li>
	</ul>

	<div class="src">
		<table summary="구매내역" id="tbInfo" class="tb_oinfo">
			<caption>구매내역 테이블</caption>
			<tbody>

				
				<input type="hidden" id="displayGoodsId" name="displayGoodsIds" value="500202">
				<input type="hidden" id="displayGoodsType" name="displayGoodsTypes" value="3">
				<input type="hidden" id="goodsId" name="goodsIds" value="200411">
				<input type="hidden" id="goodsTypeName" value="item">

				
				<input type="hidden" id="rewardType200411" value="1">
				<input type="hidden" id="rewardAmount200411" value="3">

				<tr>
					<!-- 상품명 -->
					<td class="cell_name">
						여름을 사랑하는 펭귄 변신 캔디 (3개입)
						<span class="btn_info" onclick="openGoodsInfo(this,'200411', '500202', '3');return false;">info</span>

						
					</td>

					<!-- 수량 -->
					<td class="cell_qty">
						<span class="qty">
							<input type="text" value="1" maxlength="2">
							<input class="goodsCount" type="text" id="goodsCount200411"
								name="goodsCounts" value="1" maxlength="2"
								maxOrderCount="50"
								onkeydown="return ScriptUtils.checkInputKeyNumber(event);"
								onkeyup="if (window.event.keyCode == 13) { ScriptUtils.onlyNumber('goodsCount200411'); CouponFunction.checkUseCoupon('200411', 50, 0); }"
								onkeypress="if (window.event.keyCode == 13) { return false; }"
								onblur="ScriptUtils.onlyNumber('goodsCount200411'); CouponFunction.checkUseCoupon('200411', 50, 0);"	/>

							<span class="plus" onclick="javascript:CouponFunction.checkUseCoupon('200411', 50, 1);">갯수 증가</span>
							<span class="minus" onclick="javascript:CouponFunction.checkUseCoupon('200411', 50, -1);">갯수 감소</span>
						</span>
					</td>

					
					









































































































































	
	

	
	
	
	
	

	
	
		
			
			
				
					<script>$(".tb_oinfo").addClass("quat");</script>
					<td class="cell_nchar">0개</td>
				
			
		
	

















































					<!-- 상품가격 -->
					<td class="cell_price">
						<span id="salePrice200411" class="salePrice" style="display: none;">
							300
						</span>
						<span id="subTotalSalePriceArea" class="coin">
							<span id="subTotalSalePrice200411" class="subTotalSalePrice">
								300
							</span>
						</span>
						<span id="subTotalRewardAmountArea" class="point text">
							<strong id="subTotalRewardAmount200411">0</strong>적립예정
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<!-- s.추가 구성 상품 -->
<div class="item_addition" style="display:none;">
	<h1>
		추가 구성 상품 (0)
		<span class="close">추가 구성 상품 닫기</span>
	</h1>

	<div class="item_detail_info_scr">
		<table summary="추가 구성 상품 정보" class="tb_detail_info">
		<caption>추가 구성 상품 테이블</caption>
		<tbody>
		
		
			<tr>
				<td class="nodata">선택하신 추가구성상품이 없습니다.</td>
			</tr>
		
		</tbody>
		</table>
	</div>

	<div class="button">
		<div class="btn_popclose"><span>닫기</span></div>
	</div>
</div>
<!-- e.추가 구성 상품 -->


		<!-- ========================================================= -->
		<!-- 구매금액 -->
		<!-- ========================================================= -->
		











































<div class="info_payinfo">
	<h3 class="gtitle">
		<strong class="orderpayinfo" id="payInfoTitle"></strong>
		<p id="applyCoupon" class="applyCoupon">
			<strong>적용 쿠폰</strong> : <span class="message" id="couponName"></span>
		</p>
	</h3>
	<div class="icon_guide">
		<span class="ico_minus_t1">minus</span>
		<span class="ico_result_t1">result</span>
		<table summary="결제내역" class="tb_pinfo">
			<caption>결제내역 테이블</caption>
			<thead>
				<tr>
					<th class="total"><span>합계</span></th>
					<th class="discount"><span>할인금액</span></th>
					<th class="payment"><span>결제금액</span></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="total">
						<span class="coin" id="totalPurchase">
							300
						</span>
					</td>
					<td class="discount">
						<span class="coin" id="totalCouponDiscount">
							0
						</span>
						<span id="btn_coupon_cancel" onclick="CouponFunction.cancelCouponUse('200411')">쿠폰 취소</span>
					</td>
					<td class="payment">
						<span id="totalSalePrice" class="coin total">
							300
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

		<div class="info_notice">
			<p class="rbtn">
				<span class="btn_small chargeNotice">결제 알림 메일</span>
			</p>

			<!-- ========================================================= -->
			<!-- 유의사항 -->
			<!-- ========================================================= -->
			













































<div class="info">
	<strong class="title">구매 시 유의사항</strong>


	
	
	
	

	
	
	
	

	
	
	
	
		
			
			
				
					
					
						
						<ul>
<li>구매하는 캐릭터에 <strong><span class="darkgray">설정하신 수량의 아이템이 각각 배송</span></strong>되오니, 아이템 수량을 정확히 확인해 주시기 바랍니다</li>
<li>회원별, 계정별 월간 구매한도 초과 시 상품 구매가 불가능합니다.</li>
<li>이 상품은 구매한 날 또는 상품 사용이 가능한 날로부터 7일 이내에 청약철회(구매취소)할 수 있고, 7일 경과 시에는 청약철회가 제한됩니다.</li> 
<li>다만, 청약철회 요청 시 상품을 이미 사용하였거나 사용한 것으로 간주할 수 있는 경우(예: 상품 구매 시 본인이 지정한 게임 내 본인 캐릭터의 인벤토리로 수령 동의를 한 후 이동 시)에는 청약철회(구매취소)가 제한됩니다.</li>
</ul>
<br />
<strong>[청약철회•환불 규정]</strong>
<ul>
<li><strong></strong>청약철회 신청 조건<br />1. 구매(충전)일로부터 7일 이내. 단, 아래 제한사유 중 하나에 해당할 경우 7일 이내라고 하더라도 청약철회가 제한될 수 있습니다.<br />2. 청약철회 제한 사유<br />- 청약철회 요청 가능기간이 경과한 경우<br />- 이용자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<br />- 이용자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우<br />- 시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우<br />- <a href="http://main.plaync.co.kr/rule/agreement/gamesvc" target="_blank"><strong>게임서비스 이용약관</strong></a>에서 정한 청약철회 제한 사유에 해당하는 경우</li>
<li>환불 신청 조건<br />1. 30일 이상의 계속적 계약을 체결한 경우 구매(충전)일로부터 5년 이내에 계약을 해지하고 환불할 수 있습니다.<br />2. 구매(충전)한 상품에 아래 각 호 중 하나의 사유가 발생한 경우 충전일로부터 3달 이내, 그 사정을 알거나 알 수 있었던 날로부터 30일 이내에 환불할 수 있습니다.<br />- 이용계약에서 약정한 상품이 제공되지 않은 경우<br />- 제공되는 상품이 표시∙광고 등과 상이하거나 현저한 차이가 있는 경우<br />- 단, <a href="http://main.plaync.co.kr/rule/agreement/gamesvc" target="_blank"><strong>게임서비스 이용약관</strong></a>에서 정한 환불 제한 사유가 발생한 경우 환불이 제한될 수 있습니다.</li>
<li>청약철회•환불 방법<br /> <a title="N샵 > 마이 N샵 > 구매내역조회 > 환불 > N샵 상품 환불 신청" href="http://nshop.plaync.com/history/refund/refundStart "target="_blank"><strong>N샵 > 마이 N샵 > 구매내역조회 > 환불 > N샵 상품 환불 신청</strong></a>  또는 고객센터(1600-0020)에서 청약철회•환불을 신청하시면 됩니다.</li>
<li>청약철회•환불 효과<br />- 회사는 청약철회•환불 접수 후 3영업일 이내에 유료서비스 구매 대금을 N코인으로 환급합니다.<br />- 회사는 대금 환급 시 이용자가 사용한 부분에 해당하는 금액을 공제할 수 있습니다. 각 상품별 사용한 부분에 해당하는 금액의 산정 공식 및 자세한 환불식은 각 상품 안내 페이지, 고객센터(1600-0020) 또는 고객센터 > FAQ를 참고하시기 바랍니다.</li>
<li>환불 지연 시 배상금 지급 조건 및 절차<br />- 회사는 청약철회•환불 시 안내한 기일에 대금을 환급하지 못할 경우 대금 환급 시 전자상거래 등에서의 소비자보호에 관한 법률에서 정한 이율에 따른 이자를 더한 금액을 환급합니다. 이자 산정 관련 문의나 이의 제기는 고객센터(1600-0020)로 연락 주시기 바랍니다.</li></ul>
<br />
<strong>[구매(충전) 주의사항]</strong>
<ul>
<li><strong></strong>상품 구매나 사용 중 발생한 하자와 관련된 피해보상 및 분쟁처리는 공정거래위원회의 고시인 소비자분쟁해결기준에 의해 처리됩니다. 기타 이 상품과 관련한 불만 처리나 이의 제기는 고객센터(1600-0020)로 연락 주시기 바랍니다.</li>
<li>이 상품은 결제 완료 즉시 온라인으로 지급됩니다.</li>
<li>구매하신 상품을 전송 받고 이용하기 위해서는 인터넷에 연결된 Internet Explorer 7 이상의 PC가 필요합니다. 또, 각 게임을 구동하기 위한 별도 기술사양이 적용될 수 있으니, 상품 구매 전 <a title="시스템 사양" href="http://main.plaync.co.kr/util/system"target="_blank"><strong>시스템 사양</strong></a>을 확인하시기 바랍니다.</li>
<li>미성년자가 유료서비스를 구매하는 경우, 법정대리인이 동의하지 않으면 미성년자 본인 또는 법정대리인이 구매를 취소할 수 있습니다.</li></ul>
<p><br /></p>
<p>※ 주식회사 엔씨소프트, 경기도 성남시 분당구 대왕판교로 644번길 12, 대표 김택진, 사업자등록번호 144-85-04244, 통신판매업신고 제2013-경기성남-1268호, 고객상담 1600-0020, 팩스 02-2186-3550, 이메일 <a href="mailto:credit@ncsoft.com">credit@ncsoft.com</a></p></ul>

					
				
			
		
	
	
	
	
	
	


</div>

<p class="agree">
	상기 상품내용 및 종류, 가격, 제공기간과 구매 시 유의사항을<br>확인하였으며,
	<a href="#none" onclick="openNCoinProvision();">
		<span class="link">게임서비스 이용약관</span>
	</a>에 동의합니다.
</p>

			<!-- ========================================================= -->
			<!-- N코인 부족 레이어 -->
			<!-- ========================================================= -->
			











































<script type="text/javascript">

	//document ready
	$(document).ready(function() {

		// 부족 메세지 X 버튼 closed 이벤트
		$("#lackLayerClose").on("click",function(){
			$(this).parent().hide("slow");
		});
	});

</script>

<div class="info_shortage" style="display:none;">
	<span class="close" id="lackLayerClose">close</span>
	<!-- N코인 -->
	<div class="short_ncoin">
		<strong class="message">보유한 N코인이 <span class="coin short" id="ncoinEmptyValue">0</span> 부족합니다.
		</strong>
		<p>
			(내 보유 N코인 = <span class="coin" id="ncoinValue">38,886</span>)
		</p>
		<div class="more">
			<span class="btns_agreement">동의 및 구매</span>
			<p>
				를 클릭하시면 부족한 금액 충전 후<br>바로 구매가 가능합니다.
			</p>
		</div>
	</div>
</div>
		</div>
	</div>
	</form>

	<!-- ============================================================= -->
	<!-- 버튼 영역 -->
	<!-- ============================================================= -->
	<div class="btn_guide">
		<span class="btnw_od_order" id="btn_confirm" onclick="purchase();">동의 및 구매</span>
		<span class="btnw_cancel" onclick="orderformCancel();">취소</span>
	</div>

	<!-- ========================================================= -->
	<!-- coupon popup layer -->
	<!-- ========================================================= -->
	<div class="order_request coupon_xpop" id="couponPopup"></div>

	<!-- ========================================================= -->
	<!-- 상품 상세 정보 popup layer -->
	<!-- ========================================================= -->
	<div class="item_detail_info"></div>

	<!-- ========================================================= -->
	<!-- 결제 알림 메일 popup layer -->
	<!-- ========================================================= -->
	













































<!-- (s) email -->
<div class="charge_notice_ly">
	<h1>
		결제알림메일 설정
		<span class="charge_notice_info">결제알림메일 설정 닫기</span>
	</h1>

	<div class="charge_notice">
		<div class="title">결제 완료 시 결제내역이 아래 메일주소로 발송됩니다.<span class="more">?</span></div>
		<fieldset>
			<legend>충전고지 이메일 입력폼</legend>
			<div class="form">
				<label for="email_form">이메일 주소입력</label>

				
					
					
					
					
						<input type="text" id="email_form" class="mailform" value="fuga@ncsoft.com" disabled="disabled">
						<span class="btn_mail change">변경</span>
					
				

			</div>
		</fieldset>

		<div class="charge_notice_more">
			<div class="title_ly">
				결제내역 이메일 발송 안내
				<span class="close">X</span>
			</div>
			<div class="text">
				고객님의 N샵 결제내역을 메일로 전달해 드립니다.<br>(*입력하신 이메일주소는 결제내역 발송을 위해서만 사용되며<br>회원정보에는 업데이트 되지 않습니다.)
			</div>

			<div class="popup_btn">
				<span class="type1">확인</span>
			</div>

		</div>
	</div>

	<div class="button">
		<span class="btn_popclose"><span>닫기</span></span>
	</div>
</div>

<script>

$(function() {

	// place holder
	$(".charge_notice input.mailbg").on("focus",function() {
		$(this).removeClass("mailbg");
	}).blur(function() {
		var thisvar = $(this).val();
		if(thisvar == '') {
			$(this).addClass("mailbg");
		}
	}).blur();

	$(".charge_notice_btn").on("click",function(){
		$(".charge_notice_ly").show();
		setqLayerModal.qopen();
	});

	$(".charge_notice_ly .charge_notice_info, .charge_notice_ly .btn_popclose").on("click",function() {
// 		var email = $("#email_form").val();
// 		if(email == null || email == ""){
// 			LayerFunction.alert( "결제 알림을 받을 수 있는 이메일 주소를<br />확인해 주시기 바랍니다." );
// 			return false;
// 		}

		$(".charge_notice_ly").hide();
		setqLayerModal.qclose();
	});

	$(".charge_notice .more").bind("click",function(){
		$(".charge_notice_more").appendTo("body").show();
	});

	$(".charge_notice_more .close, .charge_notice_more .popup_btn").bind("click",function(){
		$(".charge_notice_more").hide();
	});

	// EMAIL 확인버튼 클릭
	$(".btn_mail.confirm").bind("click", onClickBtnMailConfirm);
	// EMAIL 변경버튼 클릭
	$(".btn_mail.change").bind("click", onClickBtnMailChange);
	// EMail 취소버튼 클릭
	$(".btn_mail.cancel").bind("click", onClickBtnMailCancel);

	// Email 저장
	function updateEmail(email) {
		var url = "/" + shopName + "/email/setPurchaseEmail";
		var data = new Object();
		data.email = email;

		var result = $.ajax({type:"POST", url:url, data: data, cache:false, async:false}).responseText;
		if(result != "SUCCESS") {
			return false;
		}

		//폼에 이메일 입력
		$("#email").val(email);
		return true;
	}

	//Email 확인 버튼 클릭
	function onClickBtnMailConfirm() {
		var email = $("#email_form").val();
		if(email == null || email == ""){
			LayerFunction.alert( "결제 알림을 받을 수 있는 이메일 주소를<br />확인해 주시기 바랍니다." );
			return false;
		}

		if(email.match(/(\w+\.)*[\w|-]+@(\w+\.)+[A-Za-z]+/) == null){
			LayerFunction.alert( "올바른 이메일 주소 형식이 아닙니다.<br />다시 확인해 주시기 바랍니다." );
			return false;
		}

		if(getByteLength(email) > 64){
			LayerFunction.alert( "입력할 수 있는 이메일 주소 길이가<br />초과되었습니다.<br />다시 확인해 주시기 바랍니다." );
			return false;
		}

		var result = updateEmail(email);
		if(result == false) {
			LayerFunction.alert( "이메일 주소가 업데이트 되지 않았습니다.<br/>잠시 후 다시 시도해 주시기 바랍니다." );
			return false;
		}

		//변경 화면으로전환
		onClickBtnMailCancel(this);
	}

	// Email 취소 버튼 클릭
	function onClickBtnMailCancel() {
		//변경 화면으로전환
		var div = $("div.form").html('<label for="email_form" /><input type="text" id="email_form" class="mailform" disabled="disabled"> <span class="btn_mail change"/>');
		div.find("label").text("이메일 주소입력");
		div.find("span.btn_mail.change").text("변경");
		div.find("span.btn_mail.change").bind("click", onClickBtnMailChange );
		refreshEmail();
	}

	//Email 변경 버튼 클릭
	function onClickBtnMailChange() {
		var email = $("#email_form").val();

		//확인, 취소 화면으로 전환
		var div = $("div.form").html('<label for="email_form" /><input type="text" id="email_form" class="mailform"> <span class="btn_mail confirm" /> <span class="btn_mail cancel" />');
		div.find("label").text("이메일 주소입력");
		div.find("span.btn_mail.confirm").text("확인");
		div.find("span.btn_mail.confirm").bind("click", onClickBtnMailConfirm );
		div.find("span.btn_mail.cancel").text("취소");
		div.find("span.btn_mail.cancel").bind("click", onClickBtnMailCancel );
		div.find("#email_form").val(email);
	}

	// Email 갱신
	function refreshEmail() {
		var url = "/" + shopName + "/email/getPurchaseEmail";
		var result = $.ajax({type:"POST", url:url, cache:false, async:false}).responseText;
		$("#email_form").val(result);
	}

	function getByteLength(data) {
		var len = 0;
		var str = data.substring(0);
		if (str == null) return 0;

		for(var i=0; i< str.length; i++) {
			var ch = escape(str.charAt(i));
				if (ch.length == 1) {
					len++;
				} else if (ch.indexOf("%u") != -1) {
					len += 2;
				} else if (ch.indexOf("%") != -1) {
					len + -ch.length / 3;
				}
			}

			return len;
		}
	});
	
	
	//샘플샵을 위한 펑션 리디파인
	BillFunction.precheckPurchase = function(data) {
		
		var result = {
				resultMessage : "PAYMENTPASSWORD_VERIFY_ERROR"
		};
		
		return result; 
	};
	
	PaymentPassword.openlayer = function(str, gameCode, frmName) {
		var strlen = str.length;
		var type = str.substring(16, strlen);
		removeLayer();
		
		currentAlertId = 'agrIframe';
		
		var url;
		if (type == 'VERIFY_ERROR') {
			url = "verify?returnFrm=" + frmName + "&protocol=HTTP&userId=fuga@ncsoft.com";
		} 
		
		jQuery(document.body).append('<iframe title="모달 윈도우 프레임" id="agrIframe" allowTransparency="true" src="' + url + '" width="100%" height="100%" scrolling="no" frameborder="0" style="position:absolute; left:0; top:0; width:100%; height:100%; z-index:100005;"></iframe>');
		alertModal.open();
	};
	
</script>


</div>
</body>
</html>