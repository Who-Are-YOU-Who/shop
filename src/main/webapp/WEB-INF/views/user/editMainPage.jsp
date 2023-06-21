
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/plugins/jquery-smart-wizard/src/css/smart_wizard.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/parsley/src/parsley.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote.css" rel="stylesheet" />
<body>
<!-- begin #content -->
<div id="content" class="content">
  <jsp:include page="../common/sidemenu.jsp"></jsp:include>

  <div>
    <h1>메인화면 배너 등록</h1>
  </div>
    <!-- begin row -->
    <div class="row">
      <!-- begin col-4 -->
      <div class="col-lg-6">
          <!-- begin panel1 -->
          <div class="panel panel-inverse" data-sortable-id="form-slider-switcher-1">
          <!-- begin panel-heading -->
          <div class="panel-heading">
            <h4 class="panel-title">배너1 등록하기</h4>
          </div>
          <!-- end panel-heading -->
          <!-- begin panel-body -->
          <div class="panel-body">
            <div class="m-b-2 text-inverse f-w-600 f-s-16">
              <label for="main1ProdName">상품명</label>
              <input id="main1ProdName" name="main1ProdName" placeholder="상품명을 입력해 주세요.">
              <button class="btn btn-primary btn-md" onclick="openModal(1)">등록하기</button>
            </div>
          </div>
          <!-- end panel-body -->
        </div>
        <!-- end panel1 -->
      </div>

      <div class="col-lg-6">
        <!-- begin panel1 -->
        <div class="panel panel-inverse" data-sortable-id="form-slider-switcher-1">
          <!-- begin panel-heading -->
          <div class="panel-heading">
            <h4 class="panel-title">배너2 등록하기</h4>
          </div>
          <!-- end panel-heading -->
          <!-- begin panel-body -->
          <div class="panel-body">
            <div class="m-b-2 text-inverse f-w-600 f-s-16">
              <label for="main2ProdName">상품명</label>
              <input id="main2ProdName" name="main2ProdName" placeholder="상품명을 입력해 주세요.">
              <button class="btn btn-primary btn-md" onclick="openModal(2)">등록하기</button>
            </div>
          </div>
          <!-- end panel-body -->
        </div>
        <!-- end panel1 -->
      </div>
<%--end content--%>
    </div>


  <div>
    <h1>메인화면 할인 등록</h1>
  </div>
  <div class="row">
    <div class="col-lg-4">
      <!-- begin panel2 -->
      <div class="panel panel-inverse" data-sortable-id="form-slider-switcher-1">
        <!-- begin panel-heading -->
        <div class="panel-heading">
          <h4 class="panel-title">할인1 등록하기</h4>
        </div>
        <!-- end panel-heading -->
        <!-- begin panel-body -->
        <div class="panel-body">
          <label for="main3ProdName">상품명</label>
          <input id="main3ProdName" name="main3ProdName" placeholder="상품명을 입력해 주세요.">
          <button class="btn btn-primary btn-sm" onclick="openModal(3)">등록하기</button>
        </div>
        <!-- end panel-body -->
      </div>
      <!-- end panel2 -->
    </div>

    <div class="col-lg-4">
      <!-- begin panel2 -->
      <div class="panel panel-inverse" data-sortable-id="form-slider-switcher-1">
        <!-- begin panel-heading -->
        <div class="panel-heading">
          <h4 class="panel-title">할인2 등록하기</h4>
        </div>
        <!-- end panel-heading -->
        <!-- begin panel-body -->
        <div class="panel-body">
          <label for="main4ProdName">상품명</label>
          <input id="main4ProdName" name="main4ProdName" placeholder="상품명을 입력해 주세요.">
          <button class="btn btn-primary btn-sm" onclick="openModal(4)">등록하기</button>
        </div>
        <!-- end panel-body -->
      </div>
      <!-- end panel2 -->
    </div>

    <div class="col-lg-4">
      <!-- begin panel2 -->
      <div class="panel panel-inverse" data-sortable-id="form-slider-switcher-1">
        <!-- begin panel-heading -->
        <div class="panel-heading">
          <h4 class="panel-title">할인3 등록하기</h4>
        </div>
        <!-- end panel-heading -->
        <!-- begin panel-body -->
        <div class="panel-body">
          <label for="main5ProdName">상품명</label>
          <input id="main5ProdName" name="main5ProdName" placeholder="상품명을 입력해 주세요.">
          <button class="btn btn-primary btn-sm" onclick="openModal(5)">등록하기</button>
        </div>
        <!-- end panel-body -->
      </div>
      <!-- end panel2 -->
    </div>
  </div>

  <%--모달 begin--%>
  <div class="modal modal-message fade" id="prodModal">
    <form action="/selectOneimg" method="post" id="modalForm">
      <div class="modal-dialog">
        <div class="modal-content" >
          <div class="modal-header">
            <h4 class="modal-title">재고/단가 수정</h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          </div>
          <div class="modal-body">
            <table class="table"  style="text-align: center; margin: auto;">
              <input type="hidden" id="prodStkPrcSeqInModal" name="prodStkPrcSeq">
              <input type="hidden" id="prodSeqInModal" name="prodSeq">
              <thead>노출시킬 사진을 선택해 주세요.</thead>
              <tr id="imgtr">

              </tr>
            </table>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary" >수정하기</button>
          </div>
        </div>
      </div>
    </form>
  </div>
  <%--모달 end--%>


</div>

</body>

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${pageContext.request.contextPath}/resources/css/plugins/parsley/dist/parsley.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery-smart-wizard/src/js/jquery.smartWizard.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/demo/form-wizards-validation.demo.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/css/plugins/dropzone/min/dropzone.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/highlight/highlight.common.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/demo/render.highlight.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/bootstrap-wysihtml5/dist/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/demo/form-wysiwyg.demo.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/apps.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/masked-input/masked-input.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/js/demo/form-summernote.demo.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/plugins/select2/dist/js/select2.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script>
  $(document).ready(function() {
    FormWizardValidation.init();
    FormWysihtml5.init();
    FormSummernote.init();

  });

  /*모달 열기*/
  function openModal(num){
    var prodName = $("#main"+num+"ProdName").val();

    /*상품명으로 사진 가져오기*/
    $.ajax({
      type : "post",
      url :"/SelectImagesByProdName",
      data : {
        "prodName" : prodName
      },
      dataType : "JSON",
      success : function (data){
        var tdData = "";
      console.log(data);
      for(var i =0; i< data.imgList.length;i++){
          tdData = "<td><a href='javascript:selectImg("+data.imgList[i].prodseq,data.imgList[i].imgPath+")'> <img src='image/product/"+data.imgList[i].imgPath+"'></a></td>"
        }
        $("#imgtr").append(tdData);
      },
      error : function (error){
        console.log(error);
    }
    })

    $("#prodModal").modal("show");
  }

  function selectImg(prodSeq,imgPath){
    $.ajax({
      type : 'post',
      url :'',
      data :{
        "prodseq" : prodSeq
      },
      dataType: "JSON",
      success : function (data){
        console.log(data);

      },
      error : function (error){
        console.log(error);
      }
    })
  }
</script>
</html>
