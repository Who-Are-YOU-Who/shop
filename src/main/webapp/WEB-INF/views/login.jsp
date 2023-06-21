<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WhizLab</title>
<style type="text/css">
	#login img{
	  margin: 10px 0;
	}
	
	#login .center {
	  text-align: center;
	}
	
	#login .login {
	  max-width: 300px;
		margin: 35px auto;
	}
	
	#login .login-form{
	  padding:0px 25px;
	}
</style>
<link href="${pageContext.request.contextPath}/resources/css/all.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/sweetalert/sweetalert.min.js"></script>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jQuery/jquery-3.3.1.min.js"></script>
</head>
<body>
<c:if test="${msg != null}">
  <script>
    swal("잘못된 로그인","${msg}","warning");
  </script>
</c:if>
<div id="login" class="container">
  <div class="row-fluid">
    <div class="span12">
      <div class="login well well-small">
        <div class="center">
          <img src="${pageContext.request.contextPath}/image/whizlab_BK.png" alt="logo">
        </div>
<%--        <form action="${pageContext.request.contextPath}/loginCheck" class="login-form" id="UserLoginForm" method="POST">--%>
          <div class="control-group">
            <div class="input-prepend">
              <span class="add-on"><i class="icon-user"></i></span>
              <input type="text" id="userID" name="userID" placeholder="아이디를 입력해주세요" required value="10020002">
            </div>
          </div>
          <div class="control-group">
            <div class="input-prepend">
              <span class="add-on"><i class="icon-lock"></i></span>
              <input type="password" id="userPW" name="userPW" placeholder="비밀번호를 입력해주세요" required value="10020002">
            </div>
          </div>
          <div class="control-group">
              <input id="checkLogin" class="btn btn-primary btn-large btn-block" type="submit" value="로그인">
          </div>
<%--        </form>--%>
      </div><!--/.login-->
    </div><!--/.span12-->
  </div><!--/.row-fluid-->
</div><!--/.container-->
</body>
</html>
<script>
  $(function (){
    $("#checkLogin").click(function (){

        let userID = $("#userID").val();

        let userPW = $("#userPW").val();

        console.log(userID);

        $.ajax({
          type:"POST",
          url:"/checkLogin",
            async: true,
            data: {userID:userID, userPW:userPW},
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
        }).done(function (data){
            console.log(data);
            if(data === 's'){
                location.href = "/home";
            } else {
                alert("아이디와 패스워드를 확인해 주세요.");
                return;
            }
        })
    })
  })

</script>