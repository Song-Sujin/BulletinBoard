<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c3_line.jsp</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>


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
						<div id="combochart"></div>
						
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

var chart = c3.generate({
	  bindto: "#combochart",
	  data: {
	    x: "year",
	    columns: [
	      ["year", "55세", "56세", "57세", "58세", "59세", "60세", "61세", "62세", "63세", "64세", "65세", "66세", "67세", "68세", "69세", "70세", "71세"],
	      ["pension1", 1000, 900, 850, 800, 760, 720, 680, 640, 600, 600, 600, 600, 600, 600, 600, 600, 600],
	      ["pension2", 800, 700, 600, 500, 400, 300, 200, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	      ["pension3", 400, 500, 600, 650, 600, 550, 500, 400, 300, 300, 300, 300, 300, 300, 300, 300, 300],
	      ["pension4", 200, 100, 300, 350, 400, 420, 450, 400, 370, 370, 370, 370, 370, 370, 370, 370, 370],
	      ["total", 2400, 2200, 2350, 2300, 2160, 2010, 1830, 1540, 1270, 1270, 1270, 1270, 1270, 1270, 1270, 1270, 1270],
	    ],
	    types: {
	      pension1: "area",
	      pension2: "area-spline",
	      pension3: "area",
	      pension4: "area-spline",
	      total: "bar",
	    },
	    colors: {
	      total: "#1ab394",
	      pension1: "#337ab7",
	      pension2: "#328cc1",
	      pension3: "#329ecb",
	      pension4: "#31b0d5",
	    },
	  },
	  bar: {
	    width: {
	      ratio: 0.2,            
	    },
	  },
	  axis: {
	    x: {
	      type: "category",
	    },
	  },
	});
</script>
</body>
</html>