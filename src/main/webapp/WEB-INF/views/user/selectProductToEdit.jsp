<%@ page import="com.whizlab_shop.vo.BigCategoryVo" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<%if(session.getAttribute("msg")!=null||!session.getAttribute("msg").equals("")){
    String msg = (String)session.getAttribute("msg");
%>
<script>
    alert(msg);
</script>
<%}%>--%>
<!-- begin #content -->
<div id="content" class="content">
    <jsp:include page="../common/sidemenu.jsp"></jsp:include>
    <!-- begin page-header -->
    <h1 class="page-header">상품 수정</h1>
    <!-- end page-header -->

    <!-- begin product search-->
    <h4>수정할 상품검색</h4>
    <!-- begin panel -->
    <div class="panel panel-inverse" data-sortable-id="form-plugins-3" style="width: 40%;">
        <!-- begin panel-heading -->
        <div class="panel-heading">
            <h4 class="panel-title">상품검색</h4>
        </div>
        <!-- end panel-heading -->
        <!-- begin panel-body -->
        <div class="panel-body panel-form">
            <form class="form-horizontal form-bordered" id="searchForm" method="post">
                <div class="form-group row">
                    <label class="col-md-2 col-form-label">대분류</label>
                    <div class="col-md-10">
                    <div class="row row-space-10">
                        <div class="row col-md-5">
                            <%
                                List<BigCategoryVo> bigCategoryList = (List<BigCategoryVo>)request.getAttribute("bigCategoryList");
                            %>
                            <select class=" form-control" id="bigCateSearch" name="bigCateSeq" onchange="selectBigCategory()">
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
                        </div>
                        <div class="row col-md-5">
                        <select class="form-control" id="smallCateSearch" name="smallCateSeq">
                            <option>소분류</option>
                        </select>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 col-form-label">등록기간</label>
                    <div class="col-md-10">
                        <div class="row row-space-10">
                            <div class="col-xs-6">
                                <input type="text" class="form-control"  id="minDate" name="minDate" placeholder="Min Date" />
                            </div>
                            ~
                            <div class="col-xs-6">
                                <input type="text" class="form-control" id="maxDate" name="maxDate" placeholder="Max Date" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 col-form-label">상품코드</label>
                      <div class="col-md-10">
                          <div class="row row-space-10">
                          <input type="text" name="prodCode" id="searchCode" class="form-control col-md-4"  onkeyup="searchProdCode()" placeholder="상품코드" />
                          <select class=" form-control col-md-4" id="prodCodeSelect">
                              <option>상품코드 선택</option>
                          </select>
                          </div>
                      </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 col-form-label">판매상태</label>
                    <div class="col-md-10">
                        <div class="row col-md-10">
                            <select class="form-control col-md-4" id="prodDelSelect" name="prodDel" >
                                <option value="N">판매중</option>
                                <option value="Y">품절</option>
                            </select>
                            <button type="button" class="btn btn-primary col-md-3" onclick="searchProduct()">상품검색</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- end panel-body -->
    </div>
    <!-- end panel -->
    <!-- end product search-->

    <!-- begin panel -->
    <div class="panel panel-inverse">
        <!-- begin panel-heading -->
        <div class="panel-heading">
            <h4 class="panel-title">상품 목록</h4>
        </div>
        <!-- end panel-heading -->
        <!-- begin panel-body -->
        <div class="panel-body">
            <table id="data-table-default" class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th width="1%"></th>
                    <th class="text-nowrap" data-orderable="false">상품이미지</th>
                    <th class="text-nowrap" data-orderable="false">상품명</th>
                    <th class="text-nowrap" data-orderable="false">상품코드</th>
                    <th class="text-nowrap" data-orderable="false">재고</th>
                    <th class="text-nowrap" data-orderable="false" >판매상태</th>
                    <th class="text-nowrap" data-orderable="false" >등록일</th>
                </tr>
                </thead>
                <tbody id="tableBody">
                <%

                %>
                <input type="hidden" id="rolCount" value="">
                <tr class="odd gradeX">
                    <td width="4%" class="f-s-600 text-inverse" id="userEdit"> <button style="text-align: right;" type="button" class="btn btn-grey" onclick="selectProdToEdit()">상품수정</button></td>
                    <td id="name"></td>
                    <td id="id<"></td>
                    <td id="mobile"></td>
                    <td id="email"></td>
                    <td id="cusDel"></td>
                    <td></td>
                </tr>



                </tbody>
            </table>
            <input type="hidden" id="edtitor" value="">
        </div>
        <!-- end panel-body -->
    </div>
    <!-- end panel -->


</div>
<!--end content-->
<script src="${pageContext.request.contextPath}/resources/css/js/demo/form-plugins.demo.min.js"></script>
<script>
    $(document).ready(function() {
        FormPlugins.init();
    });

    /*대분류 선택*/
    function selectBigCategory(){
        let bigCateSeq =  $("#bigCateSearch").val();
        console.log("대분류 선택=====", $("#bigCateSearch").val());

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
                    $("#smallCateSearch").empty();
                    let smallCateName = "";
                    let smallCateSeq = 0;
                    let op = "";
                    for(var i =0;i<data.smallCategoryVoList.length;i++){
                        console.log(data.smallCategoryVoList[i].smallCateName);
                        smallCateName = data.smallCategoryVoList[i].smallCateName;
                        smallCateSeq = data.smallCategoryVoList[i].smallCateSeq;
                        op += "<option value='"+ smallCateSeq+"'>" + smallCateName + "</option>";
                    }
                    $("#smallCateSearch").append(op);

                }
            })
        }

    }

    /*상품코드 입력시 유사한 상품코드 리스트 가져오기*/
    function searchProdCode(){
        let prodcode = $("#searchCode").val();
        setTimeout( find(prodcode),0); /*이거없으면 엄청많이 돌아서 Maxmum call stack size exceeded 에러발생*/


        function find(prodcode){
            $.ajax({
                type : "post",
                url : "/searchProdByProdCode",
                data : {
                    "prodCode" : prodcode
                },
                dataType : "JSON",
                success : function (data){
                    console.log("상품코드 목록 가져오기 성공=====");
                    $("#prodCodeSelect").empty();
                    let prodCode = "";
                    let prodSeq = 0;
                    let op = "";
                    for(var i =0;i<data.plist.length;i++){
                        console.log(data.plist[i].prodCode);
                        console.log(data.plist[i].prodSeq);
                        prodCode = data.plist[i].prodCode;
                        prodSeq = data.plist[i].prodSeq;
                        op += "<option value='"+ prodSeq+"' onclick='selectProdCode()'>" + prodCode + "</option>";
                    }

                    $("#prodCodeSelect").append(op);
                }
            });
        }


    }

    /*선택한 코드 input에 넣어주기*/
    function selectProdCode(){
        console.log("상품코드 선택=======");
        let text =  $("#prodCodeSelect").val();
        console.log(text);
        $("#searchCode").val(text);
    }

    /*sorting할 항목들로 상품 검색하기*/
    function searchProduct(){

        var queryString = $("#searchForm").serialize();

        $.ajax({
            type : 'post',
            url : '/searchProdFromEditProduct',
            data : queryString,
            dataType : 'JSON',
            success : function (data){
                console.log(data);
                $("#tableBody").empty();
                let tr = "";
                let del = "";
                for( var i=0; i<data.plist.length;i++){
                    tr += "<tr>" +
                        "<td width='4%' class='f-s-600 text-inverse'> <a style='text-align: right;' type='button' class='btn btn-grey' href='/editProduct?prodSeq="+data.plist[i].prodSeq+"'>수정</a></td>"
                        +"<td id='prodImgPath"+data.plist[i].prodSeq+"'>"+"<img src='image/product/"+data.plist[i].prodImgPath+"' style='width: 70px; height: 70px;'></td>"
                        +"<td id='prodName"+data.plist[i].prodSeq+"'>"+data.plist[i].prodName+"</td>"
                        +"<td id='prodCode"+data.plist[i].prodSeq+"'>"+data.plist[i].prodCode+"</td>"
                        +"<td id='prodStock"+data.plist[i].prodSeq+"'>"+data.plist[i].prodStock+"</td>"
                        +"<td id='prodDel"+data.plist[i].prodSeq+"'>"
                        if(data.plist[i].prodDel=="Y"){
                            tr +="판매중지"
                        }else if(data.plist[i].prodDel=="N"){
                            tr +="판매중"
                        }
                    tr +="</td>"
                        +"<td id='regiDate"+data.plist[i].prodSeq+"'>"+data.plist[i].regiDate+"</td>"
                        +"</tr>";
                }
                console.log(tr);
                $("#tableBody").append(tr);
            },
            error : function (error){
                console.log(error);
            }
        })
    }
</script>
</body>
</html>
