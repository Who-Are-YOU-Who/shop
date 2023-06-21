<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Join us!</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
</head>

<link href="${pageContext.request.contextPath}/resources/css/default/style.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/default/style-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/default/theme/default.css" rel="stylesheet" id="theme" />


<body class="pace-top bg-white">
<jsp:include page="../common/header.jsp"></jsp:include>
<%if( session.getAttribute("msg")!=null){
    String message = (String)session.getAttribute("msg");
    if(!message.equals("")||message!=null){%>

<script>
    alert(<%=message%>);
</script>

<%}
}
    session.removeAttribute("msg");

%>
<!-- begin #page-container -->
<div id="page-container" >
    <!-- begin register -->
    <div class="register register-with-news-feed">
        <!-- begin news-feed -->
        <div class="news-feed">
            <div class="news-image" style="background-image: url(image/greenLeaves.jpg)"></div>

        </div>
        <!-- end news-feed -->
        <!-- begin right-content -->
        <div class="right-content" style="background-color: #d0e9c6;">
            <!-- begin register-header -->
            <h1 class="register-header" style="margin-top: 5%;">
                Sign Up
                <small>Create your Account. It’s free and always will be.</small>
            </h1>
            <!-- end register-header -->
            <!-- begin register-content -->
            <div class="register-content" style="margin-top: 7%;">
                <form action="/register" method="POST" class="margin-bottom-0">
                    <label class="control-label">Name <span class="text-danger">*</span></label>
                    <div class="row m-b-15">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="이름" id="customerName" name="customerName" required />
                        </div>
                    </div>
                    <label class="control-label">ID <span class="text-danger">*</span></label>
                    <div class="row m-b-15">
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="아이디"  id="customerId" name="customerId" onkeydown="idDelChk()" required />
                        </div>
                        <div class="col-md-3" id="idChkDiv">
                            <button class="btn btn-green btn-block btn-lg" type="button" id="idChkBtn" onclick="checkIdDupicate()" value="0">아이디 중복검사</button>
                        </div>
                    </div>
                    <label class="control-label">Password (영문,숫자,특수문자 포함 8~20자)<span class="text-danger">*</span></label>
                    <div class="row m-b-15">
                        <div class="col-md-12">
                            <input type="password" class="form-control" placeholder="비밀번호" id="customerPw" name="customerPw" required />
                        </div>
                    </div>
                    <label class="control-label">비밀번호 확인<span class="text-danger">*</span></label>
                    <div class="row m-b-15">
                        <div class="col-md-12">
                            <input type="password" class="form-control" placeholder="비밀번호" id="pwchk" name="pwchk" onkeyup="customerPwchk()" required  style="color: red;"/>
                        </div>
                    </div>
                    <label class="control-label">Email <span class="text-danger">*</span></label>
                    <div class="row m-b-15">
                        <input type="hidden" id="customerEmail" name="customerEmail">
                        <div class="col-md-6">
                            <input type="text" class="form-control" placeholder="이메일 주소" id="email" name="email" required />
                        </div>
                        <div class="col-md-6">
                            <div class="col-10">
                            <select class="form-control" placeholder="년도" id="eAddress" name="eAddress" required onchange="emailChk(this.value)">
                                <option>@gmail.com</option>
                                <option>@naver.com</option>
                                <option>@daum.net</option>
                                <option value="self">직접입력</option>
                            </select>
                            </div>

                            <div class="col-md-10" id="selfAddressDiv">

                            </div>
                        </div>
                    </div>
                    <label class="control-label">Mobile(11자리 , "-"없이 숫자만 입력) <span class="text-danger">*</span></label>
                    <div class="row m-b-15">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="핸드폰 번호" id="customerMobile" name="customerMobile" onkeyup="mobileChk(this.value)" required />
                        </div>
                    </div>
                    <label class="control-label">기본주소<span class="text-danger">*</span></label>
                    <div class="row m-b-15">
                        <div class="col-md-8">
                            <input type="text" class="form-control" placeholder="주소" id="customerAddress1" name="customerAddress1" readonly/>
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-green btn-block btn-lg" type="button" id="addSearch" onclick="addressSearch()" value="0">주소검색</button>
                        </div>
                    </div>
                    <div class="row m-b-15">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="상세주소" id="customerAddress2" name="customerAddress2" required/>
                            <input type="hidden" id="address" name="address">
                        </div>
                    </div>
                    <label class="control-label">Birthday <span class="text-danger">*</span></label>
                    <div class="row m-b-15">
                        <input type="hidden" id="customerBday" name="customerBday">
                        <div class="col-md-4">
                            <select class="form-control"  placeholder="년도" id="bday1" name="bday1" required>
                                <% for(int i = 2023; i>1900; i--){%>
                                <option><%=i%></option>
                                  <% }%>
                            </select>
                        </div>
                        <div class="col-md-4" >
                            <select class="form-control"  placeholder="월" id="bday2" name="bday2" required>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control"  placeholder="월" id="bday3" name="bday3" required>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>
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
                        <button type="submit" class="btn btn-green btn-block btn-lg">Sign Up</button>
                    </div>
                    <div class="m-t-20 m-b-40 p-b-40 text-inverse" >
                        Already a member? Click <a href="/login">here</a> to login.<br/>
                        Register for Admin? Click <a href="/userRegisterpage">here</a> to register.
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

    function customerPwchk(){
        var pw = $("#customerPw").val();
        var chk = $("#pwchk").val();
        if(pw==chk){
            console.log("비밀번호 일치");
            $("#pwchk").css('color','blue');
        }else{
            console.log("비밀번호 불일치");
            $("#pwchk").css('color','red');
        }
    }

    function addressSearch(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
               // alert(data.address);
                $("#customerAddress1").val(data.address);
            }
        }).open();
    }

    $("form").submit(function (){

        //주소저장
        let cusAddress = $("#customerAddress1").val()+$("#customerAddress2").val();
        $("#address").val(cusAddress);

        //아이디 중복체크 여부
        if($("#idChkBtn").val()==0){
           alert("아이디 중복검사를 해주세요.");
            event.preventDefault();
        }

        //생일 문자열 저장
        let year = $("#bday1").val();
        let month = $("#bday2").val();
        let day = $("#bday3").val();
        $("#customerBday").val(year+"-"+month+"-"+day);

        //이메일 문자열 저장
        let email = $("#email").val();
        let address = $("#eAddress").val();
        $("#customerEmail").val(email+address);

        //전화번호 길이
        let mobilelength = $("#customerMobile").val().length;
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
        let id = $("#customerId").val();
        $.ajax({
            type : 'post',
            url : "/checkIdDupicate",
            data : {
                customerId : id
            },
            dataType : "text",
            success : function (data){
                console.log(data);
                if(data == 0){
                    alert("사용가능한 아이디 입니다.");
                    console.log("사용가능한 아이디 입니다.");
                    $("#idChkDiv").empty();
                    var idChk = "<button class='btn btn-green btn-block btn-lg' type='button' id='idChkBtn' value='1' disabled='disabled '>중복검사 완료</button>";
                    $("#idChkDiv").append(idChk);
                }else if(data == 1){
                    alert("이미 사용중인 아이디 입니다.");
                    console.log("이미 사용중인 아이디 입니다.");
                    $("#customerId").val("");
                    $("#idChkBtn").val(0);
                }
            }

        })
    }

    //아이디 중복검사 후 수정 시 다시 아이디중복검사 실행
    function idDelChk(){
        if( $("#idChkBtn").val()==1){
            $("#idChkDiv").empty();
            var idChk = "<button class='btn btn-green btn-block btn-lg' type='button' id='idChkBtn' onclick='checkIdDupicate()' value='0'>아이디 중복검사</button>";
            $("#idChkDiv").append(idChk);
        }
    }

    //비밃번호 유효성 검사
    function checkPw(){
        let pw = $("#customerPw").val();
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


    function mobileChk(mobnum){
        /*전화번호 유효성 검사*/
        console.log("전화번호 유효성 검사 시작======");
        let num = mobnum.search(/^[0-9]/g);

        let eng = mobnum.search(/[a-z]/ig);

        let spe = mobnum.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);


        if(mobnum.search(/\s/) != -1){
            alert(  "전화번호는 공백 없이 입력해주세요.");
            $("#customerMobile").val("");
            return false;
        }else if(eng >= 0 || spe >=0 ){
            alert("전화번호는 숫자만 입력해 주세요.");
            $("#customerMobile").val("");
            return false;
        }else if(num<0 ){
            alert("전화번호는 숫자만 입력해 주세요.");
            $("#customerMobile").val("");
            return false;
        }else{
            return true;
        }
    }

    function emailChk(address){
        if(address=="self"){
            var selfInput= "<input type='text' class='form-control ' placeholder='직접입력' id='selfInput' name='selfInput' required/> ";
            selfInput += "<button class='btn btn-green btn-block btn-sm ' type='button' id='selfInputBtn' onclick='addressSelfTyping()'>입력완료</button> ";
            $("#selfAddressDiv").append(selfInput);
        }
    }
    function addressSelfTyping(){
        var selfAddress = $("#selfInput").val();
        var op ="<option selected>"+selfAddress+"</option>"
        $("#eAddress").append(op);

    }


</script>

</body>
</html>
