<%--
  Created by IntelliJ IDEA.
  User: mb.jung
  Date: 2023-05-22
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>

  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
  <meta content="" name="description" />
  <meta content="" name="author" />

  <!-- ================== BEGIN BASE CSS STYLE ================== -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/plugins/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/plugins/font-awesome/5.3/css/all.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/plugins/animate/animate.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/default/style.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/default/style-responsive.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/default/theme/default.css" rel="stylesheet" id="theme" />
  <!-- ================== END BASE CSS STYLE ================== -->

  <!-- ================== BEGIN BASE JS ================== -->
  <script src="${pageContext.request.contextPath}/resources/css/plugins/pace/pace.min.js"></script>
  <!-- ================== END BASE JS ================== -->
</head>
<body class="pace-top">
<%if(session.getAttribute("msg")!=null){
  String message = (String)session.getAttribute("msg");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
  $(document).ready(function (){

    //alert
    let mes = "<%=message%>";
    console.log(mes);
    alert(mes);


  })

</script>

<%
  }
  session.removeAttribute("msg");
%>
<!-- begin #page-container -->
<div id="page-container">
  <!-- begin login -->
  <div class="login bg-black animated fadeInDown">
    <!-- begin brand -->
    <div class="login-header">
      <div class="brand">
        <span class="logo"></span> <b>Whizlab</b> Admin
        <small>위즈랩 관리자 로그인</small>
      </div>
      <div class="icon">
        <i class="fa fa-lock"></i>
      </div>
    </div>
    <!-- end brand -->
    <!-- begin login-content -->
    <div class="login-content">
      <form action="/userLoginCheck" method="POST" class="margin-bottom-0">
        <div class="form-group m-b-20">
          <input type="text" class="form-control form-control-lg inverse-mode" placeholder="Id" id="userId" name="userId" required />
        </div>
        <div class="form-group m-b-20">
          <input type="password" class="form-control form-control-lg inverse-mode" placeholder="Password" id="userPw" name="userPw" required />
        </div>
        <div class="checkbox checkbox-css m-b-20">
          <input type="checkbox" id="remember_me_checkbox" />
          <label for="remember_me_checkbox">
            Remember Me
          </label>
        </div>
        <div class="login-buttons">
          <button type="submit" class="btn btn-success btn-block btn-lg">Sign me in</button>
        </div>
      </form>
    </div>
    <!-- end login-content -->
  </div>
  <!-- end login -->


</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/plugins/jquery-ui/jquery-ui.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/plugins/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/resources/css/crossbrowserjs/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/crossbrowserjs/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/resources/css/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/js-cookie/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/theme/default.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/apps.min.js"></script>
<!-- ================== END BASE JS ================== -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
  $(document).ready(function() {
    //아이디 쿠키저장
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");

    $("#userId").val(key);

    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    if($("#userId").val() != ""){
      $("#remember_me_checkbox").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
  });



  $("#remember_me_checkbox").change(function(){ // 체크박스에 변화가 있다면,
    if($("#remember_me_checkbox").is(":checked")){ // ID 저장하기 체크했을 때,
      console.log("쿠키 저장 =====");
      setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
    }else{ // ID 저장하기 체크 해제 시,
      console.log("쿠키 삭제 =====");
      deleteCookie("key");
    }
  });

  // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
  $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
    if($("#remember_me_checkbox").is(":checked")){ // ID 저장하기를 체크한 상태라면,
      setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
    }
  });

  // 쿠키 저장하기
  // setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
  function setCookie(cookieName, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value)
            + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
  }

  // 쿠키 삭제
  function deleteCookie(cookieName) {
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires="
            + expireDate.toGMTString();
  }

  // 쿠키 가져오기
  function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if (start != -1) { // 쿠키가 존재하면
      start += cookieName.length;
      var end = cookieData.indexOf(';', start);
      if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정
        end = cookieData.length;
      console.log("end위치  : " + end);
      cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
  }

</script>
</body>
</html>

