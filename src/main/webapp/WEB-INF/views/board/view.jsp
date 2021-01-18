<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h1>게시글 조회</h1>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
				
					<table class="table">
						<tr>
							<td>번호</td>
							<td>${output.no }</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>${output.title }</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${output.writer }</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${output.crt_date }</td>
						</tr>
						<tr>
							<td>조회수</td>
							<td>${output.hits }</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${output.content }</td>
						</tr>
					</table>
					<button type="button" class="btn btn-default"
						onclick="location.href='${pageContext.request.contextPath}/board/list.do'">목록</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/board/edit.do?no=${output.no }'">수정</button>
					<button type="button" class="btn btn-danger"
						onclick="location.href='${pageContext.request.contextPath}/board/delete_ok.do?no=${output.no }'">삭제</button>
				
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>


</body>
</html>