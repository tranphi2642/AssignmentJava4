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
			height: 720px;
		}
    	.d-flex {
            flex-direction: row;
            flex-wrap: wrap;
        }
        
        .signup {
            width: 50%;
            margin: 0 auto;
            padding: 10px 20px;
            border: 2px solid #747171;
        }
        
        .signup input[type=text],
        .signup input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }
        
        .signup input[type=text]:focus,
        .signup input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }
        
        .signup button {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }
        
        .signup button:hover {
            opacity: 1;
        }
        /* Extra styles for the cancel button */
        
        .signup .cancelbtn {
            padding: 14px 20px;
            background-color: #f44336;
        }
        /* Float cancel and signup buttons and add an equal width */
        
        .signup .cancelbtn,
        .signup .signupbtn {
            float: left;
            width: 50%;
        }
        /* Add padding to container elements */
        
        .signup .container {
            padding: 16px;
        }
        /* Clear floats */
        
        .signup .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
        /* Change styles for cancel button and signup button on extra small screens */
        
        @media screen and (max-width: 300px) {
            .cancelbtn,
            .signupbtn {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <jsp:include page="header_user.jsp"/>
    <!-- End Header -->
    <form action="/Assignment_Java4/Assignment/dangky" method = "post">
    <div class="signup">
        <div class="container">
            <h1>Sign Up</h1>

            <label ><b>Username</b></label>
            <input type="text" placeholder="Enter Username" name="username" required>

            <label ><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required>

            <label ><b>Fullname </b></label>
            <input type="text" placeholder="Repeat Fullname" name="fullname" required>

            <label ><b>Email Address</b></label>
            <input type="text" placeholder="Repeat Email" name="email" required>

            <div class="clearfix">
                <button type="button" class="cancelbtn">Cancel</button>
                <button type="submit" class="signupbtn">Sign Up</button>
            </div>
        </div>
    </div>
    </form>
    <!-- End body -->
    <jsp:include page="footer.jsp"/>
    </footer>
    <!-- End Footer -->
    <script type="text/javascript">
		if('${message}'!=''){
			alert('${message}');
		}
	</script>
</body>
</body>

</html>