<%@ page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
                     <ul class="navbar-nav">
                         <li class="nav-item dropdown">
                       	  	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                   	<img src="${pageContext.request.contextPath}/img/img_avatar1.png" alt="Avatar Logo" style="width:40px;" class="rounded-pill">
                                   	${user.fullname }
                              	</a>
								<ul class="dropdown-menu dropdown-menu-lg-end">
								<c:if test="${sessionScope.user.admin}">
                                     <li><a class="dropdown-item" href="#">Quản trị</a></li>
								</c:if> <!--http://localhost:8080/Assignment_Java4/Assignment/admin/homeAdmin  -->
                                   	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/views/doimatkhau.jsp">Change Password</a></li>
	                            	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/Assignment/capnhaptaikhoan">Edit profile</a></li>
	                            	<li><a class="dropdown-item" href="http://localhost:8080/Assignment_Java4/Assignment/dangxuat">Logoff</a></li>
                                 </ul>
                   		</li>
                     </ul>
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