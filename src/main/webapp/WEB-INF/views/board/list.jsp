<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<table class="table table-hover">
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
							</tr>
							<tr>
								<td>1</td>
								<td>제목입니다</td>
								<td>김길동</td>
								<td>2021-01-14</td>
								<td>2</td>
							</tr>
						</table>

					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/add.do'">글쓰기</button>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			</div>
		</div>
	</div>

</body>
</html>