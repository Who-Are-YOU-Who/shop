<%@ page import="com.whizlab_shop.vo.MainProductVo" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>WhizShop</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />

</head>
<body>
<!-- BEGIN #page-container -->
<div id="page-container" class="fade">

	<jsp:include page="common/header.jsp"></jsp:include>

	<!-- BEGIN #slider -->
	<div id="slider" class="section-container p-0 bg-black-darker">
		<!-- BEGIN carousel -->
		<div id="main-carousel" class="carousel slide" data-ride="carousel">
			<!-- BEGIN carousel-inner -->
			<div class="carousel-inner">
				<%List<MainProductVo> mainProductList = (List<MainProductVo>)request.getAttribute("mainProducList");
				String imgPath = "";
				int prodSeq=0;
				String simpleExplain ="";
				String prodName="";
				int prodSalePrice =0;
					for( int i =0; i< mainProductList.size(); i++){
						imgPath = mainProductList.get(i).getImgPath();
						prodSeq = mainProductList.get(i).getProdSeq();
						simpleExplain = mainProductList.get(i).getSimpleExplain();
						prodName = mainProductList.get(i).getProdName();
						prodSalePrice = mainProductList.get(i).getProdSalePrice();
						if(mainProductList.get(i).getMainSeq()==1){%>
				`	<!-- BEGIN item -->
				<div class="carousel-item" id="banner1" data-paroller="true" data-paroller-factor="-0.3" data-paroller-factor-sm="0.01" data-paroller-factor-xs="0.01" style="background: url(${pageContext.request.contextPath}/resources/image/waterWave.jpg) center 0 / cover no-repeat; display: block;">
					<div class="container">
						<img src="image/product/prod16img3" class="product-img left bottom fadeInLeft animated" alt="" />
					</div>
					<div class="carousel-caption">
						<div class="container">
							<h3 class="title m-b-5 fadeInDownBig animated" ><%=prodName%></h3>
							<p class="m-b-15 fadeInDownBig animated"><%=simpleExplain%></p>
							<div class="price fadeInDownBig animated"><small>from</small><%=prodSalePrice%> <span></span></div>
							<a href="/productDetail?prod=<%=prodSeq%>" class="btn btn-outline btn-lg fadeInUpBig animated">Buy Now</a>
						</div>
					</div>
				</div>
				<!-- END item -->
						<%}else if (mainProductList.get(i).getMainSeq()==2) {%>
				<!-- BEGIN item -->
				<div class="carousel-item" id="banner2" data-paroller="true" data-paroller-factor="-0.3" data-paroller-factor-sm="0.01" data-paroller-factor-xs="0.01" style="background: url(${pageContext.request.contextPath}/resources/image/green1.jpg) center 0 / cover no-repeat; display: none;">
					<div class="container">
						<img src="image/product/<%=imgPath%>" class="product-img left bottom fadeInLeft animated" alt="" />
					</div>
					<div class="carousel-caption carousel-caption-right">
						<div class="container">
							<h3 class="title m-b-5 fadeInRightBig animated" style="color: #dba500;"><%=prodName%></h3>
							<p class="m-b-15 fadeInRightBig animated" style="color:#dba500;"><%=simpleExplain%></p>
							<div class="price m-b-30 fadeInRightBig animated"><small>from</small> <span><%=prodSalePrice%></span></div>
							<a href="/productDetail?prod=<%=prodSeq%>" class="btn btn-outline btn-lg fadeInRightBig animated">Buy Now</a>
						</div>
					</div>
				</div>
				<!-- END item -->

					<%}
					}%>
			</div>

			<!-- END carousel-inner -->
			<a class="carousel-control-prev" href="javascript:changeBanner()" data-slide="prev">
				<i class="fa fa-angle-left"></i>
			</a>
			<a class="carousel-control-next" href="javascript:changeBanner()" data-slide="next">
				<i class="fa fa-angle-right"></i>
			</a>
		</div>
		<!-- END carousel -->
	</div>
	<%--<!-- END #slider -->--%>

	<!-- BEGIN #promotions -->
	<div id="promotions" class="section-container bg-white">
		<!-- BEGIN container -->
		<div class="container">
			<!-- BEGIN section-title -->
			<h4 class="section-title clearfix">
				EVENT ITEMS
			</h4>
			<!-- END section-title -->

			<!-- BEGIN row -->
			<div class="row row-space-10">

				<%
					for(int i = 0; i<mainProductList.size();i++){
						imgPath = mainProductList.get(i).getImgPath();
						prodSeq = mainProductList.get(i).getProdSeq();
						simpleExplain = mainProductList.get(i).getSimpleExplain();
						prodName = mainProductList.get(i).getProdName();
						prodSalePrice = mainProductList.get(i).getProdSalePrice();

						if(mainProductList.get(i).getMainSeq()==3){  //할인1%>

				<!-- BEGIN col-6 -->
				<div class="col-md-6">
					<!-- BEGIN promotion -->
					<div class="promotion promotion-lg bg-black-darker">
						<div class="promotion-image text-right promotion-image-overflow-bottom">
							<img src="image/product/<%=imgPath%>" alt="" style="width: 505px; height: 440px;"/>
						</div>
						<div class="promotion-caption promotion-caption-inverse">
							<h4 class="promotion-title" style="color: black;"><%=prodName%></h4>
							<div class="promotion-price" style="color: black;"><small style="color: black;">from</small> <%=prodSalePrice%></div>
							<p class="promotion-desc" style="color: black;"><%=simpleExplain%></p>
							<a href="/productDetail?prod=<%=prodSeq%>" class="promotion-btn" style="color: black;">View More</a>
						</div>
					</div>
					<!-- END promotion -->
				</div>
				<!-- END col-6 -->

						<%} else if (mainProductList.get(i).getMainSeq()==4) { //할인2 %>
				<!-- BEGIN col-3 -->
				<div class="col-md-3 col-sm-6">
					<!-- BEGIN promotion -->
					<div class="promotion bg-blue">
						<div class="promotion-image promotion-image-overflow-bottom promotion-image-overflow-top">
							<img src="image/product/<%=imgPath%>" alt="" />
						</div>
						<div class="promotion-caption promotion-caption-inverse text-right">
							<h4 class="promotion-title" style="color: black;"><%=prodName%></h4>
							<div class="promotion-price" style="color: black;"><small style="color: black;">from</small> <%=prodSalePrice%></div>
							<p class="promotion-desc" style="color: black;"><%=simpleExplain%></p>
							<a href="/productDetail?prod=<%=prodSeq%>" class="promotion-btn" style="color: black;">View More</a>
						</div>
					</div>
					<!-- END promotion -->
				<%} else if (mainProductList.get(i).getMainSeq()==5) {  //할인3%>
					<!-- BEGIN promotion -->
					<div class="promotion bg-silver">
						<div class="promotion-image text-center promotion-image-overflow-bottom">
							<img src="image/product/<%=imgPath%>" alt="" />
						</div>
						<div class="promotion-caption text-center">
							<h4 class="promotion-title"><%=prodName%></h4>
							<div class="promotion-price"><small>from</small> <%=prodSalePrice%></div>
							<p class="promotion-desc"><%=simpleExplain%></p>
							<a href="/productDetail?prod=<%=prodSeq%>" class="promotion-btn">View More</a>
						</div>
					</div>
					<!-- END promotion -->
				</div>
				<%--<!-- END col-3 -->--%>
				<%}else if(mainProductList.get(i).getMainSeq()==6){  //할인4%>
				<%--<!-- BEGIN col-3 -->--%>
				<div class="col-md-3 col-sm-6">
					<%--<!-- BEGIN promotion -->--%>
					<div class="promotion bg-silver">
						<div class="promotion-image text-right">
							<img src="image/product/<%=imgPath%>" alt="" style="width: 270px; height: 200px;"/>
						</div>
						<div class="promotion-caption text-center">
							<h4 class="promotion-title"><%=prodName%></h4>
							<div class="promotion-price"><small>from</small> <%=prodSalePrice%></div>
							<p class="promotion-desc"><%=simpleExplain%></p>
							<a href="/productDetail?prod=<%=prodSeq%>" class="promotion-btn">View More</a>
						</div>
					</div>
				<%--	<!-- END promotion -->--%>
				<%}else if(mainProductList.get(i).getMainSeq()==7){  //할인5%>
					<!-- BEGIN promotion -->
					<div class="promotion bg-black">
						<div class="promotion-image text-right">
							<img src="image/product/<%=imgPath%>" alt="" />
						</div>
						<div class="promotion-caption promotion-caption-inverse">
							<h4 class="promotion-title" style="color: black;"><%=prodName%></h4>
							<div class="promotion-price" style="color: black;"><small>from</small> <%=prodSalePrice%></div>
							<p class="promotion-desc" style="color: black;"><%=simpleExplain%></p>
							<a href="/productDetail?prod=<%=prodSeq%>" class="promotion-btn" style="color: black;">View More</a>
						</div>
					</div>
					<%--<!-- END promotion -->--%>
				</div>
				<%--<!-- END col-3 -->--%>
				<%}
				}%>
			</div>
			<%--<!-- END row -->--%>
		</div>
		<%--<!-- END container -->--%>
	</div>
	<%--<!-- END #promotions -->--%>



<jsp:include page="common/footer.jsp"></jsp:include>
</div>
<%--<!-- END #page-container -->--%>
<script src="${pageContext.request.contextPath}/resources/js/jQuery/jquery-3.3.1.min.js"></script>


<script src="${pageContext.request.contextPath}/resources/css/plugins/js-cookie/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/paroller/jquery.paroller.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/e-commerce/apps.js"></script>


<script>
	$(document).ready(function() {
		App.init();
	});

	function changeBanner(){
		console.log("배너 바꿈====");
		console.log($("#banner1").css('display'));
		if($("#banner1").css('display')=='block'){
			$("#banner1").css('display','none');
			$("#banner2").css('display','block');
		}else{
			$("#banner2").css('display','none');
			$("#banner1").css('display','block');
		}
	}


</script>
</body>
</html>
