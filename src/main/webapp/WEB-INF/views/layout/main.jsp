<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<% pageContext.setAttribute("timeStamp", new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())) ;%>--%>
<%--<%@ page import="java.text.SimpleDateFormat" %>--%>
<%--<%@ page import="java.util.Date" %>--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <title>WhizLab</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Custom fonts for this template-->
    <!-- CSS -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <%-- jQuery css --%>
    <link href="${pageContext.request.contextPath}/resources/css/jquery/jquery-ui.min.css" rel="stylesheet">

    <%-- bootstrap5 --%>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">

    <%-- Color Admin css --%>
    <link href="${pageContext.request.contextPath}/resources/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/colorAdmin/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/colorAdmin/style.min.css?ver=0.0.3" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/colorAdmin/style-responsive.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/colorAdmin/default.css" rel="stylesheet">

    <%-- DataTable css--%>
    <link href="${pageContext.request.contextPath}/resources/css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/dataTable/responsive.dataTables.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/dataTable/buttons.bootstrap.min.css" rel="stylesheet">

    <%-- summernote css--%>
    <link href="${pageContext.request.contextPath}/resources/css/summernote/summernote.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css" rel="stylesheet">

    <%-- parsley css --%>
<%--    <link href="${pageContext.request.contextPath}/resources/css/parsley.css" rel="stylesheet">--%>

    <%-- isotope css --%>
    <link href="${pageContext.request.contextPath}/resources/css/isotope.css" rel="stylesheet">


    <%-- Color Admin js --%>
    <script src="${pageContext.request.contextPath}/resources/js/colorAdmin/pace.min.js"></script>
    <%-- jQuery js --%>
    <script src="${pageContext.request.contextPath}/resources/js/jQuery/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jQuery/jquery-ui.min.js"></script>
    <%-- bootstrap js --%>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap-show-password.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/colorAdmin/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jQuery/js.cookie.js" type="application/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/colorAdmin/default.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/colorAdmin/apps.min.js"></script>

    <%-- DataTable js--%>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.flash.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/table-manage-default.demo.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/table-manage-buttons.demo.min.js"></script>

    <%-- summernote 사용을 위한 js--%>
    <script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-ko-KR.min.js"></script>

    <%-- parsley js --%>
<%--    <script src="${pageContext.request.contextPath}/resources/js/parsley/parsley.min.js?ver=0.0.1"></script>--%>
    <%-- isotope js --%>
    <script src="${pageContext.request.contextPath}/resources/js/isotope/jquery.isotope.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/isotope/gallery.demo.min.js"></script>

    <%-- sweetalert js --%>
    <script src="${pageContext.request.contextPath}/resources/js/sweetalert/sweetalert.min.js"></script>
<body id="page-top">
    <script>
        $(document).ready(function() {
            App.init();
            Gallery.init();
            TableManageButtons.init();
            // TableManageDefault.init();
        });
    </script>
    <div id="page-container" class="fade page-sidebar-fixed page-header-fixed show">
        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="left"/>
        <div id="content" class="content">
            <tiles:insertAttribute name="content"/>
            <div class="app-footer mx-0 px-0">
                <span class="m-0 font-weight-bold text-gray-800">Copyright &copy; <a href="http://www.whizlab.co.kr">Whizlab</a> 2023-02-06</span>
            </div>
            <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
        </div>
    </div>
</body>
</html>