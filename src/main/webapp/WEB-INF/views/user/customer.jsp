<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 페이지</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />


</head>
<body>
<!-- begin #content -->
<div id="content" class="content">
    <jsp:include page="../common/sidemenu.jsp"></jsp:include>
    <!-- begin breadcrumb -->
    <ol class="breadcrumb pull-right">
        <li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
        <li class="breadcrumb-item"><a href="javascript:;">Dashboard</a></li>
    </ol>
    <!-- end breadcrumb -->
    <!-- begin page-header -->
    <h1 class="page-header">회원</h1>
    <!-- end page-header -->


            <!-- begin panel -->
            <div class="panel panel-inverse" >
                <div class="panel-heading">
                    <div class="panel-heading-btn">
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                    </div>
                    <h4 class="panel-title">시간대별 방문자 요약</h4>
                </div>
                <div class="panel-body">
                    <div id="interactive-chart" class="height-sm"></div>
                </div>
            </div>
            <!-- end panel -->

    <div class="row">
        <div class="col-6">
            <!-- begin panel -->
            <div class="panel panel-inverse" >
                <div class="panel-heading">
                    <h4 class="panel-title">회원 활동내용</h4>
                </div>
                <div id="schedule-calendar" class="bootstrap-calendar"></div>
                <div class="list-group">
                    <a href="javascript:;" class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                        '손유라' 회원이 가입했습니다.
                        <span class="badge f-w-500 bg-blue f-s-10">9:00 am</span>
                    </a>
                    <a href="javascript:;" class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                        '손유라' 회원 등급이 'Siver'로 변경되었습니다.
                        <span class="badge f-w-500 bg-aqua f-s-10">2:45 pm</span>
                    </a>
                    <a href="javascript:;" class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                        '정후추' 회원이 가입했습니다.
                        <span class="badge f-w-500 bg-aqua f-s-10">3:28 pm</span>
                    </a>
                    <a href="javascript:;" class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                        '정후추' 회원 등급이 'Siver'로 변경되었습니다.
                        <span class="badge f-w-500 bg-aqua f-s-10">4:00 pm</span>
                    </a>
                    <a href="javascript:;" class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                        '정후추' 회원이 활동 중지 되었습니다.
                        <span class="badge f-w-500 bg-aqua f-s-10">6:45 pm</span>
                    </a>
                </div>
            </div>
            <!-- end panel -->
        </div>


        <div class="col-6">
            <!-- begin panel -->
            <div class="panel panel-inverse" >
                <div class="panel-heading">
                    <div class="panel-heading-btn">
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                    </div>
                    <h4 class="panel-title">일별 방문자 요약</h4>
                </div>
                <div class="panel-body">
                    <div id="datepicker-inline" class="datepicker-full-width overflow-y-scroll position-relative">
                        <div></div>
                    </div>
                </div>
            </div>
            <!-- end panel -->
        </div>

    </div>
</div>
<!-- end #content -->

<script>
    Dashboard.init();
</script>
</body>
</html>