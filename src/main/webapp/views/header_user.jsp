<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/compiled.min.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>
header{
 	width:100%;
  	position: fixed;
  	z-index: 99999;
}
</style>
</head>
<body>
<header class="">
    <div class="">
        <nav class="navbar navbar-expand-sm bg-light navbar-light">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <a class="navbar-brand active" href="http://localhost:8080/Assignment_Java4/Assignment/trangchu"><img src="${pageContext.request.contextPath}/img/pi.png" alt="" style="width: 50%"></a>
                    <li class="nav-item">
                        <a class="nav-link " href="#section1">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section2">Video</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/Assignment_Java4/Assignment/trangyeuthich">My favorite</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#section3">Contact</a>
                    </li>
                </ul>
				<div class="d-flex">
                    <div class="container-fluid">
                        <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/views/dangnhap.jsp">SignIn</a>
                        <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/views/dangky.jsp">SignUp</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- .navbar -->
    </div>
</header>
<!-- End Header -->
</body>
</html>