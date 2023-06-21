<%@ page import="com.whizlab_shop.vo.CustomerVo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.whizlab_shop.vo.UserVo" %>
<%@ page import="com.whizlab_shop.vo.UserRoleVo" %>
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
  <!-- begin page-header -->
  <h1 class="page-header">관리자 관리</h1>
  <!-- end page-header -->
  <!-- begin panel -->
  <div class="panel panel-inverse">
    <!-- begin panel-heading -->
    <div class="panel-heading">
      <div class="panel-heading-btn">
        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
      </div>
      <h4 class="panel-title">관리자 목록</h4>
    </div>
    <!-- end panel-heading -->
    <!-- begin panel-body -->
    <div class="panel-body">
      <table id="data-table-default" class="table table-striped table-bordered">
        <thead>
        <tr>
          <th width="1%"></th>
          <th class="text-nowrap" data-orderable="false">이름</th>
          <th class="text-nowrap" data-orderable="false">아이디</th>
          <th class="text-nowrap" data-orderable="false">연락처</th>
          <th class="text-nowrap" data-orderable="false">이메일</th>
          <th class="text-nowrap" data-orderable="false" >활동상태</th>
          <th class="text-nowrap" data-orderable="false" >권한상태</th>
        </tr>
        </thead>
        <tbody>
        <%
          UserVo user = (UserVo)session.getAttribute("user");
          String edtitor = user.getUserId();
          List<UserVo> userList = (List<UserVo>)request.getAttribute("userList");
          int userSeq = 0;
          String userName= "";
          String userId="";
          String userMobile="";
          String userEmail="";
          String userDel="";
          String master = "";
          for (int i=0; i<userList.size();i++){
            userSeq=userList.get(i).getUserSeq();
            userName =userList.get(i).getUserName();
            userId =userList.get(i).getUserId();
            userMobile=userList.get(i).getUserMobile();
            userEmail=userList.get(i).getUserEmail();
            userDel=userList.get(i).getUserDel();
            master = userList.get(i).getMaster();
        %>
        <input type="hidden" id="rolCount" value="<%=userList.get(i).getUserRoleList().size()+1%>">
        <tr class="odd gradeX">
          <td width="4%" class="f-s-600 text-inverse" id="userEdit<%=userSeq%>"> <button style="text-align: right;" type="button" class="btn btn-grey" onclick="selectUserToEdit(<%=userSeq%>)">권한수정</button></td>
          <td id="name<%=userSeq%>"><%=userName%></td>
          <td id="id<%=userSeq%>"><%=userId%></td>
          <td id="mobile<%=userSeq%>"><%=userMobile%></td>
          <td id="email<%=userSeq%>"><%=userEmail%></td>
          <td id="cusDel<%=userSeq%>">
            <% if(userDel=="Y"){%>
            <%="활동중지"%>
            <%}else{%>
            <%="활동중"%>
            <%}%></td>
          <td>
            <%String roleList =  "";
              int userRole=0;
              String rShow="";
              for(int j=0; j<userList.get(i).getUserRoleList().size();j++ ){
                rShow =userList.get(i).getUserRoleList().get(j).getRoleShow();
                userRole=userList.get(i).getUserRoleList().get(j).getRoleSeq();
            %>
            <input type="hidden" id="<%=userSeq%>userRoleSeq<%=userRole%>" name="userRoleSeq<%=userRole%>" value="<%=rShow%>">
                <%if(userList.get(i).getUserRoleList().get(j).getRoleShow().equals("Y")){%>

            <%=userList.get(i).getUserRoleList().get(j).getMenuName() %>
                <%}%>
             <% } %>
          </td>
        </tr>

        <%}%>

        </tbody>
      </table>
      <input type="hidden" id="edtitor" value="<%=edtitor%>">
    </div>
    <!-- end panel-body -->
  </div>
  <!-- end panel -->

  <%--모달 begin--%>
  <div class="modal modal-message fade" id="modal-message">
    <form action="/editUser" method="post" modelAttribute="list">
      <input type="hidden" id="userSeq">
    <div class="modal-dialog">
      <div class="modal-content" >
        <div class="modal-header">
          <h4 class="modal-title">관리자 권한 관리</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div>
        <div class="modal-body">
          <table class="table"  style="text-align: center; margin: auto;">

           <%
            List<UserRoleVo> roleList = (List<UserRoleVo>) request.getAttribute("roleList");
            String menuName="";
            int roleSeq = 0;
            for(int i=0; i<roleList.size();i++){
           roleSeq = roleList.get(i).getRoleSeq();
           menuName = roleList.get(i).getMenuName();
           %>

            <tr>
              <td><%=menuName%></td>
              <td><input id="role<%=roleSeq%>chk" name="role<%=roleSeq%>chk" type="checkbox" onclick="selectRole(<%=roleSeq%>)"></td>
              <input type="hidden" name="userSeq" value="<%=roleSeq%>">
              <input type="hidden" name="roleSeq" value="<%=roleSeq%>">
              <input type="hidden" id="<%=roleSeq%>roleShow" name="roleShow" value="">
            </tr>

            <%}%>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="saveChanges()">수정하기</button>
        </div>
      </div>
    </div>
    </form>
  </div>

</div>
<!-- end #content -->

<script>


  function selectUserToEdit(userSeq){
    console.log("모달열기===========");
    var rolCount = $("#rolCount").val();
    $("#userSeq").val(userSeq);
    /*userRole과 rolechk을 비교한다.
    * $("#유저시퀀스userRole롤시퀀스의 val")이 Y일 때  $("#role롤시퀀스chk")이 체크*/
    for(var i =1; i<rolCount;i++){
      if($("#"+userSeq+"userRoleSeq"+i).val()=="Y"){
        $("#role"+i+"chk").prop("checked", true);
        $("#"+i+"roleShow").val("Y");
        console.log("권한시퀀스 : "+i+"번  상태 : "+$("#"+i+"roleShow").val());
      }else{
        $("#role"+i+"chk").prop("checked", false);
        $("#"+i+"roleShow").val("N");
        console.log("권한시퀀스 : "+i+"번  상태 : "+$("#"+i+"roleShow").val());
      }
    }

    $("#modal-message").modal("show");
  }

  /*체크박스 선택시*/
  function selectRole(roleSeq){

    if( $("#role"+roleSeq+"chk").is(":checked")){
      $("#"+roleSeq+"roleShow").val("Y");
    }else{
      $("#"+roleSeq+"roleShow").val("N");
    };

  }

  function saveChanges(){
    let list = [];

    let userSeq = $("#userSeq").val();
    let rolCount = $("#rolCount").val();

    for(var i = 1; i<Number(rolCount);i++){
      let jsonData = {};
      jsonData['userSeq'] = userSeq;
      jsonData['roleSeq'] = i;
      jsonData['roleShow'] =  $("#"+i+"roleShow").val();
      console.log(userSeq,i,$("#"+i+"roleShow").val());
      list.push(jsonData);
    }
    console.log(list);
    $.ajax({
      type : 'post',
      url : '/editUser',
      data :JSON.stringify(list),
      dataType : "JSON",
      contentType :   "application/json",
      success : function (data){
        console.log(data.url)
        location.href=data.url;
      }

    })

  }

</script>
</body>
</html>