<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>google_line.jsp</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<script type="text/javascript">

	// 구글 api사용을 위한 기본 세팅
	google.charts.load('current', {	'packages' : [ 'corechart' ]});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		
		// DB연동하여 ajax로 데이터 가져오기
		
		var jsonData = $.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/board/google_line_ok.do",
			dataType: "json",
			async: false,
			success: function(data)
			{
				alert(data + "성공");
			},
			error: function(e)
			{
				alert(e.responseText + "에러발생");
			}
		}).responseText;
		
		//alert(${str});
		var data = new google.visualization.arrayToDataTable(${str});

		var options = {
			title : '라인차트 DB연동',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

		chart.draw(data, options);
	}
</script>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<br />
				<button type="button" class="btn btn-default"
							onclick="location.href='${pageContext.request.contextPath}/board/statistics.do'">통계 목록으로</button>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<br />
						  <div id="chart_div"></div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>


</body>

</html>