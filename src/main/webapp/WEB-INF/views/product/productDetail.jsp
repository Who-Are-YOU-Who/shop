<%@ page import="com.whizlab_shop.vo.ProductVo" %>
<%@ page import="com.whizlab_shop.vo.ProductImgVo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.whizlab_shop.vo.CustomerVo" %><%--
  Created by IntelliJ IDEA.
  User: mb.jung
  Date: 2023-06-19
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <jsp:include page="../common/header.jsp"></jsp:include>
    <!-- BEGIN container -->
    <div class="container">

        <%CustomerVo customerVo = new CustomerVo();
            if(session.getAttribute("customer")!=null){
                customerVo = (CustomerVo) session.getAttribute("customer");%>
        <input type="hidden" id="customerId" name="customerId" value="<%=customerVo.getCustomerId()%>">
           <% };
          ProductVo productVo = (ProductVo) request.getAttribute("productVo");
          String prodName = productVo.getProdName();
          String simpleExplain = productVo.getSimpleExplain();
          int prodSalePrice = productVo.getProdSalePrice();
          int prodSeq = productVo.getProdSeq();
          List<ProductImgVo> imageList = productVo.getProdImgList();
        %>
        <input type="hidden" id="customerSeq" name="customerSeq" value="<%=customerVo.getCustomerSeq()%>">

        <!-- BEGIN breadcrumb -->
        <ul class="breadcrumb m-b-10 f-s-12">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Mobile Phone</a></li>
            <li class="breadcrumb-item"><a href="#">Apple</a></li>
            <li class="breadcrumb-item active">iPhone 6S Plus</li>
        </ul>
        <!-- END breadcrumb -->
        <!-- BEGIN product -->
        <div class="product">
            <!-- BEGIN product-detail -->
            <div class="product-detail">
                <!-- BEGIN product-image -->
                <div class="product-image">
                    <!-- BEGIN product-thumbnail -->
                    <div class="product-thumbnail">
                        <ul class="product-thumbnail-list">
                            <%String imgPath = "";
                                for(int i=0; i<imageList.size();i++){
                                  imgPath = imageList.get(i).getProdImgPath();%>
                            <%-- <li class="active"><a href="#" data-click="show-main-image" data-url="../assets/img/product/product-iphone-6s-plus-2.jpg"><img src="../assets/img/product/product-iphone-6s-plus-2.jpg" alt="" /></a></li>--%>
                              <li><a href="javascript:imagChange(<%=imgPath%>);" ><img src="image/product/<%=imgPath%>" alt="" /></a></li>
                               <% }%>
                        </ul>
                    </div>
                    <!-- END product-thumbnail -->
                    <!-- BEGIN product-main-image -->
                    <div class="product-main-image" data-id="main-image">
                        <img id="mainImage" src="image/product/<%=imageList.get(0).getProdImgPath()%>" alt="" />
                    </div>
                    <!-- END product-main-image -->
                </div>
                <!-- END product-image -->
                <!-- BEGIN product-info -->
                <div class="product-info">
                    <form action="/gotoOrder" method="post" id="orderForm">
                    <!-- BEGIN product-info-header -->
                        <input type="hidden" id="prodSeq" name="prodSeq" value="<%=prodSeq%>">
                    <div class="product-info-header">
                        <h1 class="product-title"><%=prodName%></h1>
                        <ul class="product-category">
                            <li><a>전체</a></li>
                            <li>/</li>
                            <li><a href="#">대분류</a></li>
                            <li>/</li>
                            <li><a href="#">소분류</a></li>
                        </ul>
                    </div>
                    <!-- END product-info-header -->
                    <!-- BEGIN product-warranty -->
                    <div class="product-warranty">
                        <div class="pull-right">Availability: 재고있음</div>
                        <div><%=simpleExplain%></div>
                    </div>
                    <!-- END product-warranty -->

                    <!-- BEGIN product-purchase-container -->
                    <div class="product-purchase-container">
                        <div class="product-price">
                            <div class="price"><%=prodSalePrice%>원</div>
                        </div>
                        <div>
                            <i class="icon-arrrow-up"></i>
                            <input id="prodCount" name="prodCount" value="1"/>
                            <i class="icon-arrrow-down"></i>
                        </div>
                        <button class="btn btn-inverse btn-lg" type="button" onclick="addCart()">장바구니</button>
                        <button class="btn btn-inverse btn-lg" type="button" onclick="addOrder()">구매하기</button>
                    </div>
                    <!-- END product-purchase-container -->
                    </form>
                </div>
                <!-- END product-info -->
            </div>
            <!-- END product-detail -->
            <!-- BEGIN product-tab -->
            <div class="product-tab">
                <!-- BEGIN #product-tab -->
                <ul id="product-tab" class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active" href="#product-desc" data-toggle="tab">상품 설명</a></li>
                    <li class="nav-item"><a class="nav-link" href="#product-reviews" data-toggle="tab">리뷰</a></li>
                </ul>
                <!-- END #product-tab -->
                <!-- BEGIN #product-tab-content -->
                <div id="product-tab-content" class="tab-content">
                    <!-- BEGIN #product-desc -->
                    <div class="tab-pane fade active show" id="product-desc">
                        <!-- BEGIN product-desc -->
                        <div class="product-desc">
                            <%=productVo.getProdSummernote()%>
                        </div>
                        <!-- END product-desc -->
                    </div>
                    <!-- END #product-desc -->

                    <!-- BEGIN #product-reviews -->
                    <div class="tab-pane fade" id="product-reviews">
                        <!-- BEGIN row -->
                        <div class="row row-space-30">
                            <!-- BEGIN col-7 -->
                            <div class="col-md-7">
                                <!-- BEGIN review -->
                                <div class="review">
                                    <div class="review-info">
                                        <div class="review-icon"><img src="../assets/img/user/user-1.jpg" alt="" /></div>
                                        <div class="review-rate">
                                            <ul class="review-star">
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class=""><i class="fa fa-star-o"></i></li>
                                            </ul>
                                            (4/5)
                                        </div>
                                        <div class="review-name">Terry</div>
                                        <div class="review-date">24/05/2016 7:40am</div>
                                    </div>
                                    <div class="review-title">
                                        What does “SIM-free” mean?
                                    </div>
                                    <div class="review-message">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in imperdiet augue. Integer non aliquam eros. Cras vehicula nec sapien pretium sagittis. Pellentesque feugiat lectus non malesuada aliquam. Etiam id tortor pretium, dictum leo at, malesuada tortor.
                                    </div>
                                </div>
                                <!-- END review -->
                                <!-- BEGIN review -->
                                <div class="review">
                                    <div class="review-info">
                                        <div class="review-icon"><img src="../assets/img/user/user-2.jpg" alt="" /></div>
                                        <div class="review-rate">
                                            <ul class="review-star">
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class=""><i class="fa fa-star-o"></i></li>
                                                <li class=""><i class="fa fa-star-o"></i></li>
                                            </ul>
                                            (3/5)
                                        </div>
                                        <div class="review-name">George</div>
                                        <div class="review-date">24/05/2016 8:40am</div>
                                    </div>
                                    <div class="review-title">
                                        When I buy iPhone from apple.com, is it tied to a carrier or does it come “unlocked”?
                                    </div>
                                    <div class="review-message">
                                        In mauris leo, maximus at pellentesque vel, pharetra vel risus. Aenean in semper velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi volutpat mattis neque, at molestie tellus ultricies quis. Ut lobortis odio nec nunc ullamcorper, vitae faucibus augue semper. Sed luctus lobortis nulla ac volutpat. Mauris blandit scelerisque sem.
                                    </div>
                                </div>
                                <!-- END review -->
                                <!-- BEGIN review -->
                                <div class="review">
                                    <div class="review-info">
                                        <div class="review-icon"><img src="../assets/img/user/user-3.jpg" alt="" /></div>
                                        <div class="review-rate">
                                            <ul class="review-star">
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                            </ul>
                                            (5/5)
                                        </div>
                                        <div class="review-name">Steve</div>
                                        <div class="review-date">23/05/2016 8:40am</div>
                                    </div>
                                    <div class="review-title">
                                        Where is the iPhone Upgrade Program available?
                                    </div>
                                    <div class="review-message">
                                        Duis ut nunc sem. Integer efficitur, justo sit amet feugiat hendrerit, arcu nisl elementum dui, in ultricies erat quam at mauris. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec nec ultrices tellus. Mauris elementum venenatis volutpat.
                                    </div>
                                </div>
                                <!-- END review -->
                                <!-- BEGIN review -->
                                <div class="review">
                                    <div class="review-info">
                                        <div class="review-icon"><img src="../assets/img/user/user-4.jpg" alt="" /></div>
                                        <div class="review-rate">
                                            <ul class="review-star">
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class=""><i class="fa fa-star-o"></i></li>
                                                <li class=""><i class="fa fa-star-o"></i></li>
                                                <li class=""><i class="fa fa-star-o"></i></li>
                                            </ul>
                                            (2/5)
                                        </div>
                                        <div class="review-name">Alfred</div>
                                        <div class="review-date">23/05/2016 10.02am</div>
                                    </div>
                                    <div class="review-title">
                                        Can I keep my current service plan if I choose the iPhone Upgrade Program?
                                    </div>
                                    <div class="review-message">
                                        Donec vel fermentum quam. Vivamus scelerisque enim eget tristique auctor. Vivamus tempus, turpis iaculis tempus egestas, leo augue hendrerit tellus, et efficitur neque massa at neque. Aenean efficitur eleifend orci at ornare.
                                    </div>
                                </div>
                                <!-- END review -->
                                <!-- BEGIN review -->
                                <div class="review">
                                    <div class="review-info">
                                        <div class="review-icon"><img src="../assets/img/user/user-5.jpg" alt="" /></div>
                                        <div class="review-rate">
                                            <ul class="review-star">
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                                <li class="active"><i class="fa fa-star"></i></li>
                                            </ul>
                                            (5/5)
                                        </div>
                                        <div class="review-name">Edward</div>
                                        <div class="review-date">22/05/2016 9.30pm</div>
                                    </div>
                                    <div class="review-title">
                                        I have an existing carrier contract or installment plan. Can I purchase with the iPhone Upgrade Program
                                    </div>
                                    <div class="review-message">
                                        Aliquam consequat ut turpis non interdum. Integer blandit erat nec sapien sollicitudin, a fermentum dui venenatis. Nullam consequat at enim et aliquet. Cras mattis turpis quis eros volutpat tristique vel a ligula. Proin aliquet leo mi, et euismod metus placerat sit amet.
                                    </div>
                                </div>
                                <!-- END review -->
                            </div>
                            <!-- END col-7 -->
                            <!-- BEGIN col-5 -->
                            <div class="col-md-5">
                                <!-- BEGIN review-form -->
                                <div class="review-form">
                                    <form action="product_detail.html" name="review_form" method="POST">
                                        <h2>Write a review</h2>
                                        <div class="form-group">
                                            <label for="name">Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="name" />
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Title <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="email" />
                                        </div>
                                        <div class="form-group">
                                            <label for="review">Review <span class="text-danger">*</span></label>
                                            <textarea class="form-control" rows="8" id="review"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Rating  <span class="text-danger">*</span></label>
                                            <div class="rating rating-selection" data-rating="true" data-target="rating">
                                                <i class="fa fa-star-o" data-value="2"></i>
                                                <i class="fa fa-star-o" data-value="4"></i>
                                                <i class="fa fa-star-o" data-value="6"></i>
                                                <i class="fa fa-star-o" data-value="8"></i>
                                                <i class="fa fa-star-o" data-value="10"></i>
                                                <span class="rating-comment">
														<span class="rating-comment-tooltip">Click to rate</span>
														</span>
                                            </div>
                                            <select name="rating" class="hide">
                                                <option value="2">2</option>
                                                <option value="4">4</option>
                                                <option value="6">6</option>
                                                <option value="8">8</option>
                                                <option value="10">10</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-inverse btn-lg">Submit Review</button>
                                    </form>
                                </div>
                                <!-- END review-form -->
                            </div>
                            <!-- END col-5 -->
                        </div>
                        <!-- END row -->
                    </div>
                    <!-- END #product-reviews -->
                </div>
                <!-- END #product-tab-content -->
            </div>
            <!-- END product-tab -->
        </div>
        <!-- END product -->
    </div>
    <!-- END container -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<%--End page container--%>

<script src="${pageContext.request.contextPath}/resources/js/jQuery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/css/plugins/js-cookie/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/paroller/jquery.paroller.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/e-commerce/apps.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/theme/apple.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/js-cookie/js.cookie.js"></script>

<script>
    $(document).ready(function() {
        App.init();
    });

    function imagChange(imgPath){
        var img = imgPath;
        console.log("이미지 바꿈");
        $("#mainImage").empty();
        $("#mainImage").attr('src','image/product/'+img);
    }

    /*장바구니*/
    function addCart(){
        var prodSeq = $("#prodSeq").val();
        var prodCount = $("#prodCount").val();
        var customerSeq = $("#customerSeq").val();
        var customerId = $("#customerId").val();
        if(customerId==undefined){ //비로그인
            alert("로그인이 필요합니다.");
        }else{ //로그인
            console.log("로그인되어있음 회원 : "+customerSeq+", id : "+customerId);
            $.ajax({
                type : 'post',
                url : '/addCart',
                data : {
                    "customerSeq" : customerSeq,
                    "prodSeq" : prodSeq,
                    "prodCount" : prodCount
                },
                dataType : "JSON",
                success: function (data){
                   if(data==0){
                       alert("장바구니에 담기 실패했습니다. 재시도 해주세요.");
                   }else{
                       alert("장바구니에 해당 상품이 담겼습니다.");
                   }

                }

            })
        }

    }

    /*주문하기*/
    function  addOrder(){
        var prodSeq = $("#prodSeq").val();
        var prodCount = $("#prodCount").val();
        var customerId = $("#customerId").val();
        if(customerId==undefined){ //비로그인
            alert("로그인이 필요합니다.");
        }else { //로그인
            if(prodSeq!=undefined||prodSeq!=null){ //상품번호가 있을 때
                if(prodCount!=0&&prodCount!=undefined){ //상품개수가 있을 떄
                    console.log("주문폼 제출");
                    $("#orderForm").submit();
                }else{
                    alert("수량을 선택해 주세요.");
                }
            }else{
                alert("잘못된 접근입니다.");
            }
        }
    }
</script>
</body>
</html>
