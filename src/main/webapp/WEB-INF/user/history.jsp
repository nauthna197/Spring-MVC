<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="container">
    <div class="sixteen columns">

        <div id="pageName">
            <div class="name_tag">
                <p>
                    You're Here :: <a href="#">History Order</a>
                </p>
                <div class="shapLeft"></div>
                <div class="shapRight"></div>
            </div>
        </div><!--end pageName-->

    </div>
</div>
<!-- container -->


<!-- strat the main content area -->
<div ng-app="app">
    <div class="container" ng-controller="cartController" ng-init="order()">
        <table class="cart_table">
            <thead>
            <tr>
                <th>#</th>
                <th>Chi tiết</th>
                <th><h4>Tổng số sản phẩm</h4></th>
                <th><h4>Tổng tiền</h4></th>
                <th><h4>Ngày giờ</h4></th>
                <th><h4>Trạng thái</h4></th>
            </tr>
            </thead>
            <tbody ng-repeat="order in orders.data">
            <tr>
                <td>{{$index}}</td>
                <td>
                    <button type="button" class="btn btn-info btn-lg"
                            ng-click="orderDetail(order.id);setTotal(order.amount)" data-toggle="modal"
                            data-target="#myModal">Xem chi tiết
                    </button>
                </td>
                <td>{{order.orderNum}}</td>
                <td>
                    {{order.amount | currency : "" : 0}} VND
                </td>
                <td>
                    <h5>{{order.orderDate}}</h5>
                </td>
                <td ng-if="order.status==1" ><label class="label label-info">Đơn hàng đang được xử lý</label>
                </td>
                <td ng-if="order.status==1"  ><a ng-click="delete(order.id)"> <label class="gray_btn">Hủy đơn hàng</label></a>
                </td>
                <td ng-if="order.status==2"><label class="label label-primary">Đơn hàng đã ship</label>
                </td>
                <td ng-if="order.status==3"><label class="label label-success">Đơn hàng đã hoàn tất</label>
                </td>
                <td ng-if="order.status==4" > <label class="label label-warning">Đơn hàng đã bị hủy</label>
                </td>
            </tr>
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
                        Tổng hóa đơn : {{total | currency : "" : 0}} VND
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng
                        </button>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('app', []);

    app.controller("cartController", function ($scope, $http, $location, $window) {


        $scope.order = function () {

            var url = "/gethistory";

            $http.post(url, "").then(function (response) {
                    if (response.data.message == "success") {
                        $scope.orders = response.data;
                    }else if(response.data.message=="fail"){
                        alert("Bạn phải đăng nhập để xem lịch sử")
                    }
                }, function (response) {
                    $scope.getResultMessage = "Fail!";
                }
            )
        }


        $scope.delete = function (id) {
            if(confirm("Bạn có thực sự muốn hủy đơn hàng")){

                var url = "cancel/"+id;

                $http.get(url, "").then(function (response) {
                        if (response.data.message == "success") {
                            $scope.order();
                        }
                    }, function (response) {

                        $scope.getResultMessage = "Fail!";
                    }
                )
            }else{
            }
        }

        $scope.orderDetail = function (id) {

            var url = "/getorderbyid/" + id;

            $http.post(url, "").then(function (response) {
                    if (response.data.message == "success") {
                        $scope.orderDetails = response.data;
                        $scope.id = id;
                    }
                }, function (response) {
                    $scope.getResultMessage = "Fail!";
                }
            )
        }

        $scope.total = 0


        $scope.setTotal = function(amount){
            $scope.total = amount;
        }


    });
</script>
<!--end container-->
<!-- end the main content area -->
