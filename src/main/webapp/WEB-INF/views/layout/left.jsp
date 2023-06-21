<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!-- Sidebar -->
<div id="sidebar" class="sidebar">
    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
        <div data-scrollbar="true" data-height="100%" data-init="true" style="overflow: hidden; width: auto; height: 100%;">
            <ul class="nav">
                <!-- Sidebar - Brand -->
                <li class="nav-header">
                    메뉴
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/fbList">
                        <span><i class="bi bi-lightbulb"></i>공지사항</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/claim">
                        <span><i class="bi bi-exclamation-lg"></i>클레임</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:subMenu();">
                        <span><i class="bi bi-cart-plus"></i>주문 관리</span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/orderInsert">
                                <span><i class="bi bi-cart-plus"></i> 주문등록 1</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/orderInsertSecond">
                                <span><i class="bi bi-cart-plus"></i> 주문등록 2</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/favoriteProd">
                                <span><i class="bi bi-heart"></i> 선호상품등록</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/orderDataCheck">
                                <span><i class="bi bi-check-lg"></i> 주문확인</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify">
                        <i class="fa fa-angle-double-left"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<script>

    function subMenu(){

        $(".sub-menu").css("display", "block");

    }

</script>
<!-- End of Sidebar -->