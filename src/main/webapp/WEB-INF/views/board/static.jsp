<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>static.jsp</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	google.charts.load('current', {'packages' : [ 'bar' ]});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ '날짜', '직접유입', '기타유입' ], 
				[ '10일', 2, 4 ], 
				[ '11일', 7, 1 ],
				[ '12일', 4, 3 ], 
				[ '13일', 10, 3 ], 
				[ '14일', 8, 6 ],
				[ '15일', 6, 8 ], 
				[ '16일', 9, 8 ], 
				[ '17일', 4, 2 ] 
				]);

		var options = {
			chart : {
				title : '게시판 방문 통계',
				subtitle : '',
			}
		};

		var chart = new google.charts.Bar(document
				.getElementById('columnchart_material'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
	
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<br />
				<button type="button" class="btn btn-default"
							onclick="location.href='${pageContext.request.contextPath}/board/list.do'">목록으로</button>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<br />
						<h4>구글 차트 이용하기</h4>
						<a href="${pageContext.request.contextPath }/board/static_column.do">1. 일별 통계</a><br />
						<a href="${pageContext.request.contextPath }/board/static_pi.do">2. 성별별 통계</a><br />
						<a href="${pageContext.request.contextPath }/board/static_scatter.do">3. 나이별 게시글 수 통계</a><br />
						
						<br />
						<h4>C3.js 이용하기</h4>
						<a href="${pageContext.request.contextPath }/board/c3_line.do">1. 라인 차트</a><br />
						<a href="${pageContext.request.contextPath }/board/c3_pi.do">2. </a><br />
						<a href="${pageContext.request.contextPath }/board/c3_scatter.do">3. </a><br />
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>