<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>google_column.jsp</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['data1', 10],
          ['data2', 20],
          ['data3', 30],
          ['data4', 40],
          ['data5', 50]
        ]);

        var pie_options = {'title':'PIE TEST TITLE',
                       'width':400,
                       'height':300};

        var pie_chart = new google.visualization.PieChart(document.getElementById('piechart_div'));
        pie_chart.draw(data, pie_options);
        
        var bar_options = {'title':'BAR TEST TITLE',
                       'width':400,
                       'height':300};

        var bar_chart = new google.visualization.BarChart(document.getElementById('barchart_div'));
        bar_chart.draw(data, bar_options);
      }
    </script>
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
						<!-- <div id="columnchart_material" style="width: 800px; height: 500px;"></div> -->
						<div id="piechart_div"></div>
    					<div id="barchart_div"></div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>