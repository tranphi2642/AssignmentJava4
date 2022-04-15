<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Asm_java4_ps16509</title>
<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/compiled.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-style.css">
<style>
	form{
		padding-top: 100px;
		height: 800px;
	}
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
    /* Set a style for all buttons */
    
    .login button {
        background-color: #04AA6D;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }
    /* Add a hover effect for buttons */
    
    .login button:hover {
        opacity: 0.8;
    }
    /* Extra style for the cancel button (red) */
    
    .login .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }
    /* Center the avatar image inside this container */
    
    .login .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }
    /* Avatar image */
    
    .login img.avatar {
        width: 30%;
        border-radius: 50%;
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
    /* Change styles for span and cancel button on extra small screens */
    
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }
</style>

</head>

<body>
    <jsp:include page="header_user.jsp"/>
    <!-- End Header -->
    <form action="/Assignment_Java4/Assignment/dangnhap" method = "post">
	    <div class="login">
	        <div class="imgcontainer">
	            <img src="${pageContext.request.contextPath}/img/img_avatar2.png" alt="Avatar" class="avatar">
	        </div>
	
	        <div class="container">
	            <label for="uname"><b>Username</b></label>
	            <input type="text" placeholder="Enter Username" name="username" required>
	
	            <label for="psw"><b>Password</b></label>
	            <input type="password" placeholder="Enter Password" name="password" required>
	
	            <button type="submit">Login</button>
	            <label>
	              <input type="checkbox" checked="checked" name="remember"> Remember me
	            </label>
	        </div>
	
	        <div class="container" style="background-color:#f1f1f1">
	            <button type="button" class="cancelbtn">Cancel</button>
	            <span class="psw">Forgot <a href="${pageContext.request.contextPath}/views/quenmatkhau.jsp">password?</a></span>
	        </div>
	    </div>
	</form>
    <!-- End body -->
    <jsp:include page="footer.jsp"/>
    <!-- End Footer -->
    <script type="text/javascript">
		if('${message}'!=''){
			alert('${message}');
		}
	</script>
</body>
</body>

</html>