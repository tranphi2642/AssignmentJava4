<%@ page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asm_java4_ps16509</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-style.css">
    
    <style>
    	.all{
			padding-top: 70px;
		}
		#myModal {
			padding-top: 70px;
		}
		header{
		 	width:100%;
		  	position: fixed;
		  	z-index: 99999;
		}
        .d-flex {
            flex-direction: row;
            flex-wrap: wrap;
        }
        
        .btnn {
            border-radius: 4px;
            background-color: #f4511e;
            border: none;
            color: #FFFFFF;
            text-align: center;
            font-size: 25px;
            padding: 20px;
            width: 200px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 5px;
        }
        
        .btnn span {
            cursor: pointer;
            display: inline-block;
            position: relative;
            transition: 0.5s;
        }
        
        .btnn span:after {
            content: '\00bb';
            position: absolute;
            opacity: 0;
            top: 0;
            right: -20px;
            transition: 0.5s;
        }
        
        .btnn:hover span {
            padding-right: 25px;
        }
        
        .btnn:hover span:after {
            opacity: 1;
            right: 0;
        }
        
        .modal-body input[type=text] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .modal-dialog {
        	margin-top: 250px;
        }
    </style>
</head>

<body>
	<c:choose>
		<c:when test="${empty sessionScope.user}">
			<jsp:include page="header_user.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="header_admin.jsp"/>
		</c:otherwise>
	</c:choose>
<!-- End Header -->
<div class="all">
 	<section>
        <!-- Carousel -->
        <div id="demo" class="carousel slide" data-bs-ride="carousel">
            <!-- Indicators/dots -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>
            <!-- The slideshow/carousel -->
             <div class="carousel-inner text-center">
                <div class="carousel-item active">
                    <img src="https://img.youtube.com/vi/HDhR2Yhnvfo/maxresdefault.jpg" alt="Los Angeles" class="d-block" style="width:100%;height: 689px;">
                </div>
                <div class="carousel-item">
                    <img src="https://img.youtube.com/vi/t2pU3iTkv3w/maxresdefault.jpg" alt="Chicago" class="d-block" style="width:100%;height: 689px;">
                </div>
                <div class="carousel-item">
                    <img src="https://img.youtube.com/vi/38mzh3yep5o/maxresdefault.jpg" alt="New York" class="d-block" style="width:100%;height: 689px;">
                </div>
            </div>
            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
            </button>
        </div>
    </section>
    <form action="/Assignment_Java4/Assignment/trangchitiet" method = "post">
    <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row tm-mb-90">
            <div class="col-xl-8 col-lg-7 col-md-6 col-lg-12">
                <iframe width="100%" height="550px" src="https://www.youtube.com/embed/${video.poster}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                <div class="d-flex">
				  <div class="mr-auto p-2"><h3 class="col-12 tm-text-black">${video.titile}</h3> </div>
				</div>
                <div class="d-flex flex-row-reverse">
	                <div class="p-2">
	                	<a><img src="https://img.icons8.com/material/24/000000/more--v1.png"/></a> 
	                </div>
	                <div class="p-2">
	                	<a><img src="https://img.icons8.com/material-sharp/24/000000/save-search.png"/>Save</a>
	                </div>
	                <div class="p-2">
	                	<a data-bs-toggle="modal" data-bs-target="#myModal"><img src="https://img.icons8.com/external-those-icons-lineal-those-icons/24/000000/external-share-network-sharing-those-icons-lineal-those-icons.png"/> Share  </a>
	                </div>
	                <div class="p-2">
	                	<a><img src="https://img.icons8.com/external-those-icons-lineal-those-icons/24/000000/external-dislike-touch-gestures-those-icons-lineal-those-icons.png"/> Dislike</a>
	                </div>
	                <div class="p-2">
	                	<a href="http://localhost:8080/Assignment_Java4/Assignment/likeVideo?id=${param.id }"><img src="https://img.icons8.com/external-those-icons-lineal-those-icons/24/000000/external-like-touch-gestures-those-icons-lineal-those-icons.png"/> Like </a>
	                </div>
                </div>
            	<hr/>
            	<div class="d-flex align-items-end flex-column">
				  <div class="mb-auto p-2">
				  	<button type="button" class="btnn btn-red"> <span>Subscribe</span> </button> 
				  </div>
				</div>
           	</div>
         	 <div class="col-xl-4 col-lg-5 col-md-6 col-sm-12">
                <c:if test="${not empty oldVideo }">
               		<c:forEach var="item" items="${oldVideo}">
	                     <figure class="effect-ming tm-video-item">
	                         <!-- <iframe width="100%" height="300px" src="https://www.youtube.com/embed/${item.poster}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
	                         <img src="https://img.youtube.com/vi/${item.poster}/maxresdefault.jpg" alt="Image" class="img-fluid">
	                         <figcaption class="d-flex align-items-center justify-content-center">
	                             <h2>${item.description }</h2>
	                             <a href="${pageContext.request.contextPath}/Assignment/trangchitiet?id=${item.id}">View more</a>
	                         </figcaption>
	                     </figure>
	                     <div class="d-flex justify-content-between tm-text-gray">
	                         <span>${item.titile }</span>
	                         <span class="tm-text-gray-light">10 Sept 2021</span>
	                         <span>${item.views } views</span>
	                     </div>
	                     <br>
                	</c:forEach>
            	</c:if>
            </div>
        </div>
        <div class="row mb-4">
            <h2 class="col-12 tm-text-primary">
                Related Videos
            </h2>
        </div>
        <div class="row mb-3 tm-gallery">
            <c:if test="${not empty oldVideo }">
               <c:forEach var="item" items="${oldVideo}">
                 <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                     <figure class="effect-ming tm-video-item">
                         <!-- <iframe width="100%" height="300px" src="https://www.youtube.com/embed/${item.poster}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
                         <img src="https://img.youtube.com/vi/${item.poster}/maxresdefault.jpg" alt="Image" class="img-fluid">
                         <figcaption class="d-flex align-items-center justify-content-center">
                             <h2>${item.description }</h2>
                             <a href="${pageContext.request.contextPath}/Assignment/trangchitiet?poster=${item.poster}&views=${item.views}&description=${item.description}">View more</a>
                         </figcaption>
                     </figure>
                     <div class="d-flex justify-content-between tm-text-gray">
                         <span>${item.titile }</span>
                         <span class="tm-text-gray-light">10 Sept 2021</span>
                         <span>${item.views } views</span>
                     </div>
                 </div>
                </c:forEach>
            </c:if>
        </div>
        <!-- row -->
    </div>
    </form>
    <!--  The Modal  -->
	<form action="/Assignment_Java4/Assignment/shareVideo?id=${param.id }" method = "post">
        <div class="modal" id="myModal">
           <div class="modal-dialog modal-lg">
               <div class="modal-content">
                   <!-- Modal Header -->
                   <div class="modal-header">
                       <h4 class="modal-title">Send video to your friend</h4>
                       <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                   </div>
                   <!-- Modal body -->
                   <div class="modal-body">
                       <label>Your friend's email?</label>
                       <input type="text" placeholder="Enter Email" name="email" required>
                   </div>
                   <!-- Modal footer -->
                   <div class="modal-footer">
                       <button type="submit" class="btn-outline-success" data-bs-dismiss="modal">Send</button>
                   </div>
               </div>
            </div>
       	</div>
    </form>
    <!-- End body -->
    <jsp:include page="footer.jsp"/>
    <!-- End Footer -->
</div>
</body>

</html>