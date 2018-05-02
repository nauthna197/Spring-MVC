<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<div id="page-wrapper" ng-app="app">
    <div ng-controller="order">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                    Lịch sử đặt hàng
                </h3>
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
                                <th>Người đặt hàng</th>
                                <th>Số điện thoại</th>
                                <th width="150px">Tổng số sản phẩm</th>
                                <th>Tổng tiền</th>
                                <th>Ngày giờ</th>
                                <th>Trạng thái</th>
                                <th width="170px">Chi tiết</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${info}" var="item" varStatus="i">
                                <tr class="odd gradeX">
                                    <td>${i.count}</td>
                                    <td>${item.getUser().getFullname()}</td>
                                    <td>${item.getUser().getNumber()}</td>
                                    <td>${item.orderNum}</td>
                                    <td><fmt:formatNumber type="number"
                                                          pattern="###,###">${item.amount}</fmt:formatNumber>
                                        VNĐ
                                    </td>
                                    <td>${item.orderDate}</td>
                                    <c:if test="${item.status==1}">
                                        <td><label class="label label-warning">Đơn hàng mới</label>
                                        </td>
                                    </c:if>
                                    <c:if test="${item.status==2}">
                                        <td><label class="label label-primary">Đơn hàng đã ship</label>
                                        </td>
                                    </c:if>
                                    <c:if test="${item.status==3}">
                                        <td><label class="label label-success"> Đơn hàng hoàn tất</label>
                                        </td>
                                    </c:if>
                                    <c:if test="${item.status==4}">
                                        <td><label class="label label-danger">Đơn hàng đã
                                            hủy</label>
                                        </td>
                                    </c:if>
                                    <th>
                                        <button type="button" class="btn btn-info btn-lg"
                                                ng-click="orderDetail(${item.id});setTotal(${item.amount})"
                                                data-toggle="modal"
                                                data-target="#myModal">Xem chi tiết
                                        </button>
                                    </th>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>


                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Chi tiết order</h4>
                                    </div>
                                    <div class="modal-body">
                                        <table width="100%"
                                               class="table table-hover table-striped">
                                            <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Số lượng</th>
                                                <th>Đơn giá</th>
                                                <th>Thành tiền</th>
                                            </tr>
                                            </thead>
                                            <tbody ng-repeat="orderDetail in orderDetails.data">
                                            <tr class="odd gradeX">
                                                <td>{{$index}}</td>
                                                <td>{{orderDetail.product.name}}</td>
                                                <td>{{orderDetail.quantity}}</td>
                                                <td>{{orderDetail.product.price | currency : "" : 0}} VND</td>
                                                <td>{{orderDetail.product.price * orderDetail.quantity | currency :
                                                    "" : 0}} VND
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        Tổng hóa đơn : {{total}}
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Xác nhận
                                        </button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

                    <!-- /.table-responsive -->

                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <script src="<%=request.getContextPath()%>/resources/js-user/angular.js"></script>
    <script type="text/javascript">
        var app = angular.module('app', []);

        app.controller("order", function ($scope, $http, $location) {


            $scope.orderDetail = function (id) {

                var url = "/admin/getorderbyid/" + id;

                $http.post(url, "").then(function (response) {
                        if (response.data.message == "success") {
                            $scope.orderDetails = response.data;
                        }
                    }, function (response) {
                        $scope.getResultMessage = "Fail!";
                    }
                )
            }

            $scope.total = 0


            $scope.setTotal = function (amount) {
                $scope.total = amount;
            }


        });

    </script>


    <!-- /.row -->
</div>
<!-- /#page-wrapper -->