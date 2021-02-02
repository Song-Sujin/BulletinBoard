<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chartjs_combo.jsp</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body>

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
						<canvas id="myChart"></canvas>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var ctx = document.getElementById('myChart').getContext('2d');
	var mixedChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        datasets: [{
	            label: 'Bar Dataset',
	            data: [10, 20, 30, 40],
	            borderColor: 'rgba(75, 192, 192, 1)',
	            backgroundColor: 'rgba(75, 192, 192, 0.2)',
	            // this dataset is drawn below
	            order: 1
	        }, {
	            label: 'Line Dataset',
	            data: [10, 10, 10, 20],
	            borderColor: 'rgba(54, 162, 235, 1)',
	            type: 'line',
	            // this dataset is drawn on top
	            order: 2
	        }],
	        labels: ['January', 'February', 'March', 'April']
	    },
	    options: {}
	});
</script>
</body>
</html>