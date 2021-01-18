<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1>게시판 목록</h1>
				
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
					
					<!-- 검색 폼 -->
					<form method="get" action="${pageContext.request.contextPath }/board/list.do">
						<label for="keyword">검색어: </label>
						<input type="search" name="keyword" id="keyword" placeholder="제목 검색" value="${keyword }" />
						<button type="submit" class="btn btn-defalut">검색</button>
					</form>
					<hr />
						<table class="table table-hover">
						<thead>
							<tr>
								<th align="center">번호</th>
								<th align="center">제목</th>
								<th align="center">작성자</th>
								<th align="center">작성일</th>
								<th align="center">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<%-- 조회결과가 없는 경우 --%>
								<c:when test="${output == null || fn:length(output) == 0}">
									<tr>
										<td colspan="5" align="center">조회결과가 없습니다.</td>
									</tr>
								</c:when>
								
								<%-- 조회결과가 있는 경우 --%>
								<c:otherwise>
									<%-- 조회 결과에 따른 반복 처리 --%>
									<c:forEach var="item" items="${output }" varStatus="status">
										<%-- 출력을 위해 준비한 제목 변수 --%>
										<c:set var="title" value="${item.title }" />
										
										<%-- 검색어가 있다면? --%>
										<c:if test="${keyword != '' }">
											<%-- 검색어에 <mark>태그 적용하여 형광표시 --%>
											<c:set var="mark" value="<mark>${keyword }</mark>" />
											<c:set var="title" value="${fn:replace(title, keyword, mark) }" />
										</c:if>
										
										<%-- 상세페이지로 이동하기 위한 URL --%>
										<c:url value="/board/view.do" var="viewUrl">
											<c:param name="no" value="${item.no }" />											
										</c:url>
										
										<tr>
											<td align="center">${item.no }</td>
											<td align="center"><a href="${viewUrl}">${title }</a></td>
											<td align="center">${item.writer }</td>
											<td align="center">${item.crt_date }</td>
											<td align="center">${item.hits }</td>
										</tr>
									</c:forEach>
									
									
								</c:otherwise>								
							</c:choose>
						</tbody>
							
						</table>

					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/add.do'">글쓰기</button>
				<br/><br/><br/>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			</div>
		</div>
	</div>

</body>
</html>