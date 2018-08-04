(function($) {
	var winH = $(window).height(),
		headerH = $('#header').height(),
		currentClass = 'current';

	function contentsH() {
		var setConH = winH - headerH;
		if ( $('#contents').height() <= setConH ) $('#contents').css('height', setConH-30 );
	};
	function onoff() {
		var $onoffBtn = $('.onoff');
		 $onoffBtn.each(function() {
		 	var $this = $(this);
		 	$(this).find('em').on('click', function() {
				if ( $this.hasClass('on') ) {
					$this.addClass('off').removeClass('on')
						.children('span').text('미사용');
				} else {
					$this.addClass('on').removeClass('off')
						.children('span').text('사용');
				};
			});
		 });
	};
	function layerPop() {
		var $layerPop = $('#layer');
		$layerPop.position({
	        of: $('#contents'),
	        my: "center",
	        at: "center",
	        collision: "flip"
	    });
	   	$layerPop.find('.btnClose').on('click', function(e) {
	   		e.preventDefault();
	   		$(this).parent($layerPop).hide();
	   	});
	};
	function commentList() {
		var $commentList = $('.tblComment'), 
			$commentTit = $commentList.find('a'),
			$commentAnswer = $commentList.find('.answer');
		$commentTit.each(function() {
			$(this).on('click', function(e) {
				e.preventDefault();
				if ( $(this).parents('tr').next($commentAnswer).is(':hidden') ) {
					$(this).parents('tr').next($commentAnswer).show();
				} else {
					$(this).parents('tr').next($commentAnswer).hide();
				}
			});
		});
	};
	function tabAuto() {
		var $tabAuto = $('.tabWidthAuto'),
			$tabAutoAnchor = $tabAuto.find('li');
		$tabAutoAnchor.each(function() {
			var tabAnchorW = $(this).find('a').outerWidth() + 2;
			$(this).css('width', tabAnchorW)
				.find('a').css('width', tabAnchorW - 21);
		});
	};
	function userComment() {
		var $userCmWrap = $('.commentArea'),
			$userCmCont = $userCmWrap.find('.userComment');
		$userCmCont.each(function() {
			var $userCmAnchor = $(this).find('a');
			$userCmAnchor.on('click', function(e) {
				e.preventDefault();
				$(this).next('.commentBox').fadeToggle();
			});
		});
	};

	$(document).ready(function() {
		// contents height setting
		contentsH();

		// onoff 
		onoff();

		// comment list
		commentList();

		// user comment
		userComment();

		// order add
		$('.btnOrderAdd').on('click', function() {
			$('.orderAdd').fadeIn();
		});

		// tab width auto
		//tabAuto();

		// layer popup
		if ( $('#layer').size() !== 0 ) layerPop();

		// jsTree
		if ( $('#jsTree').size() !== 0 ) $('#jsTree').jstree();

		// datepicker
		if ( $('.dateWrap').size() !== 0 ) {
			$( ".datepicker1, .datepicker2" ).datepicker({
				inline: true, 
				dateFormat: "yy/mm/dd",    /* 날짜 포맷 */ 
				prevText: 'prev', 
				nextText: 'next', 
				showButtonPanel: true,    /* 버튼 패널 사용 */ 
				changeMonth: true,        /* 월 선택박스 사용 */ 
				changeYear: true,        /* 년 선택박스 사용 */ 
				showOtherMonths: true,    /* 이전/다음 달 일수 보이기 */ 
				selectOtherMonths: true,    /* 이전/다음 달 일 선택하기 */ 
				showOn: "button", 
				buttonImage: contextPath+"/static/images/btn_datepicker.gif",
				buttonImageOnly: true, 
				minDate: '-30y', 
				closeText: '닫기', 
				currentText: '오늘', 
				showMonthAfterYear: true,        /* 년과 달의 위치 바꾸기 */ 
				/* 한글화 */ 
				monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
				monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
				dayNames : ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
				showAnim: 'slideDown', 
				/* 날짜 유효성 체크 */ 
				onClose: function( selectedDate ) { 
				  $('#fromDate').datepicker("option","minDate", selectedDate); 
				} 
			 });
			/* datepicker 오늘버튼 클릭시 오늘 날짜 생성 스크립트 */
			$.datepicker._gotoToday = function(id) {
			    var target = $(id);
			    var inst = this._getInst(target[0]);
			    if (this._get(inst, 'gotoCurrent') && inst.currentDay) {
			            inst.selectedDay = inst.currentDay;
			            inst.drawMonth = inst.selectedMonth = inst.currentMonth;
			            inst.drawYear = inst.selectedYear = inst.currentYear;
			    }
			    else {
			            var date = new Date();
			            inst.selectedDay = date.getDate();
			            inst.drawMonth = inst.selectedMonth = date.getMonth();
			            inst.drawYear = inst.selectedYear = date.getFullYear();
			            // the below two lines are new
			            this._setDateDatepicker(target, date);
			            this._selectDate(id, this._getDateDatepicker(target));
			    }
			    this._notifyChange(inst);
			    this._adjustDate(target);
			}
		}

		// colorpicker
		$('.customWidget').each(function() {
			var $this = $(this);
			$this.find('.colorpickerHolder').ColorPicker({
				flat: true,
				color: '#00ff00',
				onSubmit: function(hsb, hex, rgb) {
					$this.find('.colorSelector div').css('backgroundColor', '#' + hex);
				}
			});
			$this.find('.colorpickerHolder>div').css('position', 'absolute');
			var widt = false;
			$this.find('.colorSelector').bind('click', function() {
				$this.find('.colorpickerHolder').stop().animate({height: widt ? 0 : 173}, 500);
				widt = !widt;
			});
		});
		
		/* IE9용 select background 처리 */
		
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
		function ffChk(){
			var agt = navigator.userAgent.toLowerCase();
			if (agt.indexOf("firefox") != -1) return 'Firefox'; 
			
		}
		
		if(getInternetExplorerVersion() == 9 || getInternetExplorerVersion() == 10 || ffChk() == "Firefox"){
			$("input[type='radio']").css("background", "none").css("margin-top", "4px").css("margin-right","5px").css("margin-left", "15px");
			$("input[type='radio']:first-child").css("margin-left", "0");
			$("input[type='checkbox']").css("background", "none");
			$("#popWrap").find(".bottom").find("label").css("margin-top", "8px");
			$("#popWrap").find(".bottom").find("button").css("margin-top", "8px");
			
		}
			
	});
})(jQuery);