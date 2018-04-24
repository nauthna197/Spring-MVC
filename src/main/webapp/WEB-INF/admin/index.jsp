<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div id="page-wrapper" ng-app="app">
    <div ng-controller="order">
        <div class="row">
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">


            <div class="col-lg-3 col-md-6" ng-init="getRowCount();order();">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-shopping-cart fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">{{row.data}}</div>
                                <div>New Orders!</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span> <span
                                class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-8">
                <%--  <div class="panel panel-default">
                      <div class="panel-heading">
                          <i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
                          <div class="pull-right">
                              <div class="btn-group">
                                  <button type="button"
                                          class="btn btn-default btn-xs dropdown-toggle"
                                          data-toggle="dropdown">
                                      Actions <span class="caret"></span>
                                  </button>
                                  <ul class="dropdown-menu pull-right" role="menu">
                                      <li><a href="#">Action</a></li>
                                      <li><a href="#">Another action</a></li>
                                      <li><a href="#">Something else here</a></li>
                                      <li class="divider"></li>
                                      <li><a href="#">Separated link</a></li>
                                  </ul>
                              </div>
                          </div>
                      </div>
                      <!-- /.panel-heading -->
                      <div class="panel-body">
                          <div id="morris-area-chart"></div>
                      </div>
                      <!-- /.panel-body -->
                  </div>--%>
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i> Các đơn hàng trong ngày hôm nay
                        <div class="pull-right">
                            <div class="btn-group">
                                <button type="button"
                                        class="btn btn-default btn-xs dropdown-toggle"
                                        data-toggle="dropdown">
                                    Actions <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class="">
                                <div class="dataTables_wrapper form-inline dt-bootstrap no-footer"
                                     id="dataTables-example_wrapper">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tổng số sản phẩm</th>
                                            <th>Tổng tiền</th>
                                            <th>Ngày giờ</th>
                                            <th>Trạng thái</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr ng-repeat="order in orders.data">
                                            <td>{{$index}}</td>
                                            <td>{{order.orderNum}}</td>
                                            <td>{{order.amount}}</td>
                                            <td>{{order.orderDate}}</td>
                                            <td ng-if="order.status==1"><strong style="padding: 5px 20px;
                border-radius: 20px;
                -moz-border-radius: 20px;
                -webkit-border-radius: 20px;
                border: none;
                background: #c01f2d;
                color: #fff;
                cursor: pointer;">Đơn hàng mới </strong></td>
                                            <td ng-if="order.status==2">Đơn hàng đã tiếp nhận</td>
                                            <td ng-if="order.status==3">Đơn hàng đã xử lý</td>
                                            <th><a href="/admin/getorderbyid/{{order.id}}">Xem</a></th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.col-lg-4 (nested) -->
                            <div class="col-lg-8">
                                <div id="morris-bar-chart"></div>
                            </div>
                            <!-- /.col-lg-8 (nested) -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->

                <!-- /.panel -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i> Notifications Panel
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <a href="#" class="list-group-item"> <i
                                    class="fa fa-comment fa-fw"></i> New Comment <span
                                    class="pull-right text-muted small"><em>4 minutes ago</em>
						</span>
                            </a> <a href="#" class="list-group-item"> <i
                                class="fa fa-twitter fa-fw"></i> 3 New Followers <span
                                class="pull-right text-muted small"><em>12 minutes
									ago</em> </span>
                        </a> <a href="#" class="list-group-item"> <i
                                class="fa fa-envelope fa-fw"></i> Message Sent <span
                                class="pull-right text-muted small"><em>27 minutes
									ago</em> </span>
                        </a> <a href="#" class="list-group-item"> <i
                                class="fa fa-tasks fa-fw"></i> New Task <span
                                class="pull-right text-muted small"><em>43 minutes
									ago</em> </span>
                        </a> <a href="#" class="list-group-item"> <i
                                class="fa fa-upload fa-fw"></i> Server Rebooted <span
                                class="pull-right text-muted small"><em>11:32 AM</em> </span>
                        </a> <a href="#" class="list-group-item"> <i
                                class="fa fa-bolt fa-fw"></i> Server Crashed! <span
                                class="pull-right text-muted small"><em>11:13 AM</em> </span>
                        </a> <a href="#" class="list-group-item"> <i
                                class="fa fa-warning fa-fw"></i> Server Not Responding <span
                                class="pull-right text-muted small"><em>10:57 AM</em> </span>
                        </a> <a href="#" class="list-group-item"> <i
                                class="fa fa-shopping-cart fa-fw"></i> New Order Placed <span
                                class="pull-right text-muted small"><em>9:49 AM</em> </span>
                        </a> <a href="#" class="list-group-item"> <i
                                class="fa fa-money fa-fw"></i> Payment Received <span
                                class="pull-right text-muted small"><em>Yesterday</em> </span>
                        </a>
                        </div>
                        <!-- /.list-group -->
                        <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i> Donut Chart Example
                    </div>
                    <div class="panel-body">
                        <div id="morris-donut-chart"></div>
                        <a href="#" class="btn btn-default btn-block">View Details</a>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
                <div class="chat-panel panel panel-default">
                    <!-- /.panel-heading -->

                    <!-- /.panel-body -->
                    <div class="panel-footer">
                        <div class="input-group">
                            <input id="btn-input" type="text" class="form-control input-sm"
                                   placeholder="Type your message here..."/> <span
                                class="input-group-btn">
							<button class="btn btn-warning btn-sm" id="btn-chat">
								Send</button>
						</span>
                        </div>
                    </div>
                    <!-- /.panel-footer -->
                </div>
                <!-- /.panel .chat-panel -->
            </div>
            <!-- /.col-lg-4 -->
        </div>
    </div>
    <!-- /.row -->
</div>
<script src="<%=request.getContextPath()%>/resources/js-user/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('app', []);

    app.controller("order", function ($scope, $http, $location) {


        $scope.getRowCount = function () {

            var url = "/admin/getroworder";

            $http.post(url, "").then(function (response) {
                    if (response.data.message == "success") {
                        $scope.row = response.data;
                    }
                }, function (response) {
                    $scope.getResultMessage = "Fail!";
                }
            )
        }

        $scope.order = function () {

            var url = "/admin/getorderbytime";

            $http.post(url, "").then(function (response) {
                    if (response.data.message == "success") {
                        $scope.orders = response.data;
                    }
                }, function (response) {
                    $scope.getResultMessage = "Fail!";
                }
            )
        }


    });

</script>


<!-- /#page-wrapper -->