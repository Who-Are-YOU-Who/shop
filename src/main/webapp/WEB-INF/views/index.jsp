<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="ko">
<!--<![endif]-->
<head>

    <meta charset="UTF-8">
    <title>Whizlab</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/all.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/plugins/animate/animate.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/one-page-parallax/style.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/one-page-parallax/style-responsive.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/one-page-parallax/theme/default.css" id="theme" rel="stylesheet" />
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="${pageContext.request.contextPath}/resources/css/plugins/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>

<body class="bg-silver">
    <div id="product" class="section-container p-t-20" style="margin: auto;">
        <div class="product" style="margin: auto;">
             <div class="item-info" style="width: 1200px; margin: auto;">
                 <div class="card w-120" style="background-color: white;">
                     <div class="card-body">
                         <h3 class="card-title">타이틀 들어갈 부분</h3>
                         <hr/>
                         <h6 class="card-text">작성자 : </h6>
                         <h6 class="card-text">작성일시 : </h6>
                         <hr/>
                         <div>
                             내용 넣을 부분
                         </div>
                         <hr/>
                         <h6>첨부파일 : </h6>
                         <div style="text-align: center">
                             <button type="button" class="btn btn-dark" style="height: 20px; line-height: 4px">목록</button>
                         </div>
                     </div>
                 </div>
             </div>
        </div>
    </div>
    <!-- BEGIN #footer -->
<!-- end theme-panel -->
<!-- ================== BEGIN BASE JS ================== -->
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/bootstrap.bundle.min.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/resources/css/plugins/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/resources/css/plugins/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/scrollMonitor.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery.paroller.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/apps.min.js"></script>
<!-- ================== END BASE JS ================== -->

<script>
    $(document).ready(function() {
        App.init();
    });
</script>
</body>
</html>
