<%--
  Created by IntelliJ IDEA.
  User: mb.jung
  Date: 2023-05-18
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>

  <link href="${pageContext.request.contextPath}/resources/css/default/style.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/default/style-responsive.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/default/theme/default.css" rel="stylesheet" id="theme" />
</head>



<body class="pace-top bg-white">
<jsp:include page="../common/header.jsp"></jsp:include>
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
<div id="page-container" >
  <!-- begin login -->
  <div class="login login-with-news-feed">
    <!-- begin news-feed -->
    <div class="news-feed">
      <div class="news-image" style="background-image: url(image/green1.jpg)"></div>
      <div class="news-caption">

      </div>
    </div>
    <!-- end news-feed -->
    <!-- begin right-content -->
    <div class="right-content">
      <!-- begin login-header -->
      <div class="login-header" style="margin-top: 20%;">
        <div class="brand">
          <b>Whizlab</b>
        </div>
        <div class="icon">
          <i class="fa fa-sign-in"></i>
        </div>
      </div>
      <!-- end login-header -->
      <!-- begin login-content -->
      <div class="login-content">
        <form action="/checkLogin" method="POST" class="margin-bottom-0">
          <div class="form-group m-b-15">
            <input type="text" class="form-control form-control-lg" placeholder="ID" required id="customerId" name="customerId"/>
          </div>
          <div class="form-group m-b-15">
            <input type="password" class="form-control form-control-lg" placeholder="Password" required required id="customerPw" name="customerPw"/>
          </div>
          <div class="checkbox checkbox-css m-b-30">
            <input type="checkbox" id="remember_me_checkbox" value="" />
            <label for="remember_me_checkbox">
              Remember Me
            </label>
          </div>
          <div class="login-buttons">
            <button type="submit" class="btn btn-success btn-block btn-lg">Sign me in</button>
          </div>
          <div class="m-t-20 m-b-40 p-b-40 text-inverse">
            Not a member yet? Click <a href="/registerpage" class="text-success">here</a> to register.
          </div>
          <hr />
          <p class="text-center text-grey-darker">
            &copy; Whizlab All Right Reserved 2023
          </p>
        </form>
      </div>
      <!-- end login-content -->
    </div>
    <!-- end right-container -->
  </div>
  <!-- end login -->
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
 $(document).ready(function (){

   //아이디 쿠키저장
   // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
   var key = getCookie("key");

   $("#customerId").val(key);

   // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
   if($("#customerId").val() != ""){
     $("#remember_me_checkbox").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
   }

 });

 $("#remember_me_checkbox").change(function(){ // 체크박스에 변화가 있다면,
   if($("#remember_me_checkbox").is(":checked")){ // ID 저장하기 체크했을 때,
     console.log("쿠키 저장 =====");
     setCookie("key", $("#customerId").val(), 7); // 7일 동안 쿠키 보관
   }else{ // ID 저장하기 체크 해제 시,
     console.log("쿠키 삭제 =====");
     deleteCookie("key");
   }
 });

 // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
 $("#customerId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
   if($("#remember_me_checkbox").is(":checked")){ // ID 저장하기를 체크한 상태라면,
     setCookie("key", $("#customerId").val(), 7); // 7일 동안 쿠키 보관
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
