
/* 2018_수정 */
$(function(){
    /* quick number */
    quickNumber();

});

$(window).scroll(function(){

});

$(window).resize(function(){

});

/* quick number */
function quickNumber(){
    var totalNum = $(".q_s_late.divi > ul > li").length;
    var nowNum;
    if(typeof $(".q_s_late.divi > ul > li").eq(0).attr("class") == "undefined"){
        nowNum = 0;
    }else{
        nowNum = $(".q_s_late.divi > ul > li").eq(0).attr("class").substr(7,1);
    }

    $(".pg_num .total").text(totalNum);

    $(".pg_num .now").text(nowNum);

}














/* //2018_수정 */
