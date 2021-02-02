<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>statistics.jsp</title>
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
						<a href="${pageContext.request.contextPath }/board/google_column.do">1. 한 페이지에 차트 두개(파이, 컬럼)</a><br />
						<a href="${pageContext.request.contextPath }/board/google_line.do">2. 라인 차트(DB연동)</a><br />
						<a href="${pageContext.request.contextPath }/board/google_pi.do">2. 파이 차트</a><br />
						<a href="${pageContext.request.contextPath }/board/google_scatter.do">3. 선점도 차트</a><br />
						
						<br />
						<h4>Chart.js 이용하기</h4>
						<a href="${pageContext.request.contextPath }/board/chartjs_line.do">1. 라인 차트</a><br />
						<a href="${pageContext.request.contextPath }/board/chartjs_combo.do">2. 콤보 차트</a><br />
						<a href="${pageContext.request.contextPath }/board/c3_scatter.do">3. </a><br />
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>