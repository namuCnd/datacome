
/* 2018_수정 */
$(function(){
    /* gnb active */
    gnb_active();

    /* gnb fixed */
    gnb_fix();

    /* up member */
    up_member();

    /* tab */
    tab_wrap();
});

$(window).scroll(function(){
    gnb_fix();
});

$(window).resize(function(){

});

/* gnb active */
function gnb_active(){
    $(document).on("focusin", ".gnb_area .gnb_depth1", function(){
        $(".gnb_area .gnb_depth2").hide();
        $(this).closest("li").find(".gnb_depth2").show();
        $(".gnb_area > ul > li").removeClass("active");
        $(this).closest("li").addClass("active");
    });

    $(document).on("focusout", ".gnb_area a", function(){
        setTimeout(function(){
            if(!($(":focus").closest(".gnb_area").is(".gnb_area"))){
                $(".gnb_area .gnb_depth2").hide();
                $(".gnb_area > ul > li").removeClass("active");
            }
        }, 10);
    });

    $(document).on("mouseover", ".gnb_area ul li", function(){
        $(".gnb_area .gnb_depth2").hide();
        $(this).find(".gnb_depth2").show();
        $(this).addClass("active");
    });

    $(document).on("mouseleave", ".gnb_area ul li", function(){
        $(".gnb_area .gnb_depth2").hide();
        $(".gnb_area > ul > li").removeClass("active");
    });
}

/* gnb fixed */
function gnb_fix(){
    var winScr = $(window).scrollTop();

    if(winScr >= 152){
        $(".header_btm").css({"position":"fixed", "left":"0", "right":"0", "top":"0"});
    }else{
        $(".header_btm").removeAttr("style");
    }
}

/* up member */
function up_member(){
    $(document).on("click", ".upMbr_area02 .umAcd_btn", function(){
        var $this_box = $(this).closest(".upMbr_area02");

        if($this_box.is(".on")){
            $this_box.removeClass("on");
            $this_box.find(".con_box").slideUp();
        }else{
            $this_box.addClass("on");
            $this_box.find(".con_box").slideDown();
        }
    });
}

/* tab & accordion */
// [css]
// .tab_wrap .tab_con, .acd_wrap .acd_con {display:none;}
// .tab_wrap .tab_con.on, .acd_wrap .acd_con.on {display:block;}
//
// [class]
// .tab_wrap .tab_tit .tab_btn .tab_con .on
// .acd_wrap .acd_tit .acd_btn .acd_con .on .acd_one (accordion single open 구분)

function tab_wrap(){
    $(document).on("click", ".tab_btn", function(){
        var $this_wrap = $(this).closest(".tab_wrap");
        var idx_num = $this_wrap.find(".tab_btn").not($this_wrap.find(".tab_wrap .tab_btn")).index($(this));

        if(!($(this).closest(".tab_tit").is(".on"))){// default active check
            $this_wrap.find(".tab_tit").not($this_wrap.find(".tab_wrap .tab_tit")).removeClass("on");
            $(this).closest(".tab_tit").addClass("on");
            $this_wrap.find(".tab_con").not($this_wrap.find(".tab_wrap .tab_con")).removeClass("on");
            $this_wrap.find(".tab_con").not($this_wrap.find(".tab_wrap .tab_con")).eq(idx_num).addClass("on");
        }
    });
}

function acd_wrap(){
    $(document).on("click", ".acd_btn", function(){
        var slide_sp = 400;// slideUp, slideDown default speed 400
        var $this_wrap = $(this).closest(".acd_wrap");
        var idx_num = $this_wrap.find(".acd_btn").not($this_wrap.find(".acd_wrap .acd_btn")).index($(this));

        if(!($(this).closest(".acd_tit").is(".on"))){// default active check
            if($(".acd_wrap").is(".acd_one")){// accordion single open
                $this_wrap.find(".acd_tit").not($this_wrap.find(".acd_wrap .acd_tit")).removeClass("on");
                $this_wrap.find(".acd_con").not($this_wrap.find(".acd_wrap .acd_con")).slideUp(slide_sp);
            }
            $(this).closest(".acd_tit").addClass("on");
            $this_wrap.find(".acd_con").not($this_wrap.find(".acd_wrap .acd_con")).eq(idx_num).slideDown(slide_sp);
        }else{
            $(this).closest(".acd_tit").removeClass("on");
            $this_wrap.find(".acd_con").not($this_wrap.find(".acd_wrap .acd_con")).eq(idx_num).slideUp(slide_sp);
        }
    });
}








/* //2018_수정 */
