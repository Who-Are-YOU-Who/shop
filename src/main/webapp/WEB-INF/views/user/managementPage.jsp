<%@ page import="com.whizlab_shop.vo.UserVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 페이지</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />


</head>
<body>
<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
<jsp:include page="../common/sidemenu.jsp"></jsp:include>
    <%
        UserVo user = (UserVo)session.getAttribute("user");
        String userName = user.getUserName();
        String userId = user.getUserId();
        String userEmail = user.getUserEmail();
        String userMobile = user.getUserMobile();
    %>
    <div id="changeContent">
    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
            <li class="breadcrumb-item"><a href="javascript:;">Dashboard</a></li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Ovarall</h1>
        <!-- end page-header -->

        <!-- begin row -->
        <div class="row">
            <!-- begin col-3 -->
            <div class="col-lg-3 col-md-6">
                <div class="widget widget-stats bg-white text-inverse">
                    <div class="stats-icon stats-icon-square bg-gradient-blue"><i class="ion-ios-analytics"></i></div>
                    <div class="stats-content">
                        <div class="stats-title">TODAY'S VISITS</div>
                        <div class="stats-number">7,842,900명</div>
                        <div class="stats-progress progress">
                            <div class="progress-bar" style="width: 70.1%;"></div>
                        </div>
                        <div class="stats-desc">Better than last week (70.1%)</div>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-lg-3 col-md-6">
                <div class="widget widget-stats bg-white text-inverse">
                    <div class="stats-icon stats-icon-square bg-gradient-blue"><i class="ion-ios-pricetags"></i></div>
                    <div class="stats-content">
                        <div class="stats-title">TODAY'S PROFIT</div>
                        <div class="stats-number">1,802,000원</div>
                        <div class="stats-progress progress">
                            <div class="progress-bar" style="width: 40.5%;"></div>
                        </div>
                        <div class="stats-desc">Better than last week (40.5%)</div>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-lg-3 col-md-6">
                <div class="widget widget-stats bg-white text-inverse">
                    <div class="stats-icon stats-icon-square bg-gradient-blue"><i class="ion-ios-cart"></i></div>
                    <div class="stats-content">
                        <div class="stats-title">NEW ORDERS</div>
                        <div class="stats-number">900건</div>
                        <div class="stats-progress progress">
                            <div class="progress-bar" style="width: 76.3%;"></div>
                        </div>
                        <div class="stats-desc">Better than last week (76.3%)</div>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-lg-3 col-md-6">
                <div class="widget widget-stats bg-white text-inverse">
                    <div class="stats-icon stats-icon-square bg-gradient-blue"><i class="ion-ios-chatboxes"></i></div>
                    <div class="stats-content">
                        <div class="stats-title">NEW REVIEWS</div>
                        <div class="stats-number">88개</div>
                        <div class="stats-progress progress">
                            <div class="progress-bar" style="width: 54.9%;"></div>
                        </div>
                        <div class="stats-desc">Better than last week (54.9%)</div>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
        </div>
        <!-- end row -->

        <!-- begin row -->
        <div class="row">
            <!-- begin col-8 -->
            <div class="col-lg-8">
                <div class="widget-chart with-sidebar">
                    <div class="widget-chart-content bg-black">
                        <h4 class="chart-title">
                            Visitors Analytics
                            <small>Where do our visitors come from</small>
                        </h4>
                        <div id="visitors-line-chart" class="widget-chart-full-width nvd3-inverse-mode" style="height: 260px;"></div>
                    </div>
                    <div class="widget-chart-sidebar bg-black-darker">
                        <div class="chart-number">
                            1,225,729
                            <small>Total visitors</small>
                        </div>
                        <div id="visitors-donut-chart" class="nvd3-inverse-mode p-t-10" style="height: 180px"></div>
                        <ul class="chart-legend f-s-11">
                            <li><i class="fa fa-circle fa-fw text-primary f-s-9 m-r-5 t-minus-1"></i> 34.0% <span>New Visitors</span></li>
                            <li><i class="fa fa-circle fa-fw text-aqua f-s-9 m-r-5 t-minus-1"></i> 56.0% <span>Return Visitors</span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- end col-8 -->
            <!-- begin col-4 -->
            <div class="col-lg-4">
                <!-- begin panel -->
                <div class="panel panel-inverse" data-sortable-id="index-1">
                    <div class="panel-heading">
                        <h4 class="panel-title">관리자 정보</h4>
                    </div>
                    <ul style="list-style: none; margin-top: 3%;">
                        <li>
                            <a href="javascript:;"><img src="../assets/img/user/user-5.jpg" alt="" /></a>
                            <h4 class="username text-ellipsis">관리자 이름 : <%=userName%></h4>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="../assets/img/user/user-3.jpg" alt="" /></a>
                            <h4 class="username text-ellipsis">관리자 아이디 : <%=userId%></h4>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="../assets/img/user/user-1.jpg" alt="" /></a>
                            <h4 class="username text-ellipsis">관리자 이메일 : <%=userEmail%></h4>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="../assets/img/user/user-8.jpg" alt="" /></a>
                            <h4 class="username text-ellipsis">관리자 전화번호 : <%=userMobile%></h4>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="../assets/img/user/user-8.jpg" alt="" /></a>
                            <h4 class="username text-ellipsis">관리자 권한 : </h4>
                        </li>
                    </ul>
                    <div class="panel-footer text-center">
                        <a href="/editUser" class="text-inverse">수정하기</a>
                    </div>
                </div>
                <!-- end panel -->
            </div>
            <!-- end col-4 -->
        </div>
        <!-- end row -->

        <!-- begin row -->
        <div class="row">

            <!-- begin col-6 -->
            <div class="col-lg-6">
                <!-- begin panel -->
                <div class="panel panel-inverse" data-sortable-id="index-3">
                    <div class="panel-heading">
                        <h4 class="panel-title">Monthly Event</h4>
                    </div>
                    <div id="schedule-calendar" class="bootstrap-calendar"></div>
                    <div class="list-group">
                        <a href="javascript:;" class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                            Sales Reporting
                            <span class="badge f-w-500 bg-blue f-s-10">9:00 am</span>
                        </a>
                        <a href="javascript:;" class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                            Have a meeting with sales team
                            <span class="badge f-w-500 bg-aqua f-s-10">2:45 pm</span>
                        </a>
                    </div>
                </div>
                <!-- end panel -->
            </div>
            <!-- end col-6 -->

            <!-- begin col-6 -->
            <div class="col-lg-6">
                <div class="panel panel-inverse" data-sortable-id="index-4">
                    <div class="panel-heading">
                        <h4 class="panel-title">공지사항</h4>
                    </div>
                    <div class="list-group">
                        <a href="javascript:;" class="list-group-item list-group-item-inverse d-flex justify-content-between align-items-center text-ellipsis">
                           1. 배송지연 안내
                        </a>
                        <a href="javascript:;" class="list-group-item list-group-item-inverse d-flex justify-content-between align-items-center text-ellipsis">
                            2. 배송 기간 안내
                        </a>
                        <a href="javascript:;" class="list-group-item list-group-item-inverse d-flex justify-content-between align-items-center text-ellipsis">
                            3. 5월의 할인
                        </a>
                    </div>
                </div>
            </div>
            <!-- end col-6 -->
        </div>
        <!-- end row -->
    </div>
    <!-- end #content -->
    </div>

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->
<script>

</script>
</body>
</html>
