<%@ page import="com.whizlab_shop.vo.UserVo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.whizlab_shop.vo.UserRoleVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/font-awesome/5.3/css/all.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/animate/animate.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/apple/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/apple/style-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/apple/theme/default.css" rel="stylesheet" id="theme" />
<!-- ================== END BASE CSS STYLE ================== -->

<!-- ================== BEGIN PAGE LEVEL CSS STYLE ================== -->
<link href="${pageContext.request.contextPath}/resources/css/plugins/jquery-jvectormap/jquery-jvectormap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/nvd3/build/nv.d3.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
<!-- ================== END PAGE LEVEL CSS STYLE ================== -->

<!-- ================== BEGIN BASE JS ================== -->
<%--  <script src="${pageContext.request.contextPath}/resources/css/plugins/pace/pace.min.js"></script>--%>
<!-- ================== END BASE JS ================== -->

<body>
<%
  UserVo user = (UserVo)session.getAttribute("user");
  String userName = user.getUserName();
  String userId = user.getUserId();
  String userEmail = user.getUserEmail();
  String userMobile = user.getUserMobile();
  String master = user.getMaster();
  List<UserRoleVo> roleList = (List<UserRoleVo>)session.getAttribute("roleList");
%>

  <!-- begin #sidebar -->
  <div id="sidebar" class="sidebar">
    <!-- begin sidebar scrollbar -->
    <div data-scrollbar="true" data-height="100%">
      <!-- begin sidebar user -->
      <ul class="nav">
        <li class="nav-profile">
          <a href="javascript:;" data-toggle="nav-profile">
            <div class="cover with-shadow"></div>
            <div class="image">
              <img src="../assets/img/user/user-13.jpg" alt="" />
            </div>
            <div class="info">
              <small>관리자</small> <%=userName%>
            </div>
          </a>
        </li>
      </ul>
      <!-- end sidebar user -->
      <!-- begin sidebar nav -->
      <ul class="nav">
        <li class="nav-header">Navigation</li>
        <li class="has-sub">
          <a href="/managementPage">
            <b class="caret"></b>
            <span>Dashboard</span>
          </a>
        </li>
        <%int role = 0;
        String showMenu = "";
        String menuName = "";
        int menuOrder = 0;
        int motherMenu=0;
        for(int i =1; i< roleList.size();i++){
        role = roleList.get(i).getRoleSeq();
        showMenu = roleList.get(i).getRoleShow();
        menuName = roleList.get(i).getMenuName();
        menuOrder = roleList.get(i).getMenuOrder();
        motherMenu = roleList.get(i).getMotherMenu();
        if(master.equals("Y")||showMenu.equals("Y")){
        %>

          <%if(menuOrder==0||menuOrder==1){ //하위메뉴가 없거나 상위메뉴일 떄%>

          <li class="has-sub">
          <a href="javascript:;">
            <b class="caret"></b>
            <span><%=menuName%></span>
          </a>

             <%if(menuOrder==1){  //하위메뉴가 있을 때%>
              <ul class="sub-menu">
              <%
              String smallMenu = "";
              for(int j = 0; j < roleList.size();j++){
                if(roleList.get(j).getMotherMenu()==role&&roleList.get(j).getMenuOrder()==2){
              smallMenu = roleList.get(j).getMenuName();
              int smallMenuSeq = roleList.get(j).getRoleSeq();
              %>
                <li><a href="/edit?content=<%=smallMenuSeq%>"><%=smallMenu%></a></li>
              <%}
              }
              %>
              </ul>
           <%}else{  //하위메뉴가 없을 때%>
        </li>
            <%}
            }
            }
            }
            %>



      </ul>
      <!-- end sidebar nav -->
    </div>
    <!-- end sidebar scrollbar -->
  </div>
  <div class="sidebar-bg"></div>
  <!-- end #sidebar -->


<script src="${pageContext.request.contextPath}/resources/css/plugins/pace/pace.min.js"></script>
<!-- ================== BEGIN BASE JS ================== -->
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/resources/css/crossbrowserjs/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/crossbrowserjs/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/resources/css/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/js-cookie/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/theme/apple.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/apps.min.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${pageContext.request.contextPath}/resources/css/plugins/d3/d3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/nvd3/build/nv.d3.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery-jvectormap/jquery-jvectormap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery-jvectormap/jquery-jvectormap-world-merc-en.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/bootstrap-calendar/js/bootstrap_calendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/demo/dashboard-v2.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/css/plugins/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/flot/jquery.flot.time.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/sparkline/jquery.sparkline.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/demo/dashboard.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/css/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/demo/table-manage-default.demo.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/css/plugins/bootstrap-sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/demo/ui-modal-notification.demo.min.js"></script>

<!-- ================== END PAGE LEVEL JS ================== -->

<script>
  $(document).ready(function() {
    COLOR_GREEN = '#5AC8FA';
    App.init();
    DashboardV2.init();
  });


  let lang_kor = {
    "decimal" : "",
    "emptyTable" : "데이터가 없습니다.",
    "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
    "infoEmpty" : "0명",
    "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "_MENU_ 개씩 보기",
    "loadingRecords" : "로딩중...",
    "processing" : "처리중...",
    "search" : "검색 : ",
    "zeroRecords" : "검색된 데이터가 없습니다.",
    "paginate" : {
      "first" : "첫 페이지",
      "last" : "마지막 페이지",
      "next" : "다음",
      "previous" : "이전"
    },
    "aria" : {
      "sortAscending" : " :  오름차순 정렬",
      "sortDescending" : " :  내림차순 정렬"
    }
  };

  $("#data-table-default").DataTable({
    language : lang_kor,
    info : false,
    order: [[0, 'desc']],
    ordering: true,
    destroy: true
  });
</script>
</body>

