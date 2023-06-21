<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/default/style.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/default/style-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/default/theme/default.css" rel="stylesheet" id="theme" />

<body class="pace-top bg-white">
<jsp:include page="../common/header.jsp"></jsp:include>
<%
  if(session.getAttribute("msg")!=null){

  String msg = (String)session.getAttribute("msg");
  if(msg!=null||msg.equals("")){%>
    <script>
      alert(msg);
    </script>
 <% }
 }
%>

<!-- begin #page-container -->
<div id="page-container" >
  <!-- begin register -->
  <div class="register register-with-news-feed">
    <!-- begin news-feed -->
    <div class="news-feed">
      <div class="news-image" style="background-image: url(image/waterWave.jpg)"></div>

    </div>
    <!-- end news-feed -->
    <!-- begin right-content -->
    <div class="right-content" style="background-color: #1b6d85;">
      <!-- begin register-header -->
      <h1 class="register-header" style="margin-top: 5%; color: white;">
        Sign Up
        <small style="color: #EED3D7">Create your Account. It’s free and always will be.</small>
      </h1>
      <!-- end register-header -->
      <!-- begin register-content -->
      <div class="register-content" style="margin-top: 7%;">
        <form action="/registerUser" method="POST" class="margin-bottom-0">
          <label class="control-label" style="color: white;">Name <span class="text-danger">*</span></label>
          <div class="row m-b-15">
            <div class="col-md-12">
              <input type="text" class="form-control" placeholder="이름" id="userName" name="userName" required />
            </div>
          </div>
          <label class="control-label" style="color: white;">ID <span class="text-danger">*</span></label>
          <div class="row m-b-15">
            <div class="col-md-9">
              <input type="text" class="form-control" placeholder="아이디"  id="userId" name="userId" onkeydown="idDelChk()" required />
            </div>
            <div class="col-md-3">
              <button class="btn btn-primary btn-block btn-lg" type="button" id="idChkBtn" onclick="checkIdDupicate()" value="0">아이디 중복검사</button>
            </div>
          </div>
          <label class="control-label" style="color: white;">Password (영문,숫자,특수문자 포함 8~20자)<span class="text-danger">*</span></label>
          <div class="row m-b-15">
            <div class="col-md-12">
              <input type="password" class="form-control" placeholder="비밀번호" id="userPw" name="userPw" required />
            </div>
          </div>
          <label class="control-label" style="color: white;">Email <span class="text-danger">*</span></label>
          <div class="row m-b-15">
            <input type="hidden" id="userEmail" name="userEmail">
            <div class="col-md-6">
              <input type="text" class="form-control" placeholder="이메일 주소" id="email" name="email" required />
            </div>
            <div class="col-md-6">
              <select class="form-control" id="address" name="address" required>
                <option>@gmail.com</option>
                <option>@naver.com</option>
                <option>@daum.net</option>
              </select>
            </div>
          </div>
          <label class="control-label" style="color: white;">Mobile(11자리 , "-"없이 숫자만 입력) <span class="text-danger">*</span></label>
          <div class="row m-b-15">
            <div class="col-md-12">
              <input type="text" class="form-control" placeholder="핸드폰 번호" id="customerMobile" name="userMobile" onkeyup="mobileChk()" required />
            </div>
          </div>

          <div class="checkbox checkbox-css m-b-30" style="margin-top: 50px;">
            <div class="checkbox checkbox-css m-b-30">
              <input type="checkbox" id="agreement_checkbox" value="">
              <label for="agreement_checkbox">
                By clicking Sign Up, you agree to our <a href="javascript:checkAgreement();">Terms</a> and that you have read our <a href="javascript:;">Data Policy</a>, including our <a href="javascript:;">Cookie Use</a>.
              </label>
            </div>
          </div>
          <div class="register-buttons" style="margin-top: 50px;">
            <button type="submit" class="btn btn-primary btn-block btn-lg">Sign Up</button>
          </div>
          <div class="m-t-20 m-b-40 p-b-40 text-inverse" >
            Already a member? Click <a href="/login">here</a> to login.<br/>
            Register for Admin? Click <a href="/adminRegisterpage">here</a> to register.
          </div>

          <hr />
          <p class="text-center" style="margin-top: 50px;">
            &copy; Whizlab Reserved 2023
          </p>
        </form>
      </div>
      <!-- end register-content -->
    </div>
    <!-- end right-content -->
  </div>
  <!-- end register -->

  <%-- <jsp:include page="../common/footer.jsp"></jsp:include>--%>
</div>


</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
  $("form").submit(function (){

    //아이디 중복체크 여부
    if($("#idChkBtn").val()==0){
      alert("아이디 중복검사를 해주세요.");
      event.preventDefault();
    }

    //이메일 문자열 저장
    let email = $("#email").val();
    let address = $("#address").val();
    $("#userEmail").val(email+address);

    //전화번호 길이
    let mobilelength = $("#userMobile").val().length;
    console.log("mobile length : "+mobilelength);
    if(mobilelength > 11 ||mobilelength < 11){
      alert("전화번호는 11자리 입력해 주세요.");
      event.preventDefault();
    }


    /*동의서 체크*/
    if(!$("#agreement_checkbox").is(':checked')) {
      alert("이용약관에 동의해 주시길 바랍니다.");
      event.preventDefault();
    }

    /*유효성 검사*/

    //비밀번호 유효성 검사
    if(!checkPw()){event.preventDefault();};


  })

  //아이디 중복 검사
  function  checkIdDupicate(){
    console.log("아이디 중복검사 시작====")
    let id = $("#userId").val();
    $.ajax({
      type : 'post',
      url : "/checkUserIdDupicate",
      data : {
        userId : id
      },
      dataType : "text",
      success : function (data){
        console.log(data);
        if(data == 0){
          alert("사용가능한 아이디 입니다.");
          console.log("사용가능한 아이디 입니다.");
          $("#idChkBtn").val(1);
        }else if(data == 1){
          alert("이미 사용중인 아이디 입니다.");
          console.log("이미 사용중인 아이디 입니다.");
          $("#userId").val("");
          $("#idChkBtn").val(0);
        }
      }

    })
  }

  //아이디 중복검사 후 수정 시 다시 아이디중복검사 실행
  function idDelChk(){
    if( $("#idChkBtn").val()==1){
      $("#idChkBtn").val(0);
    }
  }

  //비밃번호 유효성 검사
  function checkPw(){
    let pw = $("#userPw").val();
    let num = pw.search(/[0-9]/g);
    let eng = pw.search(/[a-z]/ig);
    let spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if(pw.length < 8 || pw.length > 20){
      alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
      return false;
    }else if(pw.search(/\s/) != -1){
      alert("비밀번호는 공백 없이 입력해주세요.");
      return false;
    }else if(num < 0 || eng < 0 || spe < 0 ){
      alert("비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.");
      return false;
    }else {
      console.log("통과");
      return true;
    }

  }


  function mobileChk(){
    /*전화번호 유효성 검사*/
    let mobnum =$("#userMobile").val();
    let num = mobnum.search(/^[0-9]/g);

    let eng = mobnum.search(/[a-z]/ig);

    let spe = mobnum.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);


    if(mobnum.search(/\s/) != -1){
      alert(  "전화번호는 공백 없이 입력해주세요.");
      $("#userMobile").val("");
      return false;
    }else if(eng >= 0 || spe >=0 ){
      alert("전화번호는 숫자만 입력해 주세요.");
      $("#userMobile").val("");
      return false;
    }else if(num<0 ){
      alert("전화번호는 숫자만 입력해 주세요.");
      $("#userMobile").val("");
      return false;
    }else{
      return true;
    }
  }

</script>
</html>
