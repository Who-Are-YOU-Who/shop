<%@ page import="com.whizlab_shop.vo.ProductStkPrcVo" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<%
    String msg = (String)session.getAttribute("msg");

    if(msg==null||msg.equals("")) {
        System.out.println("doesn't exist message");
    }else{

%>
<script>
    alert(msg);
</script>
<%}%>--%>
<!-- begin #content -->
<div id="content" class="content">
    <jsp:include page="../common/sidemenu.jsp"></jsp:include>
    <!-- begin page-header -->
    <h1 class="page-header">재고/단가 관리</h1>
    <!-- end page-header -->

    <!-- begin product search-->
    <h4>등록 할 상품 입력</h4>
    <!-- begin panel -->
    <div class="panel panel-inverse" data-sortable-id="form-plugins-3" style="width: 40%;">
        <!-- begin panel-heading -->
        <div class="panel-heading">
            <h4 class="panel-title">등록</h4>
        </div>
        <!-- end panel-heading -->
        <!-- begin panel-body -->
        <div class="panel-body panel-form">
            <form id="prodstkprcform" class="form-horizontal form-bordered" action="/insertProductStckPrice" method="post">
                <input type="hidden" id="prodSeq" name="prodSeq">
                <div class="form-group row">
                    <label class="col-md-2 col-form-label">상품코드</label>
                    <div class="col-md-10">
                        <div class="row row-space-10">
                            <input type="text" name="prodCode" id="prodCode" class="form-control col-md-5" placeholder="상품 코드를 입력해주세요." onkeyup="searchProd()" required />
                            <select class=" form-control col-md-4" id="prodCodeSelect" >
                                <option>상품코드 선택</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 col-form-label" id="prodStocklabel">재고수량</label>
                    <div class="col-md-10">
                        <div class="row row-space-10">
                            <input type="text" name="prodStock" id="prodStock" class="form-control col-md-5" placeholder="재고 수량을 입력해주세요."  required/>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 col-form-label" id="purchasePricelabel">구매단가</label>
                    <div class="col-md-10">
                        <div class="row row-space-10">
                            <input type="text" name="purchasePrice" id="purchasePrice" class="form-control col-md-5" placeholder="구매단가를 입력해 주세요." required />
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 col-form-label" id="prodSalePricelabel">판매단가</label>
                    <div class="col-md-10">
                        <div class="row row-space-10">
                            <input type="text" name="prodSalePrice" id="prodSalePrice" class="form-control col-md-5" placeholder="판매단가를 입력해 주세요." required/>
                            <button type="button" class="btn btn-primary col-md-3" onclick="insertProdStckPrc()">재고/단가 등록</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- end panel-body -->
    </div>
    <!-- end panel -->
    <!-- end product search-->

    <%--검색 begin--%>
    <div class="row row-space-10" style="margin-bottom: 1%; margin-top: 5%;" >
        <input class="form-control col-md-3" id="searchInput" >
        <button type="button" class="btn btn-primary col-md-2" onclick="searchProduct()">상품코드검색</button>
    </div>
    <%--검색 end--%>

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
                    <th class="text-nowrap" data-orderable="false">상품명</th>
                    <th class="text-nowrap" data-orderable="false">상품코드</th>
                    <th class="text-nowrap" data-orderable="false">재고수량</th>
                    <th class="text-nowrap" data-orderable="false">구매단가</th>
                    <th class="text-nowrap" data-orderable="false">판매단가</th>
                    <th class="text-nowrap" data-orderable="false" >입고날짜</th>
                </tr>
                </thead>
                <tbody id="tableBody">
                <%
                List<ProductStkPrcVo> productStkPrcVoList = (List<ProductStkPrcVo>)request.getAttribute("productStkPrcVoList");
                String prodCode="";
                int prodStkPrcSeq = 0;
                int prodSeq = 0;
                String prodName = "";
                int prodStock = 0;
                int purchasePrice = 0;
                int prodSalePrice = 0;
                String prodStkPrcDate = "";
                for(int i =0; i < productStkPrcVoList.size();i++){
                    prodCode = productStkPrcVoList.get(i).getProdCode();
                    prodSeq = productStkPrcVoList.get(i).getProdSeq();
                    prodName = productStkPrcVoList.get(i).getProdName();
                    prodStock = productStkPrcVoList.get(i).getProdStock();
                    purchasePrice = productStkPrcVoList.get(i).getPurchasePrice();
                    prodSalePrice = productStkPrcVoList.get(i).getProdSalePrice();
                    prodStkPrcDate = productStkPrcVoList.get(i).getProdStkPrcDate();
                    prodStkPrcSeq = productStkPrcVoList.get(i).getProdStkPrcSeq();
                %>

                <tr class="odd gradeX">
                    <td width="4%" class="f-s-600 text-inverse"> <button style="text-align: right;" type="button" class="btn btn-grey" onclick="openModal(<%=prodStkPrcSeq%>,<%=prodSeq%>)">수정</button></td>
                    <td id="prodName<%=prodStkPrcSeq%>"><%=prodName%></td>
                    <td id="prodCode<%=prodStkPrcSeq%>"><%=prodCode%></td>
                    <td id="prodStock<%=prodStkPrcSeq%>"><%=prodStock%></td>
                    <td id="purchasePrice<%=prodStkPrcSeq%>"><%=purchasePrice%></td>
                    <td id="prodSalePrice<%=prodStkPrcSeq%>"><%=prodSalePrice%></td>
                    <td id="prodStkPrcDate<%=prodStkPrcSeq%>"><%=prodStkPrcDate%></td>
                </tr>
                <%}%>


                </tbody>
            </table>
            <input type="hidden" id="edtitor" value="">
        </div>
        <!-- end panel-body -->
    </div>
    <!-- end panel -->
    <%--모달 begin--%>
    <div class="modal modal-message fade" id="prodModal">
        <form action="/editProductStockPrice" method="post" id="modalForm">
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
                            <tr>
                                <td>상품명</td>
                                <td><input id="prodNameInModal" class="form-control col-md-5" readonly></td>
                            </tr>
                            <tr>
                                <td>상품코드</td>
                                <td><input id="prodCodeInModal" class="form-control col-md-5"readonly></td>
                            </tr>
                            <tr>
                                <td>재고수량</td>
                                <td><input id="prodStockInModal" name="prodStock" class="form-control col-md-5" required></td>
                            </tr>
                            <tr>
                                <td>구매단가</td>
                                <td><input id="purchasePriceInModal" name="purchasePrice" class="form-control col-md-5" required></td>
                            </tr>
                            <tr>
                                <td>판매단가</td>
                                <td><input id="prodSalePriceInModal" name="prodSalePrice" class="form-control col-md-5" required></td>
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
<!--end content-->
<script src="${pageContext.request.contextPath}/resources/css/js/demo/form-plugins.demo.min.js"></script>
<script>
    $(document).ready(function() {
        FormPlugins.init();
    });

    /*상품검색*/
    function searchProduct(){

        let prodCode = $("#searchInput").val();
        console.log(prodCode);

        $.ajax({
            type : 'post',
            url : '/searchProdByProdCode',
            data : {
                "prodCode" : prodCode
            },
            dataType: "JSON",
            success : function (data){
                $("#tableBody").empty();
                let tr = "";
                for( var i=0; i<data.plist.length;i++){
                    tr += "<tr>" +
                    "<td width='4%' class='f-s-600 text-inverse'> <button style='text-align: right;' type='button' class='btn btn-grey' onclick='openModal()'>수정</button></td>"
                    +"<td id='prodName"+data.plist[i].prodStkPrcSeq+"'>"+data.plist[i].prodName+"</td>"
                    +"<td id='prodCode"+data.plist[i].prodStkPrcSeq+"'>"+data.plist[i].prodCode+"</td>"
                    +"<td id='prodStock"+data.plist[i].prodStkPrcSeq+"'>"+data.plist[i].prodStock+"</td>"
                    +"<td id='purchasePrice"+data.plist[i].prodStkPrcSeq+"'>"+data.plist[i].purchasePrice+"</td>"
                    +"<td id='prodSalePrice"+data.plist[i].prodStkPrcSeq+"'>"+data.plist[i].prodSalePrice+"</td>"
                    +"<td id='prodStkPrcDate"+data.plist[i].prodStkPrcSeq+"'>"+data.plist[i].prodStkPrcDate+"</td>"
                    +"</tr>";
                }
                console.log(tr);
                $("#tableBody").append(tr);
            }
        })
    }

    /*모달 열기*/
    function openModal(prodStkPrcSeq,prodSeq){
        $("#prodStkPrcSeqInModal").val(prodStkPrcSeq);
        $("#prodSeqInModal").val(prodSeq);
        $("#prodNameInModal").val($("#prodName"+prodStkPrcSeq).text());
        $("#prodCodeInModal").val($("#prodCode"+prodStkPrcSeq).text());
        $("#prodStockInModal").val($("#prodStock"+prodStkPrcSeq).text());
        $("#purchasePriceInModal").val($("#purchasePrice"+prodStkPrcSeq).text());
        $("#prodSalePriceInModal").val($("#prodSalePrice"+prodStkPrcSeq).text());

        $("#prodModal").modal("show");
    }

    /*모달에서 수정내용 저장*/
    function saveChanges(){

        //$("#modalForm").submit();

        /*유효성 검사*/
        /* $("#prodNameInModal").val();
         $("#prodCodeInModal").val();
         $("#prodStockInModal").val();
         $("#purchasePriceInModal").val();
         $("#prodSalePriceInModal").val();

          let data =  $("#prodStockInModal").val();
          let dataname = "재고수량";
          if(numberChk(data,dataname)){
              data = $("#purchasePriceInModal").val();
              dataname = "구매단가";
              if(numberChk(data,dataname)){
                  data = $("#prodSalePriceInModal").val();
                  dataname = "판매단가";
                  if(numberChk(data,dataname)){
                      //$("#modalForm").submit();
                      console.log("유효성검사 모두 성공====");
                  }else{/!*판매단가 유효성검사 false일 때*!/
                      event.preventDefault();
                  }
              }else {/!*구매단가 유효성검사 false일 때*!/
                  event.preventDefault();
              }
          }else{/!*재고수량 유효성검사 false일 때*!/
              event.preventDefault();
          }*/
    }

    /*상품코드 입력시 유사한 상품코드 리스트 가져오기*/
    function searchProd(){
        let prodcode = $("#prodCode").val();
        setTimeout( find(prodcode),0); /*이거없으면 엄청많이 돌아서 Maxmum call stack size exceeded 에러발생*/


        function find(prodcode){
            $.ajax({
                type : "post",
                url : "/searchProdCode",
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
                        op += "<option value='"+ prodSeq+"' onclick='selectProdCode(this.text())'>" + prodCode + "</option>";
                    }
                    $("#prodSeq").val(prodSeq);
                    $("#prodCodeSelect").append(op);
                }
            });
        }


    }

    /*상품코드 선택시 input에 값넘기기*/
    function selectProdCode(prodCode){

        console.log(prodCode);
        $("#prodCode").text(prodCode);

    }

    /*재고, 단가 저장*/
    function insertProdStckPrc(){
        let data = $("#prodStock").val();
        let dataname = "재고수량";
        if(numberChk(data,dataname)){
            data = $("#purchasePrice").val();
            dataname = "구매단가";
            if(numberChk(data,dataname)){
                data = $("#prodSalePrice").val();
                dataname = "판매단가";
                if(numberChk(data,dataname)){
                    $("#prodstkprcform").submit();
                }else{/*판매단가 유효성검사 false일 때*/
                    event.preventDefault();
                }
            }else {/*구매단가 유효성검사 false일 때*/
                event.preventDefault();
            }
        }else{/*재고수량 유효성검사 false일 때*/
            event.preventDefault();
        }
    }

    /*재고,단가 저장 시 유효성검사*/
    function numberChk(data, dataname){
        console.log("숫자 유효성검사 시작 ======");
        console.log("data : "+ data);
        console.log("dataname : "+ dataname);
        /*유효성검사*/
        let chk =data;
        let num = chk.search(/^[0-9]/g);
        let eng = chk.search(/[a-z]/ig);
        let spe = chk.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        console.log("eng: "+eng);
        console.log("spe: "+spe);
        if(chk.search(/\s/) != -1){
            alert( dataname+ "(은)는 공백 없이 입력해주세요.");
            return false;
        }else if(eng >= 0 || spe >=0 ){
            alert( dataname+ "(은)는 숫자만 입력해 주세요.");
            return false;
        }else if(num<0 ){
            alert(dataname+ "(은)는 숫자만 입력해 주세요.");
            return false;
        }else{
            return true;
        }
    }



    /*수정할 상품 선택*/
    function selectProdToEdit(){

    }
</script>
</body>
</html>
