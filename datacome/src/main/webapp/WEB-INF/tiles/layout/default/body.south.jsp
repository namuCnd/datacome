<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication var="principal" property="principal" />

<!-- 2018 수정 -->
<!-- footer -->
	<h2 class="blind">footer 영역<h2>
		<div id="footer">

			<div class="footWrap">
				<h1 class="logo_footer"><a href="${pageContext.request.contextPath}/main/main.do"><img src="${pageContext.request.contextPath}/static/images/common/w_logo_btm.png" alt="UNIVERA" /></a></h1>
				<div class="footer_site">
					<ul class="customer_list">
						<li>
							<span class="txt">고객센터
								<sec:authorize access="isAuthenticated()">
									<c:if test="${principal.users.user_up_yn eq 'Y'}">
										(대리점) ${principal.users.agent.agent_phone}
									</c:if>
								</sec:authorize>
							</span>
							<!--
							<a href="${pageContext.request.contextPath}/cs/notice/readList.do">고객센터 <em>1599-1976</em></a>
							-->
						</li>
						<li>
							<span class="txt">(본사) 1599-1976 월~금 10:00~17:00 점심 : 12:00~13:00</span>
						</li>
						<li>
							<span class="txt">상담전화 지연 시</span>
							<a href="${pageContext.request.contextPath}/cs/counsel/readList.do" class="link">1:1 문의</a>

						</li>
					</ul>
					<div class="footSelect">
						<div class="sel_wrap">
							<span>관계사 사이트</span>
							<select>
								<option value="관계사 사이트" rel="">관계사 사이트</option>
								<option value="유니베라_USA" rel="https://www.newunivera.com/en-us">유니베라_USA</option>
								<option value="유니젠_USA" rel="http://www.unigen.net/">유니젠_USA</option>
								<option value="알로콥" rel="http://www.aloecorp.com/" >알로콥</option>
								<option value="네이처텍" rel="http://www.naturetech.co.kr/">네이처텍</option>
								<option value="이음 F&amp;B" rel="http://www.eumfnb.com/">이음 F&amp;B</option>
								<option value="에코넷 홀딩스" rel="http://www.econetholdings.com/">에코넷 홀딩스</option>
							</select>
						</div>
						<div class="sel_wrap sec">
							<span>패밀리 사이트</span>
							<select>
								<option value="패밀리 사이트" rel="">패밀리 사이트</option>
								<option value="유니베라" rel="http://kr.univera.com:7778/newHome/index.html">유니베라</option>
								<option value="유니베라 CHINA" rel="http://www.univera.cn">유니베라 CHINA</option>
							</select>
						</div>
					</div>
				</div>

				<div class="footer_address">
					<!-- 일반회원 -->
					<div class="address_area2">
						<div class="add_box">
							<span class="tit">본사<br/>㈜유니베라</span>
							<ul>
								<li>· 서울시 성동구 아차산로 78 에코넷센터</li>
								<li>· 대표이사 이병훈</li>
								<li>· 02-463-3100</li>
								<li>· 사업자등록번호 206-81-24900</li>
								<li>· 통신판매업신고 성동–제82호</li>
							</ul>
						</div>
						<sec:authorize access="isAuthenticated()">
						<c:if test="${principal.users.user_up_yn eq 'Y'}">
						<hr style="border:0.5px dotted;"/>
						<div class="add_box">
							<span class="tit">대리점<br/>${principal.users.agent.agent_name}</span>
							<ul>
								<li>· ${principal.users.agent.agent_base_addr} ${principal.users.agent.agent_detail_addr}</li>
								<li>· 대표이사 ${principal.users.agent.agent_delegate}</li>
								<li>· ${principal.users.agent.agent_phone}</li>
								<li>· 사업자등록번호 ${principal.users.agent.agent_bizno}</li>
								<li>· 통신판매업신고 ${principal.users.agent.agent_salesno}</li>
							</ul>
						</div>
						</c:if>
						</sec:authorize>
					</div>
					<!-- //일반회원 -->
				</div>
				<div class="footer_menu">
					<ul>
						<li><a href="${pageContext.request.contextPath}/utilities/readProvision.do">이용약관</a></li>
						<li><a href="${pageContext.request.contextPath}/utilities/readPrivateTreatment.do">개인정보취급방침</a></li>
						<li><a href="${pageContext.request.contextPath}/utilities/readEmailAddr.do">이메일주소 무단수집거부</a></li>
						<li><a href="${pageContext.request.contextPath}/utilities/readWebAccess.do">웹접근성 안내</a></li>
						<li class="copy">&copy; 2015,UNIVERA. All Rights Reserved</li>
					</ul>
				</div>
				<div class="footer_sns">
					<ul>
						<li><a href="https://www.facebook.com/univerakorea" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/w_ico_facebook02.png" alt="페이스북" /></a></li>
						<li><a href="http://blog.naver.com/univera_kr" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/w_ico_naverblog02.png" alt="네이버 블로그" /></a></li>
						<li><a href="https://story.kakao.com/ch/univerakorea" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/w_ico_kakaostory02.png" alt="카카오스토리" /></a></li>
						<li><a href="https://www.instagram.com/univera_korea/" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/w_ico_instagram02.png" alt="인스타그램" /></a></li>
					</ul>
				</div>
				<div class="footer_link">
					<a href="https://www.sgic.co.kr" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/icn_sgi.jpg" alt="SGI서울보증" /></a>
					<a href="${pageContext.request.contextPath}/utilities/readCCM.do" target="_blank"><img src="${pageContext.request.contextPath}/static/images/common/icn_ccm.jpg" alt="CCM 소비자 중심경영" /></a>
				</div>

<%
	if ("on".equals(session.getAttribute("pcview"))) {
%>
				<div class="go_mobile" style="display:block;"><a href="http://m.univeramall.com/main/main.do">모바일 버전으로 보기 ▶</a></div>
<%
	}
%>
			</div><!-- //footWrap -->
		</div><!-- //footer -->
		<!-- 로딩 -->
		<div id="uv-loading"  style="display:none;">
		    <div class="loading-icon">
		        <img src="${pageContext.request.contextPath }/static/images/common/loading-bar.gif">
		    </div>
		</div>
<c:if test="${SERVER_ID eq 'live' }">
<!-- This script is for AceCounter START -->
<sec:authorize access="isAuthenticated()">
<script language='javascript'>
function getAge(birth) {
	var birth1, birth2, birth3;
	
	birth1 = birth.substring(0,4);
	birth2 = birth.substring(4,6);
	birth3 = birth.substring(6,8);
	var d1 = new Date(birth1,birth2-1,birth3);
	var d2 = new Date();
	
	// 일수, 연령 계산
	var diff = d2.getTime() - d1.getTime();
	var daysPast = Math.floor(diff / (1000 * 60 * 60 * 24));

	return Math.floor(daysPast / 365.25);
}

<c:if test="${principal.users.user_birthday ne null }">
var _ag = getAge("${principal.users.user_birthday }");		// 로그인사용자 나이
</c:if>
var _id = '${principal.users.user_id }'; // 로그인사용자 아이디
var _gd = '${principal.users.user_gender eq '10' ? "man" : "woman"}'; // 로그인사용자 성별
</script>
</sec:authorize>
<!-- AceCounter END -->

<!-- AceCounter Log Gathering Script V.7.5.2013010701 -->
<script language='javascript'>
	var _AceGID=(function(){var Inf=['gtp14.acecounter.com','8080','AB6A38890558833','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
	var _AceCounter=(function(){var G=_AceGID;if(G.o!=0){var _A=G.val[G.o-1];var _G=( _A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];	var _U=( _A[5]).replace(/\,/g,'_');var _S=((['<scr','ipt','type="text/javascr','ipt"></scr','ipt>']).join('')).replace('tt','t src="'+location.protocol+ '//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime())+'" t');document.writeln(_S); return _S;} })();
</script>
<noscript><img src='http://gtp14.acecounter.com:8080/?uid=AB6A38890558833&je=n&' border='0' width='0' height='0' alt=''></noscript>	
<!-- AceCounter Log Gathering Script End --> 

<!-- 크로스미디어. 배너광고  수집 스크립트. 2016.7.12-->
<div id="ttdUniversalPixelTag42bbdf0955c548c2b89e062c757d560d" style="display:none">
    <script src="https://js.adsrvr.org/up_loader.1.1.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        (function(global) {
            if (typeof TTDUniversalPixelApi === 'function') {
                var universalPixelApi = new TTDUniversalPixelApi();
                universalPixelApi.init("83ff2y0", ["zvje4zg"], "https://insight.adsrvr.org/track/up", "ttdUniversalPixelTag42bbdf0955c548c2b89e062c757d560d");
            }
        })(this);
    </script>
</div>

<!-- google-analytics 분석 로그. IT 개발 계정으로 신규 생성. 2017.04.18 -->
<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	
	ga('create', 'UA-97485015-3', 'auto');
	ga('require', 'displayfeatures');//인구통계보고서(잠재고객) 사용하도록 설정
	ga('send', 'pageview');
</script>
<!-- google-analytics 분석 끝 -->

<!-- google 리타켓팅 광고 방문자 쿠키 수집. 2017.12.04  이준 사원 요청 -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 825792359;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/825792359/?guid=ON&amp;script=0"/>
</div>
</noscript>
<!-- google 리타켓팅 광고 방문자 쿠키 수집 끝 -->


</c:if>
		