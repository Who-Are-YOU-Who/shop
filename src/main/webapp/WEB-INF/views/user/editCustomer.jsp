<%@ page import="com.whizlab_shop.vo.CustomerVo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.whizlab_shop.vo.UserVo" %>
<%@ page import="com.whizlab_shop.vo.GradeVo" %>
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
    <h1 class="page-header">일반회원 관리</h1>
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
            <h4 class="panel-title">일반회원 목록</h4>
        </div>
        <!-- end panel-heading -->
        <!-- begin panel-body -->
        <div class="panel-body">
            <table id="data-table-default" class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th width="1%"></th>
                    <th width="4%" >등급</th>
                    <th class="text-nowrap" data-orderable="false">이름</th>
                    <th class="text-nowrap" data-orderable="false">아이디</th>
                    <th class="text-nowrap" data-orderable="false">전화번호</th>
                    <th class="text-nowrap" data-orderable="false">생년월일</th>
                    <th class="text-nowrap" data-orderable="false" >이메일</th>
                    <th class="text-nowrap" data-orderable="false" >활동상태</th>
                </tr>
                </thead>
                <tbody>
                <%
                   UserVo user = (UserVo)session.getAttribute("user");
                   int edtitor = user.getUserSeq();
                 List<CustomerVo> customerList = (List<CustomerVo>)request.getAttribute("customerList");
                 int customerSeq = 0;
                 String customerName= "";
                 String customerId="";
                 String customerMobile="";
                 String customerEmail="";
                 String customerGrade = "";
                 String customerBday="";
                 String customerDel="";
                 for (int i=0; i<customerList.size();i++){
                     customerSeq=customerList.get(i).getCustomerSeq();
                     customerName =customerList.get(i).getCustomerName();
                     customerId =customerList.get(i).getCustomerId();
                     customerEmail=customerList.get(i).getCustomerEmail();
                     customerMobile=customerList.get(i).getCustomerMobile();
                     customerGrade=customerList.get(i).getCustomerGrade();
                     customerBday = customerList.get(i).getCustomerBday();
                     customerDel = customerList.get(i).getCustomerDel();
                 %>

                <tr class="odd gradeX">
                    <input type="hidden" id="bday<%=customerSeq%>" value="<%=customerBday%>">
                    <td width="4%" class="f-s-600 text-inverse" id="customerDel<%=customerSeq%>"> <button style="text-align: right;" type="button" class="btn btn-grey" onclick="selectCustomerToEdit(<%=customerSeq%>)">수정</button></td>
                    <td width="4%" id="grade<%=customerSeq%>"><%=customerGrade%></td>
                    <td id="name<%=customerSeq%>"><%=customerName%></td>
                    <td id="id<%=customerSeq%>"><%=customerId%></td>
                    <td id="mobile<%=customerSeq%>"><%=customerMobile%></td>
                    <td id="bady<%=customerSeq%>"><%=customerBday%></td>
                    <td id="email<%=customerSeq%>"><%=customerEmail%></td>
                    <td id="cusDel<%=customerSeq%>">
                        <%
                            System.out.println("customerDel = "+customerDel);
                            if(customerDel.equals("Y")){%>
                            <%="활동중지"%>
                       <%}else if(customerDel.equals("N")){%>
                            <%="활동중"%>
                        <%}%></td>
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
        <form method="post" action="/editCustomer">
        <div class="modal-dialog">
            <div class="modal-content" >
                <div class="modal-header">
                    <h4 class="modal-title">일반회원 관리</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <table class="table"  style="text-align: center; margin: auto;">

                        <input type="hidden" id="cusSeqinModal" name="customerSeq">
                        <input type="hidden" id="customerEditor" name="customerEditor" value="<%=edtitor%>">
                        <tr>
                            <td>등급</td>
                            <td>
                                <select id="cusGradeinModal" class="form-control" name="gradeSeq" >
                                    <%List<GradeVo> gradeList = (List<GradeVo>) request.getAttribute("gradeList");
                                        for(int i =0;i<gradeList.size();i++){%>
                                    <option value="<%=gradeList.get(i).getGradeSeq()%>"><%=gradeList.get(i).getGradeName()%></option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input id="cusNameinModal" readonly class="form-control" name="customerName" ></td>
                        </tr>
                        <tr>
                            <td>아이디</td>
                            <td><input id="cusIdinModal" readonly class="form-control" name="customerId" ></td>
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td><input id="cusMobileinModal" readonly class="form-control" name="customerMobile" ></td>
                        </tr>
                        <tr>
                            <td>생년월일</td>
                            <td><input id="cusBday" readonly class="form-control" name="customerBday" ></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><input id="cusEmailinModal" readonly class="form-control" name="customerEmail" ></td>
                        </tr>
                        <tr>
                            <td>활동상태</td>
                            <td>
                                <select id="cusDelinModal" name="customerDel" class="form-control">
                                    <option value="N">활동중</option>
                                    <option value="Y">활동중지</option>
                                </select>
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">수정하기</button>
                </div>
            </div>
        </div>
        </form>
    </div>

</div>
<!-- end #content -->

<script>

    function selectCustomerToEdit(seq){
        console.log("모달열기===========");
        $("#cusSeqinModal").val( seq );
        $("#cusGradeinModal").val( $("#grade"+seq).text() );
        $("#cusNameinModal").val( $("#name"+seq).text() );
        $("#cusIdinModal").val( $("#id"+seq).text() );
        $("#cusMobileinModal").val( $("#mobile"+seq).text() );
        $("#cusBday").val( $("#bady"+seq).text() );
        $("#cusEmailinModal").val( $("#email"+seq).text() );
        $("#cusDelinModal").val($("#cusDel"+seq).text());

        $("#modal-message").modal("show");
    }


</script>
</body>
</html>