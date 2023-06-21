<%@ page import="com.whizlab_shop.vo.CustomerVo" %>
<%@ page import="com.whizlab_shop.vo.UserVo" %><%--
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
                    <a href="/">
                        <img src="../image/whizlabLogoN.png"><small>WhizLab</small>
                        <small>cosmetic shopping service</small>
                    </a>
                </div>
            </div>
            <!-- END navbar-header -->
            <!-- BEGIN header-nav -->
            <div class="header-nav">
                <div class=" collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav">
                        <li class="active"><a href="/">Home</a></li>
                        <li class="dropdown dropdown-full-width dropdown-hover">
                            <a href="#" data-toggle="dropdown">
                                Category
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

                    <li>
                        <%if(session.getAttribute("customer")!=null){
                        CustomerVo customer = (CustomerVo)session.getAttribute("customer");
                        String customerName = customer.getCustomerName();%>

                        <a href="/mypage">
                          마이페이지
                        </a>
                    </li>
                        <li>
                            <a href="/logout">Logout</a>
                        </li>
                        <% }else if (session.getAttribute("user")!=null){
                            System.out.println("user login=========");
                                UserVo user = (UserVo)session.getAttribute("user");
                                String userName = user.getUserName();
                            System.out.println("user login========="+userName);
                        %>

                        <a href="/managementPage">
                            관리자페이지
                        </a>
                        </li>
                        <li>
                            <a href="/logout">Logout</a>
                        </li>
                        <%}else {%>
                        <a href="/login">
                            <span class="d-none d-xl-inline">Login</span>
                        </a>
                    </li>
                        <li>
                            <a href="/registerpage">
                                <span class="d-none d-xl-inline">Register</span>
                            </a>
                        </li>

                        <%}%>
                        </li>

                        <li>
                            <a href="/customerService">Customer Service</a>
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

