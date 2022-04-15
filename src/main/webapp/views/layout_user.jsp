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
    	form{
			padding-top: 70px;
		}
        .d-flex {
            flex-direction: row;
            flex-wrap: wrap;
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
	<form action="/Assignment_Java4/Assignment/layout_user" method = "post">
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
    <section>
        <div id="section1" class="container-fluid bg-light text-white" style="width:100%;padding:10px 20px;">
            <div class="container-fluid tm-container-content tm-mt-60">
                <div class="row mb-4">
                    <h2 class="col-6 tm-text-primary">
                        Latest Videos
                    </h2>
                    <div class="col-6 d-flex justify-content-end align-items-center">
                        <form action="" class="tm-text-primary">
                            Page <input type="text" value="1" size="1" class="tm-input-paging tm-text-primary"> of 200
                        </form>
                    </div>
                </div>
                <div class="row tm-mb-90 tm-gallery">
                   <c:if test="${not empty video }">
		                <c:forEach var="item" items="${video}">
		                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
		                        <figure class="effect-ming tm-video-item">
		                          <!--   <iframe width="100%" height="300px" src="https://www.youtube.com/embed/${item.poster}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
		                            <img src="https://img.youtube.com/vi/${item.poster}/maxresdefault.jpg" alt="Image" class="img-fluid"> 
		                            <figcaption class="d-flex align-items-center justify-content-center">
		                                <h2>${item.description }</h2>
		                                <a href="${pageContext.request.contextPath}/Assignment/trangchitiet?id=${item.id}">View more</a>
		                            </figcaption>
		                        </figure>
		                        <div class="d-flex justify-content-between tm-text-gray">
		                            <span>${item.titile }</span>
		                            <span class="tm-text-gray-light">13 Mar 2020</span>
		                            <span>${item.views } views</span>
		                        </div>
		                    </div>
		                </c:forEach>
	                </c:if>
                </div>
                <!-- row -->
                <div class="row tm-mb-90">
                    <div class="col-12 d-flex justify-content-between align-items-center tm-paging-col">
                        <a href="javascript:void(0);" class="btn btn-primary tm-btn-prev mb-2 disabled">Previous</a>
                        <div class="tm-paging d-flex">
                            <a href="javascript:void(0);" class="active tm-paging-link">1</a>
                            <a href="javascript:void(0);" class="tm-paging-link">2</a>
                            <a href="javascript:void(0);" class="tm-paging-link">3</a>
                            <a href="javascript:void(0);" class="tm-paging-link">4</a>
                        </div>
                        <a href="javascript:void(0);" class="btn btn-primary tm-btn-next">Next Page</a>
                    </div>
                </div>
            </div>
            <!-- container-fluid, tm-container-content -->
        </div>
    </section>
    <hr>
    <section>
        <div id="section2" class="container-fluid bg-light text-white" style="width:100%;padding:10px 20px;">
            <div class="container-fluid tm-container-content tm-mt-60">
                <div class="row mb-4">
                    <h2 class="col-6 tm-text-primary">
                        Review Videos
                    </h2>
                    <div class="col-6 d-flex justify-content-end align-items-center">
                        <form action="" class="tm-text-primary">
                            Page <input type="text" value="1" size="1" class="tm-input-paging tm-text-primary"> of 200
                        </form>
                    </div>
                </div>
                <div class="row tm-mb-90 tm-gallery">
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
                <div class="row tm-mb-90">
                    <div class="col-12 d-flex justify-content-between align-items-center tm-paging-col">
                        <a href="javascript:void(0);" class="btn btn-primary tm-btn-prev mb-2 disabled">Previous</a>
                        <div class="tm-paging d-flex">
                            <a href="javascript:void(0);" class="active tm-paging-link">1</a>
                            <a href="javascript:void(0);" class="tm-paging-link">2</a>
                            <a href="javascript:void(0);" class="tm-paging-link">3</a>
                            <a href="javascript:void(0);" class="tm-paging-link">4</a>
                        </div>
                        <a href="javascript:void(0);" class="btn btn-primary tm-btn-next">Next Page</a>
                    </div>
                </div>
            </div>
            <!-- container-fluid, tm-container-content -->
        </div>
    </section>
    </form>
    <!-- End body -->
    <jsp:include page="footer.jsp"/>
    <!-- End Footer -->
   
</body>

</html>