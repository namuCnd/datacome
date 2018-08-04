;$(function () {
	
	(function() {
		
		$(".numeric").on("keydown", function(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				return false;
		}).on("keyup", function(evnet) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else {
				if (event.target != undefined) {
					event.target.value = event.target.value.replace(/[^0-9]/g, "");
				}
			}
				
		});
		
		if ($("#user_cellular").length > 0) {
			
			var $cellular = $("#user_cellular");
			
			if ($cellular.val() != "" &&
				$cellular.data("first-target") &&
				$cellular.data("second-target") &&
				$cellular.data("last-target")) {
			
				if ($cellular.val().match(/-/g) && $cellular.val().match(/-/g).length === 2) {
					var $cellularFirst = $cellular.prevAll("#" + $cellular.data("first-target"));
					var $cellularSecond = $cellular.prevAll("#" + $cellular.data("second-target"));
					var $cellularLast = $cellular.prevAll("#" + $cellular.data("last-target"));
					
					if ($cellularFirst.length > 0) {
						$cellularFirst.val($cellular.val().split("-")[0]);
					}
					if ($cellularSecond.length > 0) {
						$cellularSecond.val($cellular.val().split("-")[1]);
					}
					if ($cellularLast.length > 0) {
						$cellularLast.val($cellular.val().split("-")[2]);
					}
				}
			}
		}
		
		if ($("#user_phone").length > 0) {
			
			var $phone = $("#user_phone");
			
			if ($phone.val() != "" &&
				$phone.data("first-target") &&
				$phone.data("second-target") &&
				$phone.data("last-target")) {
			
				if ($phone.val().match(/-/g) && $phone.val().match(/-/g).length === 2) {
					var $phoneFirst = $phone.prevAll("#" + $phone.data("first-target"));
					var $phoneSecond = $phone.prevAll("#" + $phone.data("second-target"));
					var $phoneLast = $phone.prevAll("#" + $phone.data("last-target"));
					
					if ($phoneFirst.length > 0) {
						$phoneFirst.val($phone.val().split("-")[0]);
					}
					if ($phoneSecond.length > 0) {
						$phoneSecond.val($phone.val().split("-")[1]);
					}
					if ($phoneLast.length > 0) {
						$phoneLast.val($phone.val().split("-")[2]);
					}
				}
			}
		}
		
		if ($("#user_email").length > 0) {
			
			var $email = $("#user_email");
			

			if ($email.val() != "" &&
				$email.data("first-target") &&
				$email.data("last-target")) {
			
				if ($email.val().match(/@/g) && $email.val().match(/@/g).length === 1) {
					var $emailFirst = $email.prevAll("#" + $email.data("first-target"));
					var $emailLast = $email.prevAll("#" + $email.data("last-target"));
					
					
					if ($emailFirst.length > 0) {
						$emailFirst.val($email.val().split("@")[0]);
					}
					
					if ($emailLast.length > 0) {
					
						var emailType = $email.val().split("@")[1];
						var $emailType = $email.prevAll("#emailType");

						if ($emailType.length > 0) {
							if ($emailType.find("option[value='" + emailType + "']").length == 0) {
								$emailType.val(0);
								$emailLast.val(emailType).attr({"readonly" : false, "disabled" : false});
							} else {
								$emailType.val(emailType);
								$emailLast.val(emailType).attr({"readonly" : true, "disabled" : true});
							}
						}
					}
				}
			}
		}
	}());
});

$(function() {
	
	var $calendar = $(".calendar");
	if ($calendar.length < 1) return;
	var toDateYear = new Date().getFullYear();
	var render = (function() {
		
		var initRendering = function() {
			
			date.year();
			date.month();
		};
		
		var date = function() {
			
			return {
				year : function() {
					return getDate("Y", toDateYear-2, toDateYear); 
				},
				month : function() {
					return getDate("M", 1, 12);
				},
				day : function(type, fromDate, toDate) {
					return getDate(type, fromDate, toDate);
				}
			}
		}();
		
		var getDate = function(type, fromDate, toDate) {
			var $target = $calendar.filter("[data-target*='"+type+"']");
			$target.find('option').remove();
			for (;fromDate <= toDate; fromDate++) {
				$target.append($("<option/>", {"value":fromDate, "text":fromDate}));
			}
		};
					
		$calendar.filter("[data-target*='M']").on("change", function() {
			date.day($(this).attr("data-target").replace("M", "D"), 1, (new Date(toDateYear, $(this).val(), 0)).getDate());
		});
		$calendar.filter("[data-target*='M']").trigger("change");
		
		return {
			init : function() {
				return initRendering();
			}
		}
	})();
	var rs = render.init();
});

//StringBuffer Start ------------------------
var StringBuffer = function() {
    this.buffer = [];
}
StringBuffer.prototype.append = function(obj) {
    this.buffer.push(obj);
}
StringBuffer.prototype.toString = function(){
    return this.buffer.join("");
}
// StringBuffer End ------------------------

function setComma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//콤마풀기
function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}