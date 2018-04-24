<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Chi tiết đơn hàng
            </h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%"
                           class="table table-striped table-bordered table-hover"
                           id="dataTables-example">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                            <th>Tiếp nhận</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${order}" var="item" varStatus="i">
                            <tr class="odd gradeX">
                                <td>${i.count}</td>
                                <td>${item.getProduct().getName()}</td>
                                <td>${item.getQuantity()}</td>
                                <td><fmt:formatNumber type="number" pattern="###,###">${item.product.price}</fmt:formatNumber> VNĐ</td>
                                <td><fmt:formatNumber type="number" pattern="###,###">${item.product.price * item.getQuantity()}</fmt:formatNumber> VNĐ</td>
                                <td class="center"></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- /.table-responsive -->

                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->