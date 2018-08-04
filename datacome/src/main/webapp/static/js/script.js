/**
 * Page initialize
 * @param _selector : _selector가 있을 경우 하위 element만 적용
 */
function initPage(_selector) {
    var selector = (_selector) ? $(_selector) : $("body");

    // bubbling up 방지
    selector.find("a[href='#']").on("click", function (event) {
        event.preventDefault();
    });

    //레이어 팝업 컨트롤 (이쪽으로 옮김)
    selector.find(".layerPop .btnClose, .layerPop .close, closeReview").on("click", function(e){
        //if($("#delivery_pop").attr("style").indexOf("block")!= -1) return false;
        $(this).parents(".layerPop").hide();
        $('.opacity').eq($(".opacity").length-1).hide().remove();
        $('.opacity').eq($(".opacity").length-1).css("z-index", maxZ());
        if($(".opacity").length == 0 ) $("body").off(".disableScroll");

    });

    selector.find(".numeric").on("keydown", function(event) {
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

//	selChange(_selector);
//	selInit(_selector);

    //selector.find(".layered").appendTo($("body"));
    $("#container").css("padding-top", 0);


    selChange();
    selInit();
}

// 퀵메뉴 위치 변경으로 인한 레이어 통으로 빼서 바디킽에 삽입.
var quickFlg = 0;
function initQuickList(){

    $(".quick_bar").animate({
        right : -120
    }, 500, function(){
        quickFlg = 1;
    });

    var $target = $(".q_s_late > ul");
    if($target.find(".qb_link").length == 1) $target.css("min-height", "74px");// 2018 수정
    else if ($target.find(".qb_link").length == 0) $target.css("min-height", "0");
    else $target.css("min-height", "148px");// 2018 수정

    $target.find("> li").css("position", "absolute").css("left", 0);

    for(var i = 0 ; i <= $target.find("> li").length-1 ; i++ ){
        $target.find("> li").eq(i).css("left", (74 * i)+"px");// 2018 수정

        if((i+1) < 10){// 2018 추가
            $target.find("> li").eq(i).addClass("qbNum_0" + (i+1));
        }else{
            $target.find("> li").eq(i).addClass("qbNum_" + (i+1));
        }

    }
}

$(function() {

    initPage();

    $('body').css("overflow-x","hidden");

    $(window).scroll(function(){
        // quick height

        if(quickFlg == 0) return false;
        var docHt = $(document).height(),
            scrollTop = $(window).scrollTop(),
            quick_bar = $(".quick_bar").height(),
            footerHt = $("#footer").height(),
            defaultHt = 198;// 2018 수정

        if(docHt <= scrollTop + quick_bar + footerHt) return false;
        // 페이지들 간의 컨텐트 높이가 다름. 20151217 김진수
//	    if($("#container").hasClass("mypage")) defaultHt = 160;
//	    else if($("#container").hasClass("main")) defaultHt = 130;
//	    else if($("#container").hasClass("sub")) defaultHt = 130;
//	    else defaultHt = 130;
        if(scrollTop >= defaultHt){// 2018 수정
            $(".quick_bar").stop().animate({
                top : scrollTop - defaultHt
            }, 500);
        }else{
            $(".quick_bar").stop().animate({
                top : scrollTop
            }, 500);
        }
    });
    initQuickList();


    if($('#container').hasClass('sub')){
        $(this).find('.content').css({"width":913,"float":"left"});
    }else{
        $(this).find('.content').css({"width":1100});
    }

    /* 20151214 김진수 퀵메뉴 검색 */
    $(".quick_search > a").click(function(){
        var $target = $(".quick_search_area");
        if(!$(this).hasClass("on")){
            $target.css("border", "2px solid #f99d31").css("height", "20px");
            $target.animate({
                left:-200,
                width : 200
            }, {duration:500, queue:false});
            $(this).addClass("on");
        }else {
            /* 20151218 클릭 검색 추가(값이 있는 경우)*/
            if(!$.trim($target.val())){
                $target.animate({
                    left: 5,
                    width : 0
                }, 500, function(){
                    $target.css("border", 0).css("height", "20px");
                });

                $(this).removeClass("on");
            }else{

                if($.trim($target.val()).length < 2) {
                    layerAlert("#layerMsg", "검색어를 두글자 이상 입력해 주세요.");
                    return;
                }

                location.href= contextPath +"/search/readList.do?searchStr=" + $.trim($target.val());
            }
        }
    });

    /* 2018 수정 */
    $(".q_s_late.divi > a.quick_next").click(function(){
        var $target = $(".q_s_late > ul");
        if($target.find("> li").is(":animated")) return false;
        if($target.find("> li").length <= 1) return false;

        var getLen = $target.find(" > li").length - 1
        var getLiAttr = $target.find("> li").eq(0).attr("class");
        var $itemFirst = "<li>" + $(".q_s_late > ul > li:first-child").html() + "</li>";

        $target.find("> li").animate({
            left : "-=" + 74
        }, 500);
        setTimeout(function(){
            $target.find("> li").eq(0).remove();

            quickNumber();//최근 본 상품 넘버
        }, 500);

        $target.append($itemFirst);
        $target.find(" > li:last-child").addClass(getLiAttr).css("position", "absolute").css("left", (getLen * 74)+"px");

        // 삭제버튼 이벤트
        $(".quick_del").on("click", removeRecentGoods);
    });
    $(".q_s_late.divi > a.quick_prev").click(function(){
        var $target = $(".q_s_late > ul");
        if($target.find("> li").is(":animated")) return false;
        if($target.find("> li").length <= 1) return false;

        var getLen = $target.find(" > li").length;
        var getLiAttr = $target.find("> li").eq(getLen-1).attr("class");

        var $itemLast = "<li>" + $(".q_s_late > ul > li:last-child").html() + "</li>";

        $target.prepend($itemLast);
        $target.find(" > li:first-child").addClass(getLiAttr).css("position", "absolute").css("left", "-74px");

        $target.find("> li").animate({
            left : "+=" + 74
        }, 500);
        setTimeout(function(){
            $target.find("> li").eq(getLen).remove();

            quickNumber();//최근 본 상품 넘버
        }, 500);

        // 삭제버튼 이벤트
        $(".quick_del").on("click", removeRecentGoods);
    });
    /* //2018 수정 */

    //gnb
    $('.gnb > li').hover(function(){
        if(!$(this).find('> a').hasClass("on")){
            $(this).find('> a').addClass('on');
            $(this).find('.depth2').show();
            $(this).mouseleave(function(){
                $(this).find('> a').removeClass('on');
                $(this).find('.depth2').hide();
            });
        }else{
            $(this).find('.depth2').show();
            $(this).mouseleave(function(){
                $(this).find('.depth2').hide();
            });
        }
    });

    //main tab
    $('.mainTab li').click(function(){
        $('.mainTab li').removeClass('on');
        $(this).addClass('on');
        var tabIndex = $(this).index()+1;
        $('.mainBanner').hide()
        $(this).parent().parent().find('.tabCon' + tabIndex).show();
    });






    var main1 = $('.mainBanner.tabCon1 li:nth-child(1)').addClass('first');
    var main2 = $('.mainBanner.tabCon1 li:nth-child(2)');
    var main3 = $('.mainBanner.tabCon1 li:nth-child(3)').addClass('last');
    var main4 = $('.mainBanner.tabCon2 li:nth-child(1)').addClass('first');
    var main5 = $('.mainBanner.tabCon2 li:nth-child(2)');
    var main6 = $('.mainBanner.tabCon2 li:nth-child(3)').addClass('last');


    //main banner
    $('.mainBanner.tabCon1 > a.bannerLeft').click(function(e){
        e.preventDefault();
        if(!(main1.hasClass('wide'))){
            $(this).prev().find(main1).attr('class',"wide");
            $(this).prev().find(main2).attr('class',"first");
            $(this).prev().find(main3).attr('class',"last");
        }else{
            $(this).prev().find(main1).attr('class',"first");
            $(this).prev().find(main2).attr('class',"wide");
            $(this).prev().find(main3).attr('class',"last");
        }
    });

    $('.mainBanner.tabCon1 > a.bannerRight').click(function(e){
        e.preventDefault();
        if(!(main3.hasClass('wide'))){
            $(this).prev().prev().find(main3).attr('class',"wide");
            $(this).prev().prev().find(main2).attr('class',"last");
            $(this).prev().prev().find(main1).attr('class',"first");
        }else{
            $(this).prev().prev().find(main3).attr('class',"last");
            $(this).prev().prev().find(main2).attr('class',"wide");
            $(this).prev().prev().find(main1).attr('class',"first");
        }
    });

    $('.mainBanner.tabCon2 > a.bannerLeft').click(function(e){
        e.preventDefault();
        if(!(main4.hasClass('wide'))){
            $(this).prev().find(main4).attr('class',"wide");
            $(this).prev().find(main5).attr('class',"first");
            $(this).prev().find(main6).attr('class',"last");
        }else{
            $(this).prev().find(main4).attr('class',"first");
            $(this).prev().find(main5).attr('class',"wide");
            $(this).prev().find(main6).attr('class',"last");
        }
    });

    $('.mainBanner.tabCon2 > a.bannerRight').click(function(e){
        e.preventDefault();
        if(!(main6.hasClass('wide'))){
            $(this).prev().prev().find(main6).attr('class',"wide");
            $(this).prev().prev().find(main5).attr('class',"last");
            $(this).prev().prev().find(main4).attr('class',"first");
        }else{
            $(this).prev().prev().find(main6).attr('class',"last");
            $(this).prev().prev().find(main5).attr('class',"wide");
            $(this).prev().prev().find(main4).attr('class',"first");
        }
    });

    //subDetail more
    var nowPos1;
    $('.subDetail .btnMoreWrap .btnMore').click(function(){
        nowPos1 = $(window).scrollTop();
        $(this).parent().parent().find('.first').hide();
        $(this).parent().parent().find('.hidden').show();
        $(this).parent().addClass('on');

        $(this).next().show();
        $(this).hide();
    });

    $('.subDetail .btnMoreWrap .btnClose').click(function(){

        $(this).parent().parent().find('.hidden').hide();
        $(this).parent().parent().find('.first').show();
        $(this).parent().removeClass('on');
        $(this).prev().show();
        $(this).hide();
        $(window).scrollTop(nowPos1);
    });

    //subDetail thumnail
    $('.prdSlider li a').click(function(e){
        e.preventDefault();
        var src = $(this).find('img').attr('src');
        $('.prdWrap > img').attr('src', src);
        $('.prdSlider li').removeClass('on');
        $(this).parent().addClass('on');
    });

    $('.prdSlider > a').click(function(e){
        e.preventDefault();
        if($(this).hasClass('btnPrev')){
            var index = $(this).prev().prev().find('li.on').index();
            if(index > 0 ){
                $('.prdSlider li.on').removeClass('on').prev('li').addClass('on');
                var src = $('.prdSlider li.on').find('img').attr('src');
                $('.prdWrap > img').attr('src', src);
            }
        }else{
            var index = $(this).prev().find('li.on').index()+1;
            //////console.log(index);
            if(index < 4 ){
                $('.prdSlider li.on').removeClass('on').next('li').addClass('on');
                var src = $('.prdSlider li.on').find('img').attr('src');
                $('.prdWrap > img').attr('src', src);
            }
        }
    });

    //faq
    $('.tblType3 .iconQ').click(function(e){
        e.preventDefault();
        if(!($(this).hasClass('on'))){
            $(this).addClass('on');
            var parent = $(this).parent().parent().next();
            if(parent.hasClass('answer')){
                parent.find('td').show();
            }
        }else{
            $(this).removeClass('on');
            var parent = $(this).parent().parent().next();
            if(parent.hasClass('answer')){
                parent.find('td').hide();
            }
        }
    });

    //상품 Q&A
    $('.tblType3 .question').click(function(e){
        e.preventDefault();
        if(!($(this).hasClass('on'))){
            $(this).addClass('on');
            var parent = $(this).parent().parent().next();
            if(parent.hasClass('reAnswer')){
                parent.find('td').show();
            }
        }else{
            $(this).removeClass('on');
            var parent = $(this).parent().parent().next();
            if(parent.hasClass('reAnswer')){
                parent.find('td').hide();
            }
        }
    });

    //login find_id & find_pw
    $('.login .btnFindId').click(function(){
        $('.login .section.last').show();
        $('.login #radio1').attr("checked", true);
    });

    $('.login .btnFindPw').click(function(){
        $('.login .section.last').show();
        $('.login #radio2').attr("checked", true);
        $('.login .inputText').attr('colspan',0)
        $('.login .hidden').show();
    });

    $('.findTab input').click(function(){
        var findChk = $('.login #radio2');
        if(findChk.is(":checked")){
            $('.login .inputText').attr('colspan',0)
            $('.login .hidden').show();
        }else{
            $('.login .inputText').attr("colspan",3)
            $('.login .hidden').hide();
        }
    });

    /* 마일리지 팝업 */
    $('#mileagePop .btnType4').click(function(){
        $(this).parent().parent().hide();
    });

    /* 우편번호 팝업 */
    $('#postPop .postTab a').click(function(e){
        e.preventDefault();
        var postInex = $(this).parent().index()+1;
        $(this).addClass('on').parent().siblings().find('a').removeClass('on');
        $('.addCon').hide();
        $('.addTab'+postInex).show();
    });

    $("body").on("click", ".layerPop .btnClose, .layerPop .close, closeReview", function(e){


        $('.opacity').eq($(".opacity").length-1).hide().remove();
        $(this).parents(".layerPop").hide();
        if($(".opacity").length == 0 ) $("body").off(".disableScroll");
        $('.opacity').eq($(".opacity").length-1).css("z-index", maxZ());
        return false;
    });

    commentList();

    /* 마일리지 비활성화 */
    $('.mileageList').find('li').each(function() {
        if ( $(this).filter('.disable') ) {
            $(this).append('<span class="bg"></span>');
        }
    });


    $("html,body").stop().animate({
        scrollTop : 0
    },100);


});

function selChange(_selector) {
    var selector = (_selector) ? $(_selector) : $("body");
    /* 20151204 김진수 셀렉트 */
    selector.find(".sel_wrap select").change(function(){
        //////console.log($(this));
        $(this).parent().find("> span").text($(this).find("option:selected").text());
        var getSrc = $(this).find("option:selected").attr("rel");
        ////////console.log(getSrc);
        if(getSrc)window.open(getSrc,'');
    });
}

/* 토글 */
function commentList() {
    var $commentList = $('.toggleTable'), // 테이블이나 영역을 감싸고있는 부모 영역
        $commentTit = $commentList.find('a'), // 클릭하는 부분
        $commentAnswer = $commentList.find('.answer'); // 답변 부분
    $commentTit.each(function() {
        $(this).on('click', function(e) {
            if($(this).attr('name') != "addFile") {	//토글 예외처리 (1:1문의 첨부파일 일 때 해당 링크실행)
                e.preventDefault();
                if ( $(this).parents('tr').next($commentAnswer).is(':hidden') ) {
                    $(this).parents('tr').next($commentAnswer).show();
                } else {
                    $(this).parents('tr').next($commentAnswer).hide();
                }
            }
        });
    });
}

function selInit(_selector){
    var selector = (_selector) ? $(_selector) : $("body");

    var selidx = selector.find(".sel_wrap select").length;
    ////console.log(selidx);
    var $target = $(document).find(".sel_wrap select");
    for(var i = 0 ; i <= selidx-1 ; i++){
        if($target.eq(i).find("option:selected"))
            $target.eq(i).parent().find("> span").text($target.eq(i).find("option:selected").text());
        else $target.eq(i).parent().find("> span").text($target.eq(i).find("option").eq(0).text());

        /* 셀렉 박스 내부 위치 조정 */
        $target.eq(i).parent().find(" > span").css("top", $target.eq(i).parent().innerHeight()/2 - $target.eq(i).parent().find(" > span").height()/2);
        $target.eq(i).parent().css("background-position-y", ($target.eq(i).parent().innerHeight()/2-1)+"px");
    }


}

function maxZ(){
    return Math.max.apply(null,$.map($('body > *').not("#uv-loading"), function(e,n){if($(e).css('display')=='block')return parseInt($(e).css('z-index'))||1;}));
}

function layerPopup(id){
    if($(id).css("display") == "none"){
        var id = id;

        if($(id).length == 1){
            $("body").append($(id));
        }

        $(id).show();
        makeLayer();
        reLocationLayer(id);
        $('.opacity').show();
        $(".opacity").eq($(".opacity").length-1).css("z-index", maxZ());


        $(window).resize(function() {
            reLocationLayer(id);
        });
        if($(id).find("input[type='radio']"))
            $(id).find("input[type='radio']").focus();
        else if($(id).find("select"))
            $(id).find("select").focus();
        else if($(id).find("input"))
            $(id).find("input").focus();
        else if($(id).find("button"))
            $(id).find("button").focus();
        else $(id).find("a").focus();
        scrollDisabled();
    }
}

function reLocationLayer(id){
    var winWd = $(window).width()/2;
    var winHt = $(window).height()/2;
    var popWd = $(id).innerWidth()/2;
    var popHt = $(id).innerHeight()/2;
    var scrT = $(window).scrollTop();
    var scrL = $(window).scrollLeft();
    $(id).css("position","absolute").css("top", scrT + winHt - popHt).css("margin-left", 0).css("left", scrL + winWd - popWd)

    $(".opacity").width($(document).width() + $(window).scrollLeft());
    var opacityHeight = ($(window).height() > $(document).height() ) ? $(window).height() : $(document).height()  ;
    $(".opacity").height(opacityHeight);

}

function layerMoveAlert(target, msg, loadUrl) {
    if($(target).css("display") == "block") return false;
    var $target = $("body").find(target).length > 0? $("body").find(target) : $("<div/>", {"id":target.replace("#",""), "class":"layerPop"});
    //var $opacity = $("body").find(".opacity").length > 0? $("body").find(".opacity") : $("<div/>", {"class":"opacity", "style":{"position":"fixed"}});

    $target.html("");
    $target.
    append($("<h2>").
    append($("<pre>", {"text":msg.replace(/<br\/\>/gi, "\n")}))).
    append($("<div>", {"class":"btnWrap tc"}).
    append($("<button>", {"type":"button", "class":"btnType4 close", "onClick":"location.href='"+loadUrl+"'", "text": "확인"}))).
    append($("<a>", {"href":"#", "class":"btnClose close", "text": "닫기"}));
    //$opacity;

    $("body").append($target);

    $target.css('margin-top', -$target.outerHeight()/2.1 );
    $target.css('margin-left', -$target.width()/2).css("z-index",maxZ()+10);

    $target.fadeIn('fast');
    //151207 김진수
    makeLayer();
    $('.opacity').show();
    $(".opacity").width($("body").width() + $(window).scrollLeft());
    //151207 김진수
    var opacityHeight = ($(window).height() > $(document).height() ) ? $(window).height() : $(document).height()  ;
    $(".opacity").height(opacityHeight);
    scrollDisabled();
}

function layerAlert(target, msg, callback) {
    if($(target).css("display") == "block") return false;
    var $target = $("body").find(target).length > 0? $("body").find(target) : $("<div/>", {"id":target.replace("#",""), "class":"layerPop"});
    //var $opacity = $("body").find(".opacity").length > 0? $("body").find(".opacity") : $("<div/>", {"class":"opacity", "style":{"position":"fixed"}});

    $target.html("");
    $target.
    append($("<h2>").
    append($("<pre>", {"text":msg.replace(/<br\/\>/gi, "\n")}))).
    append($("<div>", {"class":"btnWrap tc"}).
    append($("<button>", {"type":"button", "class":"btnType4 close", "onClick":callback, "text": "확인"}))).
    append($("<a>", {"href":"#", "class":"btnClose close", "text": "닫기"}));
    //$opacity;
    makeLayer();
    $("body").append($target);

    $target.css('margin-top', -$target.outerHeight()/2.1 );
    $target.css('margin-left', -$target.width()/2).css("z-index",maxZ()+10);

    $target.fadeIn('fast');
    //151207 김진수

    $('.opacity').show();
    $(".opacity").width($(document).width() + $(window).scrollLeft());
    //151207 김진수
    var opacityHeight = ($(window).height() > $(document).height() ) ? $(window).height() : $(document).height()  ;
    $(".opacity").height(opacityHeight);
    scrollDisabled();
}

function layerConfirm(target, msg, callback) {
    if($(target).css("display") == "block") return false;
    var $target = $("body").find(target).length > 0? $("body").find(target) : $("<div/>", {"id":target.replace("#",""), "class":"layerPop"});
    //var $opacity = $("body").find(".opacity").length > 0? $("body").find(".opacity") : $("<div/>", {"class":"opacity", "style":{"position":"fixed"}});

    $target.html("");
    $target.
    append($("<h2>").
    append($("<pre>", {"text":msg.replace(/<br\/\>/gi, "\n")}))).
    append($("<div>", {"class":"btnWrap tc"}).
    append($("<button>", {"type":"button", "class":"btnType4 close buttonMar", "onClick":callback, "text": "확인"})).
    append($("<button>", {"type":"button", "class":"btnType5 close", "text": "취소"}))).
    append($("<a>", {"href":"#", "class":"btnClose close", "text": "닫기"}));
    //$opacity;

    $("body").append($target);
    makeLayer();
    $target.css('margin-top', -$target.outerHeight()/2.1 );
    $target.css('margin-left', -$target.width()/2).css("z-index",maxZ()+10);

    $target.fadeIn('fast');
    //151207 김진수

    $('.opacity').show();
    $(".opacity").width($(document).width() + $(window).scrollLeft());
    //151207 김진수
    var opacityHeight = ($(window).height() > $(document).height() ) ? $(window).height() : $(document).height()  ;
    $(".opacity").height(opacityHeight);
    scrollDisabled();
}

function layerCartConfirm(target, msg, callback) {
    if($(target).css("display") == "block") return false;
    var $target = $("body").find(target).length > 0? $("body").find(target) : $("<div/>", {"id":target.replace("#",""), "class":"layerPop"});
    //var $opacity = $("body").find(".opacity").length > 0? $("body").find(".opacity") : $("<div/>", {"class":"opacity", "style":{"position":"fixed"}});

    $target.html("");
    $target.
    append($("<h2>").
    append($("<pre>", {"text":msg.replace(/<br\/\>/gi, "\n")}))).
    append($("<div>", {"class":"btnWrap tc"}).
    append($("<button>", {"type":"button", "class":"btnType5 close","style":"margin-right:5px", "text": "계속쇼핑하기"}),$("<button>", {"type":"button", "class":"btnType4 close", "onClick":callback, "text": "장바구니로 이동"}))).
    append($("<a>", {"href":"#", "class":"btnClose close", "text": "닫기"}));
    //$opacity;

    $("body").append($target);
    makeLayer();
    $target.css('margin-top', -$target.outerHeight()/2.1 );
    $target.css('margin-left', -$target.width()/2).css("z-index",maxZ()+10);

    $target.fadeIn('fast');
    //151207 김진수

    $('.opacity').show();
    $(".opacity").width($(document).width() + $(window).scrollLeft());
    //151207 김진수
    var opacityHeight = ($(window).height() > $(document).height() ) ? $(window).height() : $(document).height()  ;
    $(".opacity").height(opacityHeight);
    scrollDisabled();
}

function goFb(content) {
    var url = location.href;
    content = (content) ? content : $("title").text();
    fullUrl = 'http://www.facebook.com/sharer/sharer.php?u='+ encodeURIComponent(url)+"&p[title]="+encodeURIComponent(content);

    window.open(fullUrl,'','width=640,height=600,location=no,menubar=no,status=no,scrollbars=no,resizable=no,titlebar=no,toolbar=no');
}

function goNaver(content) {
    var url = location.href;
    content = (content) ? content : $("title").text();
    var fullUrl = "http://blog.naver.com/openapi/share?url="+encodeURIComponent(url)+"&title="+encodeURIComponent(content);
    window.open(fullUrl,"",'width=640,height=380,location=no,menubar=no,status=no,scrollbars=no,resizable=no,titlebar=no,toolbar=no');
}

function goTwitter(content){
    content = (content) ? content : $("title").text();
    content = content +"\n";
    var url = location.href;
    var fullUrl = "http://twitter.com/share?url="+encodeURIComponent(url)+"&text=" + encodeURIComponent(content);

    window.open(fullUrl,"",'width=640,height=380,location=no,menubar=no,status=no,scrollbars=no,resizable=no,titlebar=no,toolbar=no');
}

/* 20151207 김진수 레이어팝업 세팅 */
function scrollDisabled(){
    $("body").on("mousewheel.disableScroll DOMMouseScroll.disableScroll touchmove.disableScroll", function(e) {
        e.preventDefault();
        return;
    });
}

function makeLayer(){
    var str = "<div class='opacity'></div>"
    $("body").prepend(str);

}
/*
function createLayer(id, wd, ht, text, dimId){

	var $targetCls = $("." + id);
	if(!$("body").find($targetCls)){
		$("body").append(createBox());
		$(".new_layered").addclass("id");
		if(wd) $targetCls.show().width(wd);
		else $targetCls.show().width(250);
		if(ht) $targetCls.show().height(ht);
		else $targetCls.show().height(400);

		var getTopPos = $targetCls.innerHeight();
		var getTop = $(window).scrollTop() + $(window).height()/2 - getTopPos/2;
		var getLeft = $(window).width()/2 - $targetCls.width()/2;

		$targetCls.find(".layered_title").text(text);

		newDim(dimId);

		$targetCls.animate({
			top : getTop
		}, 500);
	}else {
		$targetCls.animate({
			top : -9999
		}, 500);
	}

}
function createBox(){
	var a =  '<div class="layered new_layered">';
	a += '<div class="layered_title"></div>';
	a += '<div class="layered_btn"><a href="#" class="">닫기</a></div>';
	a += '<a href="#" class="close" title="닫기"></a>';
	a += '</div>';
	return a;
}
function newDim(dimId){
	var $targetDim = $("." + dimId);
	if(!$("body").find($targetDim)){
		var dim = "<div class='dimmed new_dim'></div>";
		$("body").prepend(dim);
		$(".new_dim").addClass(dimId);
		$targetDim.height($(document).height()).width($(window).scrollLeft + $(window).width());
	}else {
		$targetDim.hide().remove();
	}

}
*/


function padChk(){
    var padKey = "iPad";
    var getNav = navigator.userAgent;
    if(getNav.indexOf(padKey) == -1) return true;

}

/**
 * 로딩바 함수
 */
function activateLoading(stat){
    var imgW = 100;        // 실제 이미지 넒이값 입력
    var imgH = 100;        // 실제 이미지 높이값 입력
    var scrW = $(window).width();
    var scrH = $(window).height();
    var imgL = (scrW/2) - (imgW/2);
    var imgT = (scrH/2) - (imgH/2);
    $('.loading-icon').css({
        'position': 'absolute',
        'top': imgT+'px',
        'left': imgL+'px',
    });
    if(stat=='on'){
        $('#uv-loading').fadeIn('fast');
        $('#uv-loading').on('scroll touchmove mousewheel', function(e) {
            e.preventDefault();
            e.stopPropagation();
            return false;
        });
    }else{
        $('#uv-loading').fadeOut('fast');
        $('#uv-loading').off('scroll touchmove mousewheel');
    }
}


/**
 * 로딩바 공통 처리
 */
$.ajaxSetup({
    beforeSend:function(){
        activateLoading('on');
    },
    complete:function(){
        activateLoading('off');
    }
});
