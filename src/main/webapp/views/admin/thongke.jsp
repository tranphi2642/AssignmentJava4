<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminn.css">

<style type="text/css">
	
</style>
<style>
    .login {
        width: 50%;
        margin: 0 auto;
        padding: 10px 20px;
        border: 2px solid #747171;
    }
    
    .login input[type=text],
    .login input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    
    .login input[type=checkbox] {
        width: 40px;
        height: 20px;
        margin: 10px -5px 15px 0px;
    }
    /* Set a style for all buttons */
    
    .login button {
        background-color: #04AA6D;
        color: white;
        padding: 14px 20px;
        border: none;
        cursor: pointer;
        width: 100%;
        margin-top: 20px;
    }
    /* Add a hover effect for buttons */
    
    .login button:hover {
        opacity: 0.8;
    }
    /* Add padding to containers */
    
    .login .container {
        padding: 16px;
    }
    /* The "Forgot password" text */
    
    .login span.psw {
        float: right;
        padding-top: 16px;
    }
    
    thead tr:nth-child(1) {
        background-color: skyblue;
    }
    
    table,
    th,
    td {
        padding: 10px;
        border: 1px solid rgb(255, 255, 255);
    }
    
    table {
        width: 80%;
        text-align: center;
        margin: 0 auto;
        margin-top: 20px;
        border-collapse: collapse;
    }
    
    tr:hover {
        background-color: rgb(255, 196, 0);
        cursor: pointer;
    }
    
    .table p {
        text-transform: uppercase;
        letter-spacing: 3px;
        font-size: 30px;
        margin-left: -430px;
        color: #5543ca;
        background: linear-gradient(to right, #f4524d 0%, #5543ca 100%) !important;
        -webkit-background-clip: text !important;
        -webkit-text-fill-color: transparent !important;
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
          <form action="/Assignment_Java4/Assignment/admin/findAll" method="post">
		    <h1>THỐNG KÊ SỐ NGƯỜI YÊU THÍCH TỪNG TIỂU PHẨM</h1>
		    <div class="bg-light">
		    <c:if test="${not empty video }">
		   		
		        <table class="table ">
		            <thead>
		                <tr>
		                    <th>Video Title</th>
		                    <th>Favorite Count</th>
		                    <th>Lastest Date</th>
		                    <th>Oldest Date</th>
		                </tr>
		            </thead>
		            <c:forEach var="item" items="${video }">
			            <tr>
			                <td>${item.title } </td>
			                <td>${item.count } </td>
			                <td>${item.lastest } </td>
			                <td>${item.oldest }</td>
			            </tr>
		            </c:forEach>
		        </table>
		        
	        </c:if>
		    </div>
		</form> 
		<hr>
	  <form action="/Assignment_Java4/Assignment/admin/findKey" method="post">
		    <h1>LỌC NGƯỜI YÊU THÍCH TỪNG TIỂU PHẨM</h1>
		    <div class="login">
		        <div class="container">
		            <label><b>Video Title</b></label>
		            <input id="title" type="text" value="" name="title" placeholder="Enter Video Title?">
		
		            <button>Search</button>
		        </div>
		
		    </div>
		    <div class="bg-light">
		   	 <c:forEach var="item" items="${phiconga.favorites}">
		        <table class="table ">
		            <thead>
		                <tr>
		                    <th>Username</th>
		                    <th>Fullname</th>
		                    <th>Email</th>
		                    <th>Favorite Date</th>
		                </tr>
		            </thead>
		            <tr>
		                <td>${item.user.id }</td>
		                <td>${item.user.fullname }</td>
		                <td>${item.user.email }</td>
		                <td>${item.likeDate }</td>
		            </tr>
		        </table>
		        </c:forEach>
		    </div>
		</form>
		<hr>
	 <!--  <form action="" method="post">
		    <h1>LỌC NGƯỜI GỬI & NGƯỜI NHẬN TỪNG TIỂU PHẨM ĐƯỢC CHIA SẺ</h1>
		    <div class="login">
		        <label><b>Video Title</b></label>
		        <input id="title" type="text" value="" name="title" placeholder="Enter Video Title?">
		
		        <button>Search</button>
		
		    </div>
		    <div class="bg-light">
		        <table class="table ">
		            <thead>
		                <tr>
		                    <th>Sender Name</th>
		                    <th>Sender Email</th>
		                    <th>Receiver Email</th>
		                    <th>Sent Date</th>
		                </tr>
		            </thead>
		            <tr>
		                <td>Vinay</td>
		                <td>Sharma</td>
		                <td>lorem ipssum dollor dummy</td>
		                <td>lorem ipssum dollor dummy</td>
		            </tr>
		        </table>
		    </div>
		</form> -->	
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