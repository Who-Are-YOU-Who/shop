<%--
  Created by IntelliJ IDEA.
  User: mb.jung
  Date: 2023-05-16
  Time: 오전 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>

<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/font-awesome/5.3/css/all.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/animate/animate.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/e-commerce/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/e-commerce/style-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/e-commerce/theme/default.css" id="theme" rel="stylesheet" />
<!-- ================== END BASE CSS STYLE ================== -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="${pageContext.request.contextPath}/resources/css/plugins/pace/pace.min.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- BEGIN #top-nav -->
<div id="top-nav" class="top-nav">
    <!-- BEGIN container -->
    <div class="container">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown dropdown-hover">
                    <a href="#" data-toggle="dropdown"><img src="image/flag-korean.png" class="flag-img" alt="" /> Korean <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" class="dropdown-item"><img src="image/flag-english.png" class="flag-img" alt="" /> English</a></li>
                        <li><a href="#" class="dropdown-item"><img src="image/flag-chinese.png" class="flag-img" alt="" /> Chinese</a></li>
                    </ul>
                </li>
                <li><a href="#">Customer Care</a></li>
                <li><a href="#">Order Tracker</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Career</a></li>
                <li><a href="#">Our Forum</a></li>
                <li><a href="#">Newsletter</a></li>
                <li><a href="#"><i class="fab fa-facebook-f f-s-14"></i></a></li>
                <li><a href="#"><i class="fab fa-twitter f-s-14"></i></a></li>
                <li><a href="#"><i class="fab fa-instagram f-s-14"></i></a></li>
                <li><a href="#"><i class="fab fa-dribbble f-s-14"></i></a></li>
                <li><a href="#"><i class="fab fa-google f-s-14"></i></a></li>
            </ul>
        </div>
    </div>
    <!-- END container -->
</div>
<!-- END #top-nav -->
<!-- BEGIN #header -->
<div id="header" class="header">
    <!-- BEGIN container -->
    <div class="container">
        <!-- BEGIN header-container -->
        <div class="header-container">
            <!-- BEGIN navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="header-logo">
                    <a href="index.html">
                        <span class="brand"></span>
                        <span>Color</span>Admin
                        <small>e-commerce frontend theme</small>
                    </a>
                </div>
            </div>
            <!-- END navbar-header -->
            <!-- BEGIN header-nav -->
            <div class="header-nav">
                <div class=" collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav">
                        <li class="active"><a href="index.html">Home</a></li>
                        <li class="dropdown dropdown-full-width dropdown-hover">
                            <a href="#" data-toggle="dropdown">
                                Our Store
                                <b class="caret"></b>
                                <span class="arrow top"></span>
                            </a>
                            <!-- BEGIN dropdown-menu -->
                            <div class="dropdown-menu p-0">
                                <!-- BEGIN dropdown-menu-container -->
                                <div class="dropdown-menu-container">
                                    <!-- BEGIN dropdown-menu-sidebar -->
                                    <div class="dropdown-menu-sidebar">
                                        <h4 class="title">Categories</h4>
                                        <ul class="dropdown-menu-list">
                                            <li><a href="javascript:selectCategory()">기초 스킨케어 <i class="fa fa-angle-right pull-right"></i></a></li>
                                            <li><a href="/">메이크업 <i class="fa fa-angle-right pull-right"></i></a></li>
                                            <li><a href="/">헤어/바디 <i class="fa fa-angle-right pull-right"></i></a></li>
                                            <li><a href="/">남성 <i class="fa fa-angle-right pull-right"></i></a></li>
                                            <li><a href="/">미용 소품 <i class="fa fa-angle-right pull-right"></i></a></li>
                                            <li><a href="/">기획세트 <i class="fa fa-angle-right pull-right"></i></a></li>
                                        </ul>
                                    </div>
                                    <!-- END dropdown-menu-sidebar -->
                                    <!-- BEGIN dropdown-menu-content -->
                                    <div class="dropdown-menu-content">
                                        <h4 class="title">기초 스킨케어</h4>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <ul class="dropdown-menu-list">
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 에센스/세럼/앰플</a></li>
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 로션/크림</a></li>
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 스킨/토너/미스트</a></li>
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 선케어</a></li>
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 클렌징</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6">
                                                <ul class="dropdown-menu-list">
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 팩/마스크</a></li>
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 립/아이케어</a></li>
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 오일/마사지</a></li>
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 기획 세트</a></li>
                                                    <li><a href="/"><i class="fa fa-fw fa-angle-right text-muted"></i> 기타</a></li>
                                                </ul>
                                            </div>

                                        </div>

                                    </div>
                                    <!-- END dropdown-menu-content -->
                                </div>
                                <!-- END dropdown-menu-container -->
                            </div>
                            <!-- END dropdown-menu -->
                        </li>

                        <li><a href="product.html">New Arrival</a></li>

                        <li class="dropdown dropdown-hover">
                            <a href="#" data-toggle="dropdown">
                                <i class="fa fa-search search-btn"></i>
                                <span class="arrow top"></span>
                            </a>
                            <div class="dropdown-menu p-15">
                                <form action="search_results.html" method="POST" name="search_form">
                                    <div class="input-group">
                                        <input type="text" placeholder="Search" class="form-control bg-silver-lighter" />
                                        <div class="input-group-append">
                                            <button class="btn btn-inverse" type="submit"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- END header-nav -->
            <!-- BEGIN header-nav -->
            <div class="header-nav">
                <ul class="nav pull-right">
                    <li class="dropdown dropdown-hover">
                        <a href="#" class="header-cart" data-toggle="dropdown">
                            <i class="fa fa-shopping-bag"></i>
                            <span class="total">2</span>
                            <span class="arrow top"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-cart p-0">
                            <div class="cart-header">
                                <h4 class="cart-title">Shopping Bag (1) </h4>
                            </div>
                            <div class="cart-body">
                                <ul class="cart-item">
                                    <li>
                                        <div class="cart-item-image"><img src="image/ample.jpg" alt="" /></div>
                                        <div class="cart-item-info">
                                            <h4>iPad Pro Wi-Fi 128GB - Silver</h4>
                                            <p class="price">$699.00</p>
                                        </div>
                                        <div class="cart-item-close">
                                            <a href="#" data-toggle="tooltip" data-title="Remove">&times;</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="cart-item-image"><img src="image/skincare.jpg" alt="" /></div>
                                        <div class="cart-item-info">
                                            <h4>21.5-inch iMac</h4>
                                            <p class="price">$1299.00</p>
                                        </div>
                                        <div class="cart-item-close">
                                            <a href="#" data-toggle="tooltip" data-title="Remove">&times;</a>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <div class="cart-footer">
                                <div class="row row-space-10">
                                    <div class="col-xs-6">
                                        <a href="checkout_cart.html" class="btn btn-default btn-block">View Cart</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href="checkout_cart.html" class="btn btn-inverse btn-block">Checkout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="/login">
                            <span class="d-none d-xl-inline">Login</span>
                        </a>
                    </li>
                    <li>
                        <a href="/registerpage">
                            <span class="d-none d-xl-inline">Register</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- END header-nav -->
        </div>
        <!-- END header-container -->
    </div>
    <!-- END container -->
</div>
<!-- END #header -->


</body>

