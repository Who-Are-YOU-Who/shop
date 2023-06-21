<%@ page import="com.whizlab_shop.vo.AddressVo" %>
<%@ page import="com.whizlab_shop.vo.ProductVo" %>
<%@ page import="com.whizlab_shop.vo.CustomerVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- BEGIN #page-container -->
<div id="page-container" class="fade">
    <jsp:include page="../common/header.jsp"></jsp:include>



<%  String customerName="";
    if(session.getAttribute("customer")!=null){
       CustomerVo customerVo = (CustomerVo) session.getAttribute("customer");
       customerName = customerVo.getCustomerName();
    };
    AddressVo addressVo = (AddressVo) request.getAttribute("addressVo");
    ProductVo productVo = (ProductVo) request.getAttribute("productVo");
    int prodCount = (int) request.getAttribute("prodCount");
    String imgPath = productVo.getProdImgPath();
    String prodName = productVo.getProdName();
    int prodSalePrice = productVo.getProdSalePrice();
    String address =  addressVo.getAddress();
    int deliveryPrice = productVo.getDeliveryPrice();
%>

    <div class="container">
    <!-- BEGIN checkout-body -->
    <div class="checkout-body">
        <div class="table-responsive">
            <table class="table table-cart">
                <thead>
                <tr>
                    <th>주문 상품 정보</th>
                    <%--<th class="text-center">Price</th>
                    <th class="text-center">Quantity</th>
                    <th class="text-center">Total</th>--%>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="cart-product">
                        <div class="product-img">
                            <img src="image/product/<%=imgPath%>" alt="" />
                        </div>
                        <div class="product-info">
                            <div class="title"><%=prodName%></div>
                        </div>
                    </td>
                    <td class="cart-price text-center">개당 <%=prodSalePrice%>원</td>
                    <td class="cart-qty text-center">
                        <div class="cart-qty-input">
                            <a href="javascript:changeProdCount()" class="qty-control left disabled" data-click="decrease-qty" data-target="#qty"><i class="fa fa-minus"></i></a>
                            <input type="text" name="prodCount" value=<%=prodCount%> class="form-control" id="prodCount" />
                            <a href="javascript:changeProdCount()" class="qty-control right disabled" data-click="increase-qty" data-target="#qty"><i class="fa fa-plus"></i></a>
                        </div>
                        <div class="qty-desc">최대 20개 주문가능</div>
                    </td>
                    <td class="cart-total text-center">
                       <%=prodCount*prodSalePrice%>원
                    </td>
                </tr>
                <tr><th>주문자 정보</th></tr>
                <tr>
                    <td>이름 : <%=customerName%></td>
                    <td>배송지 : <%=address%></td>
                    <td><button class="btn btn-primary btn-md" onclick="openAddressModal()">배송지변경</button></td>
                </tr>
                <tr>
                    <th>배송비</th>
                </tr>
                <tr>
                    <td><%=deliveryPrice%></td>
                </tr>
                <tr>
                    <th>결제 총금액</th>
                </tr>
                <tr>
                    <td><%=deliveryPrice+(prodSalePrice*prodCount)%></td>
                </tr>
                <tr>
                    <th>결제방식</th>
                </tr>
                <tr>
                    <td>
                        <ul style="list-style: none;">
                            <li><checkbox>무통장입금</checkbox></li>
                            <li><a>카카오페이</a></li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="cart-summary" colspan="4">
                        <div class="summary-container">
                            <div class="summary-row">
                                <div class="field">Cart Subtotal</div>
                                <div class="value">$999.00</div>
                            </div>
                            <div class="summary-row text-danger">
                                <div class="field">Free Shipping</div>
                                <div class="value">$0.00</div>
                            </div>
                            <div class="summary-row total">
                                <div class="field">Total</div>
                                <div class="value">$999.00</div>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- END checkout-body -->

        <%--모달--%>
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="ui-modal-notification-2" style="display: none;" id="addressModal">
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                </div>
                <h4 class="panel-title">Modal</h4>
            </div>
            <div class="panel-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Description</th>
                        <th>Demo</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Default Modal Dialog Box.</td>
                        <td><a href="#modal-dialog" class="btn btn-sm btn-success" data-toggle="modal">Demo</a></td>
                    </tr>
                    <tr>
                        <td>Modal Dialog Box with fade out animation.</td>
                        <td><a href="#modal-without-animation" class="btn btn-sm btn-default" data-toggle="modal">Demo</a></td>
                    </tr>
                    <tr>
                        <td>Modal Dialog Box with full width white background.</td>
                        <td><a href="#modal-message" class="btn btn-sm btn-primary" data-toggle="modal">Demo</a></td>
                    </tr>
                    <tr>
                        <td>Modal Dialog Box with alert message.</td>
                        <td><a href="#modal-alert" class="btn btn-sm btn-danger" data-toggle="modal">Demo</a></td>
                    </tr>
                    </tbody>
                </table>
                <!-- #modal-dialog -->
                <div class="modal fade" id="modal-dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Dialog</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <p>
                                    Modal body content here...
                                </p>
                            </div>
                            <div class="modal-footer">
                                <a href="javascript:;" class="btn btn-white" data-dismiss="modal">Close</a>
                                <a href="javascript:;" class="btn btn-success">Action</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #modal-without-animation -->
                <div class="modal" id="modal-without-animation">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Without Animation</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                Modal body content here...
                            </div>
                            <div class="modal-footer">
                                <a href="javascript:;" class="btn btn-white" data-dismiss="modal">Close</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #modal-message -->
                <div class="modal modal-message fade" id="modal-message">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Message Header</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <p>Text in a modal</p>
                                <p>Do you want to turn on location services so GPS can use your location ?</p>
                            </div>
                            <div class="modal-footer">
                                <a href="javascript:;" class="btn btn-white" data-dismiss="modal">Close</a>
                                <a href="javascript:;" class="btn btn-primary">Save Changes</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #modal-alert -->
                <div class="modal fade" id="modal-alert">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Alert Header</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <div class="alert alert-danger m-b-0">
                                    <h5><i class="fa fa-info-circle"></i> Alert Header</h5>
                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="javascript:;" class="btn btn-white" data-dismiss="modal">Close</a>
                                <a href="javascript:;" class="btn btn-danger" data-dismiss="modal">Action</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end panel -->




    </div>




    <jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<%--end page-container--%>
</body>
<script>
    $(document).ready(function() {
        App.init();
    });

    /*배송지 변경 모달 열기*/
    function openAddressModal(){
        $("#addressModal").open();
    }
</script>

</html>
