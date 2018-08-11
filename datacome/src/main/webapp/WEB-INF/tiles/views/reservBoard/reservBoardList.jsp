<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
 
    <div class="row">
        <div class="col-xs-12 col-sm-12">
           <div class="table-responsive">
            <table class="table">
            <caption class="text-center"><h3>리스트</h3></caption>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>전화번호</th>
                </tr>
                <c:forEach items="${list}" var="board">
                    <tr>
                        <th>${board.seq }</th>
                        <th>${board.title }</th>
                        <th>${board.content }</th>
                        <th>${board.phone }</th>
                    </tr>
                </c:forEach>
                <tfoot>
                    <tr>
                      <td colspan="8" class="text-center">
                           
                          <ul class="pagination">
                             <c:if test="${pageMaker.prev}">
                                <li><a href="reservBordList.do?page=${pageMaker.startPage -1}">&laquo;</a></li>
                             </c:if>
                           
                             <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
                                 <li
                                   <c:out value="${pageMaker.page ==idx? 'class=active' : ''}" />
                                  >
                                   <a href="reservBordList.do?page=${idx}">${idx}</a></li>
                             </c:forEach> 
                              
                             <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                                <li><a href="reservBordList.do?page=${pageMaker.endPage +1}">&raquo;</a></li>
                             </c:if>
                           
                          </ul>
                      </td>
                    </tr>
                </tfoot>
            </table>
            </div>
        </div>
    </div>
</body>
</html>