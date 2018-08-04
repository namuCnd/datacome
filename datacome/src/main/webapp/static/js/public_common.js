// WBE 사용자 화면 SELECT BOX 형태로 된 달력 셋팅
function webCalendarSelectBox(webScaIdlAr, startYear) {
	// 날자 selectbox
	var nD = new Date();
	
	// 시작 년월일
	var sD = new Date();
	sD.setYear(startYear);

	// 시작 년
	webCalendarSelectBoxAppendOption(webScaIdlAr[0], sD.getFullYear(), nD.getFullYear(), 'Y');
	
	// 시작 월
	webCalendarSelectBoxAppendOption(webScaIdlAr[1], 1, 12, 'M');
	
	// 시작 월이 변경될때마 시작일 다시 셋팅
	$("#"+webScaIdlAr[1]).on("change", function(){
		// 시작 일
		webCalendarSelectBoxAppendOption(webScaIdlAr[2], 1, (new Date(sD.getFullYear(), $(this).val(), 0)).getDate(), 'D');
	});
	$("#"+webScaIdlAr[1]).trigger("change");
	
	
	
	
	// 종료 년월일
	var eD = new Date();
	eD.setYear(startYear+1);
	
	// 종료 년
	webCalendarSelectBoxAppendOption(webScaIdlAr[3], sD.getFullYear(), eD.getFullYear(), 'Y');
	
	// 종료 월
	webCalendarSelectBoxAppendOption(webScaIdlAr[4], 1, 12, 'M');
	
	// 종료 월이 변경될때마 시작일 다시 셋팅
	$("#"+webScaIdlAr[4]).on("change", function(){
		// 종료 일
		webCalendarSelectBoxAppendOption(webScaIdlAr[5], 1, (new Date(eD.getFullYear(), $(this).val(), 0)).getDate(), 'D');
	});
	$("#"+webScaIdlAr[4]).trigger("change");
}

function webCalendarSelectBoxAppendOption(id, s, e, type) {
	var v = null;
	
	if( type == 'D' ) {
		if( $("#"+id).find('option').length < 1 ) {
			v = (new Date()).getDate();
		} else {
			v = parseInt($("#"+id).val());
		}
	} else if( type == 'M' ) {
		v = (new Date()).getMonth()+1;
	}
	
	
	$("#"+id).find('option').remove();
	for(var i=s; i<=e; i++) {
		var selected = '';
		if( v == i ) {
			selected = 'selected'
		}
		var n = i;
		if( type == 'M'|| type == 'D' ) {
			n = i<10?"0"+i:i;
		}
		$("#"+id).append("<option value='"+n+"' "+selected+">"+n+"</option>");
	}
}


function getMyCookie(name) 
{ 
  var i = 0 ;
  // cookie 문자열 전체를 검색 
  
  var ar = document.cookie.split(';');
  if( !ar ) {
	  return null;
  }

  while(i <= ar.length){
	  if( !ar[i] ) {
		  break;
	  }
	  
	  var tmp = ar[i].split("=");
	  
	  for(var n=0; n<tmp.length; n++) {
		  tmp[n] = $.trim(tmp[n]);
	  }
//	  

        // name과 동일한 문자가 있다면 
        if(tmp[0] == name) {
			  return [{
				  name:tmp[0], value:tmp[1]
			  }];
        } 
        i++ ;
  }
  
  return null;
}

//쿠키 생성 함수
function setMyCookie(name, value, expire) {
	
    var expire_str = '';
    if( expire > 0 ) {
    	var expire_date = new Date((new Date()).getTime() + ((60*60*24*1000) * expire) );
    	expire_str = "; expires=" + expire_date.toGMTString();
    }
    
    document.cookie = name + "=" + escape(value) + expire_str +"; path=/";
    
//    
    
}
//쿠키 소멸 함수
function clearMyCookie(name) {
    var today = new Date()
    //어제 날짜를 쿠키 소멸 날짜로 설정한다.
    var expire_date = new Date(today.getTime() - 60*60*24*1000)
    document.cookie = name + "= " + "; expires=" + expire_date.toGMTString() +"; path=/";
    
//    
}

function scrollDisabled(){	
	
	$("body").on("mousewheel.disableScroll DOMMouseScroll.disableScroll touchmove.disableScroll", function(e) {
		e.preventDefault();
	    return;
	});
}
//팝업

function publicPopup(cookNm, paegId)
{
	
	// 팝업공지 조회
	$.ajax({
		url : contextPath+"/mileage/readShowAllList.do",
		type :"post",
		dataType : "json",
		data : {popupTargetPage:paegId}, // 10:메인, 20:마이페이지, 30:장바구니, 40:마일리지샵

		
		success : function(data){

			
				
				
				if( data && data.list ) {
					
					for(var i in data.list) {
						
						
						var cookieName = cookNm+"_"+i;
						//clearMyCookie(cookieName);
						var popupCookie = getMyCookie(cookieName);
						
						if( popupCookie == null ) {
							
							var row = data.list[i];
							
							var id = 'cmmPopupDivLayer';
							var type = row.entity.popup_type;
							var top = row.entity.popup_top;
							var left= row.entity.popup_left;
							var width = row.entity.popup_width;
							var height = row.entity.popup_height;
							var popup_idx = row.entity.popup_idx;
							var popup_close_type = row.entity.popup_close_type;
							if(popup_close_type == null) popup_close_type = "";
							var popup_close_type_arr = popup_close_type.split(",");
							
							var style = "style='left:"+left+"px; top:"+top+"px; width:"+width+"px; height:"+height+"px;'";
							
							var popID = 'wrapadPopup'+"_"+i;
							var html = "<div id='"+popID+"'>";
							var tail = "</div>";
							
							
							
						 	if( type == '10' ) { // layer
						 		html += '	<div class="adPopup adPopup2">';
						 		
							} else if( type == '20' ) { // popup
								window.open(contextPath+"/mileage/popup.do?definitionName=popup&popupMode=1&popup_idx="+popup_idx+"&cookieName="+cookieName, "_blank", "left="+left+", top="+top+", width="+width+", height="+height+", scrollbars=yes");
							
							} else if( type == '30') { // layerpopup
								html += '	<div class="adPopup">';
								
								tail =  tail;
								
							}
						 	if(type == '20'){
						 		html += '<div class="popInner" '+style+'>';
						 	}else {
						 		style = "style='left:50%; top:50%; margin-left:-"+width/2+"px; margin-top:-"+height/2+"px; width:"+width+"px; height:"+height+"px;'";
						 		html += '<div class="popInner" '+style+'>';
						 	}
							html += '		<h1 class="popTit">'+row.entity.popup_subject+' </h1>';	
							html += '		<div class="turn">';
							
							
							if( row.entity.popup_content_type == '20' ) {
								html += row.entity.popup_content;
							} else {
								var fileid = row.entity.popup_bg_fileid;
								if( row.entity.popup_link_url != null ) {
									html += "<a href='"+row.entity.popup_link_url+"' target='_blank'><img src='"+contextPath+"/files/downloadMaxFiles.do?file_group_id="+fileid+"'/></a>";
								}else{
									html += "<img src='"+contextPath+"/files/downloadMaxFiles.do?file_group_id="+fileid+"'/></a>";
								}
							}
		
							html += '		</div>';
							if(popup_close_type != null || popup_close_type != ''){
								html += '		<div class="bottom">';
								for(var i=0; i < popup_close_type_arr.length; i++){
									if(popup_close_type_arr[i]=='1'){
										html += '			<input type="checkbox" id="popup_chk1" onclick="CookieControlCookie(\''+popID+'\',\''+cookieName+'\', 1);"><label for="popup_chk1" onclick="CookieControlCookie(\''+popID+'\',\''+cookieName+'\', 1);">오늘 하루 이 창을 열지 않음</label> ';
									}
									if(popup_close_type_arr[i]=='2'){
										html += '           <input type="checkbox" id="popup_chk2" value="2" onclick="CookieControlCookie(\''+popID+'\',\''+cookieName+'\', 0);"><label for="popup_chk2" onclick="CookieControlCookie(\''+popID+'\',\''+cookieName+'\', 0);">더 이상 열지 않음</label>';
									}
									if(popup_close_type_arr[i]=='3'){
										html += '			<button class="closeBtn" onclick="CookieControlCookie(\''+popID+'\',\''+cookieName+'\', null);">X 닫기</button>';
									}
								}
								html += '		</div>';
							}
							
							
							html += '</div>';
							
							html += tail;
							if( type != '20' ) { // popup
								$(document.body).append(html);
								if(type != '10') {
									
									$("body").prepend('<div class="dimm" style="display:block;"></div>'); 
									var dimmHeight = ($(window).height() > $(document).height() ) ? $(window).height() : $(document).height()  ;
									$(".dimm").width($(window).width() + $(window).scrollLeft());
									if(!padChk()) $(".dimm").width($(document).width() + $(window).scrollLeft());
									$(".dimm").height(dimmHeight);
									scrollDisabled();
									
								}
								$(".turn").addClass("webkitDiv");
								if(type != '10') var roll = new IScroll(".turn", { mouseWheel: true}); //스크롤 비활성일 경우에 생성
								if(getInternetExplorerVersion() == 9 || getInternetExplorerVersion() == 10){
									$("input[type='radio']").css("background", "none").css("margin-top", "4px").css("margin-right","5px").css("margin-left", "15px");
									$("input[type='radio']:first-child").css("margin-left", "0");
									$("input[type='checkbox']").css("background", "none");
									
									
								}
							}
							
						}// 팝업공지조회 if 끝
					}
				}
			
		},
		error:function(request,status,error){
			
			alert("공지내역 조회 중 오류가 발생했습니다.\n\n"+error);
		}
	});
}


function getInternetExplorerVersion() {    
    var rv = -1; // Return value assumes failure.    
    if (navigator.appName == 'Microsoft Internet Explorer') {        
         var ua = navigator.userAgent;        
         var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");        
         if (re.exec(ua) != null)            
             rv = parseFloat(RegExp.$1);    
        }    
    return rv; 
}	

// 팝업공지호회 쿠키설정
function CookieControlCookie(divId, ckNm, val) {
	
//  	
	if( val != null ) {
		setMyCookie(ckNm, "true", val);
	}
	
	// 팝업 숨김
	if($(".dimm").length > 0 && $(".adPopup").length > 0) $("body").off(".disableScroll"); $(".dimm").remove();
	$("#"+divId).hide();
	
	
}
//-->

/**
 * 배송조회
 */
function tracking(orderno) {
	
	var url;
	url = 'http://www.cjgls.com/nels/tracking/info.asp';
	url = url + '?vendorid=0005501445';   // 발급받은 고객ID에 맞춰 코딩하시면 됩니다.(cj택배전산실 : 02-870-6822)
	url = url + '&orderno=' + orderno;
  	window.open(url, 'CJ택배조회', 'top=60, left=120, width=660, height=480, toolbar=no, status=no, menubar=no, scrollbars=yes, resizable=no, directories=no');
}

function trackingAgent(url, orderno) {
	
	var url;
	url = 'http://' + url;
	url = url + '?vendorid=0005501445';   // 발급받은 고객ID에 맞춰 코딩하시면 됩니다.(cj택배전산실 : 02-870-6822)
	url = url + '&orderno=' + orderno;
	window.open(url, '택배조회', 'top=60, left=120, width=660, height=480, toolbar=no, status=no, menubar=no, scrollbars=yes, resizable=no, directories=no');
}

function trackingAgentD(url, orderno, dlv_method, dlv_date) {
	alert(url);
	var url;
	url = url + '?vendorid=0005501445';   // 발급받은 고객ID에 맞춰 코딩하시면 됩니다.(cj택배전산실 : 02-870-6822)
	url = url + '&orderno=' + orderno;
	window.open(url, '직접배송', 'top=60, left=120, width=660, height=480, toolbar=no, status=no, menubar=no, scrollbars=yes, resizable=no, directories=no');
}
