<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminn.css">
    
    <style type="text/css">
    	h6{
    		font-size:5px;
    	}
    </style>
</head>
<body>
	<div id="page-container" class="main-admin">
        <nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed w-100">
            <a class="navbar-brand" href="#"></a>
            <div id="open-menu" class="menu-bar">
                <div class="bars"></div>
            </div>
        </nav>
        <div class="side-bar">
            <div class="side-bar-links">
                <div class="side-bar-logo text-center py-3">
                    <img src="${pageContext.request.contextPath}/img/img_avatar2.png" class="img-fluid rounded-circle border bg-secoundry mb-3">
                    <h6>${user.fullname }</h6>
                   	${user.email }
               		${user.admin?"Admin":"User"}
                </div>
                <c:url var="home" value="/Assignment/admin"/>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="${home}/homeAdmin" class="nav-links d-block"><i class="fa fa-home pr-2"></i> Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a href="${home}/quanlytaikhoan" class="nav-links d-block"><i class="fa fa-users pr-2"></i> Quản lý tài khoản</a>
                    </li>
                    <li class="nav-item">
                        <a href="${home}/quanlyvideo" class="nav-links d-block"><i class="fa fa-music pr-2"></i> Quản lý video</a>
                    </li>
                    <li class="nav-item">
                        <a href="${home}/thongke" class="nav-links d-block"><i class="fa fa-bar-chart-o pr-2"></i> Thống kê</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/Assignment_Java4/Assignment/trangchu" class="nav-links d-block"><i class="fa fa-sign-out pr-2"></i> Đăng xuất</a>
                    </li>
                </ul>
            </div>
            <div class="side-bar-icons">
                <div class="side-bar-logo text-center py-3">
                    <img src="${pageContext.request.contextPath}/img/img_avatar2.png" class="img-fluid rounded-circle border bg-secoundry mb-3">
                    <h5>${user.fullname }</h5>
                </div>
                <div class="icons d-flex flex-column align-items-center">
                    <a href="${home}/homeAdmin" class="set-width text-center display-inline-block my-1"><i class="fa fa-home"></i></a>
                    <a href="${home}/quanlytaikhoan" class="set-width text-center display-inline-block my-1"><i class="fa fa-users"></i></a>
                    <a href="${home}/quanlyvideo" class="set-width text-center display-inline-block my-1"><i class="fa fa-music"></i></a>
                    <a href="${home}/thongke" class="set-width text-center display-inline-block my-1"><i class="fa fa-bar-chart-o"></i></a>
                    <a href="http://localhost:8080/Assignment_Java4/Assignment/trangchu" class="set-width text-center display-inline-block my-1"><i class="fa fa-sign-out"></i></a>
                </div>
            </div>
        </div>
        <div class="main-body-content w-100 ets-pt">
            <jsp:include page="${views}"/>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            jQuery("#open-menu").click(function() {
                if (jQuery('#page-container').hasClass('show-menu')) {
                    jQuery("#page-container").removeClass('show-menu');
                } else {
                    jQuery("#page-container").addClass('show-menu');
                }
            });
        });
    </script>
</body>
</html>