<%@ page import="com.whizlab_shop.vo.SmallCategoryVo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.whizlab_shop.vo.BigCategoryVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/plugins/jquery-smart-wizard/src/css/smart_wizard.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/parsley/src/parsley.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote.css" rel="stylesheet" />

<body>
<!-- begin #page-container -->
<%--<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">--%>

    <!-- begin #content -->
<div id="content" class="content">
    <jsp:include page="../common/sidemenu.jsp"></jsp:include>
<form action="/insertProduct" method="post" enctype="multipart/form-data" class="form-horizontal form-bordered" id="insertForm">
    <!-- begin row -->
        <div class="row">
            <!-- begin col-5 -->
            <div class="col-lg-5">

    <!-- begin panel -->
    <div class="panel panel-inverse" >
        <!-- begin panel-heading -->
        <div class="panel-heading">
            <h4 class="panel-title">상품기본정보등록</h4>
        </div>
        <!-- end panel-heading -->
        <!-- begin panel-body -->
        <div class="panel-body panel-form">
                <div class="form-group row">
                    <label class="col-md-4 col-form-label">카테고리</label>
                    <div class="col-md-8">
                        <%
                           List<BigCategoryVo> bigCategoryList = (List<BigCategoryVo>)request.getAttribute("bigCategoryList");
                        %>
                    <select class="form-control selectpicker col-md-4" id="bigCategory" name="bigCateSeq" onchange="selectBigCategory()">
                        <option value="" selected>대분류</option>
                        <%  String bigCateName = "";
                            int bigCateSeq = 0;
                            for(int i =0; i<bigCategoryList.size();i++){
                                bigCateSeq = bigCategoryList.get(i).getBigCateSeq();
                                bigCateName = bigCategoryList.get(i).getBigCateName();
                        %>
                        <option value="<%=bigCateSeq%>"><%=bigCateName%></option>

                        <% }%>

                    </select>

                    <select class="form-control selectpicker col-md-4" id="smallCategory" name="smallCateSeq">
                    <option value="" selected>소분류</option>
                    </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-4 col-form-label">상품명</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-4 col-form-label">상품코드</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="prodCode" name="prodCode" placeholder="상품코드" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-4 col-form-label">제조국</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="prodManufacturingCountry" name="prodManufacturingCountry" placeholder="제조국" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-4 col-form-label">제조사</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="prodManufacturingFactory" name="prodManufacturingFactory" placeholder="제조사" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-4 col-form-label">주요성분</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="prodComponent" name="prodComponent" placeholder="주요성분" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-4 col-form-label">배송비</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="deliveryPrice" name="deliveryPrice" placeholder="배송비" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-4 col-form-label">상품간단설명</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="simpleExplain" name="simpleExplain" placeholder="상품간단설명" />
                    </div>
                </div>
        </div>
        <!-- end panel-body -->
    </div>
    <!-- end panel -->

                <!-- begin panel -->
                <div class="panel panel-inverse">
                    <div class="panel-heading">
                        <h4 class="panel-title">썸네일등록</h4>
                    </div>
                    <div class="panel-body text-inverse">
                        <div id="dropzone">
                                <div class="row">

                                    <div class="col-md-2 m-10" style="border: 2px dashed grey; height: 200px; border-radius: 5px; display: flex; text-align: center; justify-content : center; align-items : center;" id="input-file-div1">
                                        <label class="input-file-button" for="input-file1" style="margin: auto; z-index: 2;">
                                            썸네일1 추가
                                            <span class="dz-note needsclick">
										(사진규격은 000*000을 권장합니다.)
									</span>
                                        </label>
                                        <input type="file" id="input-file1" name="files" style="display:none;" onchange="fileAdd(1)"/>
                                    </div>

                                    <div class="col-md-2 m-10" style="border: 2px dashed grey; height: 200px; border-radius: 5px; display: flex; justify-content : center; align-items : center;" id="input-file-div2">
                                        <label class="input-file-button" for="input-file2" style="margin: auto; z-index: 2;">
                                            썸네일2 추가
                                            <span class="dz-note needsclick">
										(사진규격은 000*000을 권장합니다.)
									</span>
                                        </label>
                                        <input type="file" id="input-file2" name="files" style="display:none;" onchange="fileAdd(2)"/>
                                    </div>

                                    <div class="col-md-2 m-10" style="border: 2px dashed grey; height: 200px; border-radius: 5px; display: flex; justify-content : center; align-items : center;" id="input-file-div3">
                                        <label class="input-file-button" for="input-file3" style="margin: auto; z-index: 2;">
                                            썸네일3 추가
                                            <span class="dz-note needsclick">
										(사진규격은 000*000을 권장합니다.)
									</span>
                                        </label>
                                        <input type="file" id="input-file3" name="files" style="display:none;" onchange="fileAdd(3)"/>
                                    </div>

                                    <div class="col-md-2 m-10" style="border: 2px dashed grey; height: 200px; border-radius: 5px; display: flex; justify-content : center; align-items : center;" id="input-file-div4">
                                        <label class="input-file-button" for="input-file4" style="margin: auto; z-index: 2;">
                                            썸네일4 추가
                                            <span class="dz-note needsclick">
										(사진규격은 000*000을 권장합니다.)
									</span>
                                        </label>
                                        <input type="file" id="input-file4" name="files" style="display:none;" onchange="fileAdd(4)"/>
                                    </div>

                                </div>
                        </div>
                    </div>
                </div>
                <!-- end panel -->
            </div>
            <%--end col-5--%>

            <!-- begin col-5 -->
            <div class="col-lg-5">
                <!-- begin col-10 -->
                <div class="col-md-10 ui-sortable">
                    <!-- begin panel -->
                    <div class="panel panel-inverse m-b-0">
                        <div class="panel-heading">
                            <h4 class="panel-title">상품상세</h4>
                        </div>
                        <div class="panel-body p-0" id="prodSummernote">
                                <textarea id="summernote" name="summernote" class="summernote"></textarea>
                        </div>
                    </div>
                    <!-- end panel -->
                </div>
                <!-- end col-10 -->
            </div>
            <%--end col-5--%>
        </div>
        <%--end row--%>
    <button type="submit" class="btn btn-primary btn-lg" onclick="formSubmit()">등록하기</button>
</form>
</div>
<%--</div>--%>
<!-- end page container -->
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

<!-- ================== END PAGE LEVEL JS ================== -->
<script>
    $(document).ready(function() {
        FormWizardValidation.init();
        FormWysihtml5.init();
        FormSummernote.init();

    });

    $('#summernote').summernote({
        height: 800,
        lang: "ko-KR",
        callbacks: {
            onImageUpload: function (files) {
                let data = new FormData();
                data.append("file", files[0]);
                $.ajax({
                    data:data,
                    type:"POST",
                    url:"${pageContext.request.contextPath}/uploadSummernoteImageFile",
                    dataType: "json",
                    contentType: false,
                    processData: false,
                    success:function(data){
                        console.log(data.oriName);
                        console.log(data.newPath);
                        let url = "${pageContext.request.contextPath}/resources/image/" + data.oriName;
                        console.log(url);
                        $('#summernote').summernote("insertImage", url);
                    }
                });
            }
        }
    });


    function fileAdd(number){

        let file = event.target.files[0];

        console.log(file);

        let formData = new FormData();
        formData.append("file", file);

        $.ajax({
            type: 'post',
            data: formData,
            enctype: 'multipart/form-data',
            contentType: false,
            dataType: "json",
            processData: false,
            url: "/thumnailImage",  //이미지 리사이즈, 서버에 올려주는 용도
            success: function(data){

                $("#input-file-div" + number).find("img").remove();

                let img = "<img src='${pageContext.request.contextPath}/resources/image/" + data.fileName + "' style='position:absolute; width:180px; height: 180px; z-index:1; jus'/>";

                console.log(img);

                $("#input-file-div" + number).append(img);

            }

        });

    }

    function selectBigCategory(){
        let bigCateSeq =  $("#bigCategory").val();
        console.log("대분류 선택=====", $("#bigCategory").val());

        if(bigCateSeq!="" || bigCateSeq!=null){

            $.ajax({
                type:'post',
                url :"/selectSmallCategory",
                data:{
                    "bigCateSeq" :  bigCateSeq
                },
                dataType: "JSON",
                success : function (data){
                    console.log("대분류 선택 -> 소분류 가져오기 성공!");
                    $("#smallCategory").empty();
                    let smallCateName = "";
                    let smallCateSeq = 0;
                    let op = "";
                    for(var i =0;i<data.smallCategoryVoList.length;i++){
                        console.log(data.smallCategoryVoList[i].smallCateName);
                        smallCateName = data.smallCategoryVoList[i].smallCateName;
                        smallCateSeq = data.smallCategoryVoList[i].smallCateSeq;
                        op += "<option value='"+ smallCateSeq+"'>" + smallCateName + "</option>";
                    }
                    $("#smallCategory").append(op);

                }
            })
        }

    }

    function formSubmit(){

        if(insertProduct()){
            console.log("유효성검사 완료 !!! form 제출")
            $("#insertForm").submit();
        }
    }


    function insertProduct(){
        /*공백검사*/
        let bigCategory = $("#bigCategory").val();
        emptyChk(bigCategory,"대분류");
        let smallCategory = $("#smallCategory").val();
        emptyChk(smallCategory,"소분류");
        console.log("b : "+ bigCategory + ", s : "+ smallCategory);

        let prodName = $("#prodName").val();
        if(emptyChk(prodName,"상품명")){
            let prodCode = $("#prodCode").val();
            if(emptyChk(prodCode, "상품코드")){
                let prodManufacturingCountry = $("#prodManufacturingCountry").val();
                if(emptyChk(prodManufacturingCountry, "제조국")){
                    let prodManufacturingFactory = $("#prodManufacturingFactory").val();
                    if(emptyChk(prodManufacturingFactory, "제조사")){
                        let prodComponent = $("#prodComponent").val();
                        if(emptyChk(prodComponent, "주요성분")){
                            let deliveryPrice = $("#deliveryPrice").val();
                            if(emptyChk(deliveryPrice, "배송비")){
                                let simpleExplain = $("#simpleExplain").val();
                                if(emptyChk(simpleExplain, "상품 간단설명")){
                                    let summernote = $("#summernote").val();
                                    console.log("summernote : " ,summernote);
                                    if(emptyChk(summernote,"상품상세")){
                                        if(numberChk()){  /*배송비 유효성검사*/
                                            if(thumnailChk()){ /*썸네일 공백검사*/
                                                return true;
                                            }
                                        }
                                    }else{
                                        return false;
                                    };
                                }else{
                                    return false;
                                };
                            }else{
                                return false;
                            };
                        }else{
                            return false;
                        };
                    }else{
                        return false;};
                }else{
                    return false;
                };
            }else{
                return false;};
        }else{
            return false;};

    }

    function emptyChk(data,name){
        if(data==""||data==null) {
            alert(name + " 란이 공백입니다. ");
            event.preventDefault();
            return false;
        }else{
            return true;
        }
    }

    function numberChk(){
        /*배송비 유효성검사*/
        let deliveryPrice =$("#deliveryPrice").val();
        let num = deliveryPrice.search(/^[0-9]/g);

        let eng = deliveryPrice.search(/[a-z]/ig);

        let spe = deliveryPrice.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);


        if(deliveryPrice.search(/\s/) != -1){
            alert(  "배송비는 공백 없이 입력해주세요.");
            $("#deliveryPrice").val("");
            event.preventDefault();
            return false;
        }else if(eng >= 0 || spe >=0 ){
            alert("배송비는 숫자만 입력해 주세요.");
            $("#deliveryPrice").val("");
            event.preventDefault();
            return false;
        }else if(num<0 ){
            alert("배송비는 숫자만 입력해 주세요.");
            event.preventDefault();
            $("#deliveryPrice").val("");
            return false;
        }else{
            return true;
        }
    }

    function thumnailChk(){
        /*썸네일공백검사*/
        for(var i =1; i<5;i++){
            console.log($("#input-file-div" + i).find("img"));
            if($("#input-file-div" + i).find("img").length==0||$("#input-file-div" + i).find("img")==null){
                alert("썸네일은 4장 모두 등록해야 합니다.");
                event.preventDefault();
                break;
                return false;
            }else{
                return true;
            }
        }
    }

</script>

</body>
</html>
