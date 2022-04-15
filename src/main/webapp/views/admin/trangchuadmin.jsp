<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.1/Chart.min.js"></script>

<style type="text/css">

.chart{
    height:500px;
    width:500px;
}
.pie-legend {
	list-style: none;
	margin: 0;
	padding: 0;
}
.pie-legend span {
	display: inline-block;
	width: 14px;
	height: 14px;
	border-radius: 100%;
	margin-right: 16px;
	margin-bottom: -2px;
}
.pie-legend li {
	margin-bottom: 10px;
}
</style>

</head>
<body>
<div class="col-md-5 my-5 mx-auto">
    <div class="card text-center shadow">
        <div class="card-body">
            <div class="chart">
            	<canvas id="property_types" class="pie"></canvas>
            	<div id="pie_legend" class="py-3 text-left col-md-7 mx-auto"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/chart.js"></script>
</body>
</html>