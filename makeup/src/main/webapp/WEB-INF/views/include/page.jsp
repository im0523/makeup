<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#page-list{
	text-align: center;
}
.page-on, .page-off, .page-next, .page-last, .page-first, .page-prev {
	display: inline-block;
	width: 30px;
	line-height: 28px;
}
.page-on {
	border: 1px solid gray;
	background-color: gray;
	font-weight: bold;
	color: #fff
}
.page-next, .page-last, .page-first, .page-prev {
	border: 1px solid gray;
	text-indent: -99999999px;
}
.page-first {
	background: url("img/page_first.jpg") center no-repeat;
}
.page-prev {
	background: url("img/page_prev.jpg") center no-repeat;
}
.page-next {
	background: url("img/page_next.jpg") center no-repeat;
}
.page-last {
	background: url("img/page_last.jpg") center no-repeat;
}
</style>

<p id="page-list">

<c:if test="${page.curBlock gt 1 }">
	<a class="page-first" onclick="go_page(1)">처음</a>
	<a class="page-prev" onclick="go_page(${page.beginPage-page.blockPage})">이전</a>
</c:if>

<!-- 현재 페이지일 때는 onclick 이벤트를 걸지 않고, 현재페이지에서 다른 페이지로 가려 할 때는 현재페이지가 아닌 페이지들에게 onclick 이벤트를 건다 -->
<c:forEach var="num" begin="${page.beginPage }" end="${page.endPage }">
	<c:if test="${num eq page.curPage }">	<!-- 현재 페이지일 때 -->
		<span class="page-on">${num }</span>
	</c:if>
	<c:if test="${num ne page.curPage }">
		<span class="page-off" onclick="go_page( ${num} )">${num }</span>
	</c:if>
</c:forEach>

<c:if test="${page.curBlock < page.totalBlock }">
	<a class="page-next" onclick="go_page(${page.endPage+1})">다음</a>
	<a class="page-last" onclick="go_page(${page.totalPage})">마지막</a>
</c:if>

</p>



<script>
function go_page(num){
	$('[name=curPage]').val(num);
	$('#list').submit();
}
</script>