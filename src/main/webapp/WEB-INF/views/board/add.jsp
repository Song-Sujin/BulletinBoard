<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add.jsp</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1>게시글 등록</h1>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
					<form method="post" action="${pageContext.request.contextPath }/board/add_ok.do">
						<table class="table">
							<tr>
								<td>제목</td>
								<td><input type="text" class="form-control" id="title" name="title" /></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><input type="text" class="form-control" id="content" name="content" /></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" class="form-control" id="writer" name="writer" /></td>
							</tr>
						</table>
						<button type="button" class="btn btn-default"
							onclick="location.href='${pageContext.request.contextPath}/board/list.do'">목록</button>
						<button type="reset" class="btn btn-default">다시작성</button>
						<button type="submit" class="btn btn-primary">등록</button>
					</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>