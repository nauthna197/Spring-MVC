<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div id="page-wrapper" ng-app="app">
    <div id="order" ng-controller="order">
        <div class="row">
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">


            <div class="col-lg-3 col-md-6" ng-init="getRowCount();order();getLstProduct()">
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
            <div class="col-lg-12">
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

                    <%--<button type="button" class="btn btn-info btn-lg"
                                data-toggle="modal"
                            data-target="#myModal2">Tạo đơn hàng mới
                    </button>--%>
                    <div class="modal fade" id="myModal2" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Chi tiết order</h4>
                                </div>
                                <div class="modal-body">
                                    <table id="myTable" class=" table order-list">
                                        <thead>
                                        <tr>
                                            <td>Sản phẩm</td>
                                            <td>Đơn giá</td>
                                            <td>Số lượng</td>
                                            <td>Thành tiền</td>
                                            <td></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="col-sm-4">
                                                <select ng-model="product">
                                                    <option value="2" ng-repeat="item in lstProduct.data" ng-value="item.id">{{item.name}}</option>
                                                </select>
                                            </td>
                                            <td class="col-sm-4">
                                                <label class="form-control" name="price"></label>
                                            </td>
                                            <td class="col-sm-3">
                                                <input type="text" name="quantity"  class="form-control"/>
                                            </td>
                                            <td class="col-sm-3">
                                                <label class="form-control" name="total"></label>
                                            </td>
                                            <td class="col-sm-2"><a class="deleteRow"></a>

                                            </td>
                                        </tr>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <td colspan="5" style="text-align: left;">
                                                <input ng-click="getLstProduct()" type="button" class="btn btn-lg btn-block " id="addrow" value="Add Row" />
                                            </td>
                                        </tr>
                                        <tr>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Tạo đơn hàng
                                    </button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>



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
                                            <th>Người đặt hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Tổng số sản phẩm</th>
                                            <th>Tổng tiền</th>
                                            <th>Ngày giờ</th>
                                            <th>Trạng thái</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr ng-repeat="order in orders.data | filter:order.orderDate">
                                            <td>{{$index}}</td>
                                            <td>{{order.user.fullname}}</td>
                                            <td>{{order.user.number}}</td>
                                            <td>{{order.orderNum}}</td>
                                            <td>{{order.amount | currency : "" : 0}} VND</td>
                                            <td>{{order.orderDate}}</td>
                                            <td ng-if="order.status==1"> <label class="label label-warning">Đơn hàng mới</label>
                                            </td>
                                            <td ng-if="order.status==2"><label class="label label-primary">Đơn hàng đã ship</label>
                                            </td>
                                            <td ng-if="order.status==4"><label class="label label-warning">Đơn hàng đã hủy</label>
                                            </td>
                                            <td ng-if="order.status==3"><label class="label label-success"> Đơn hàng hoàn tất</label>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-info btn-lg"
                                                        ng-click="orderDetail(order.id);setTotal(order.amount)" data-toggle="modal"
                                                        data-target="#myModal">Xem chi tiết
                                                </button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>

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
                                            Chuyển trạng thái đơn hàng
                                            <select ng-model="status">
                                                <option value="2" ng-repeat="item in units" ng-value="item.id">{{item.label}}</option>
                                            </select>
                                            <button ng-click="changeStatus(id,status)" type="button" class="btn btn-default" data-dismiss="modal">Xác nhận
                                            </button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng
                                            </button>
                                        </div>
                                    </div>

                                </div>
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
            <!-- /.col-lg-4 -->
        </div>
    </div>
    <!-- /.row -->
</div>
<script src="<%=request.getContextPath()%>/resources/js-user/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('app', []);

    app.controller("order", function ($scope, $http, $location) {

        $scope.units = [
            {'id': 2, 'label': 'Đơn hàng đã ship'},
            {'id': 3, 'label': 'Đơn hàng hoàn tất'},
            {'id': 4, 'label': 'Hủy đơn hàng'},
        ]


        $scope.status = 0;


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

            var url = "/admin/getordertoday";

            $http.get(url, "").then(function (response) {
                    if (response.data.message == "success") {
                        $scope.orders = response.data;
                    }
                }, function (response) {
                    $scope.getResultMessage = "Fail!";
                }
            )
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


        $scope.changeStatus = function (id,status) {

            var url = "/admin/setstatus/"+id +"/" + status;

            $http.get(url, "").then(function (response) {
                    if (response.data.message == "success") {
                        $scope.order();
                    }
                }, function (response) {

                    $scope.getResultMessage = "Fail!";
                }
            )

        }


        $scope.getLstProduct = function () {

            var url = "/getlstProduct";

            $http.get(url, "").then(function (response) {
                    if (response.data.message == "success") {
                        $scope.lstProduct = response.data;
                        $scope.order();
                    }
                }, function (response) {

                    $scope.getResultMessage = "Fail!";
                }
            )

        }



    });

</script>
<script type="text/javascript">
    $(document).ready(function () {





        var counter = 0;

        $("#addrow").on("click", function () {
            var newRow = $("<tr>");
            var cols = "";

            cols += '<td><select ng-model="product" \'+ counter + \'>\n' +
                '            <option value="2" ng-repeat="item in lstProduct.data" ng-value="item.id"></option>\n' +
                '        </select>\n' +
                '        </td>';
            cols += '<td><label class="" name="price" ' + counter + '"></label></td>';
            cols += '<td><input type="text" name="product" class="form-control" '+ counter + '"/></td>';
            cols += '<td><label class="" name="label" '+ counter + '"><label></td>';


            cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
            newRow.append(cols);
            $("table.order-list").append(newRow);
            counter++;
        });



        $("table.order-list").on("click", ".ibtnDel", function (event) {
            $(this).closest("tr").remove();
            counter -= 1
        });


    });



    function calculateRow(row) {
        var price = +row.find('input[name^="price"]').val();

    }

    function calculateGrandTotal() {
        var grandTotal = 0;
        $("table.order-list").find('input[name^="price"]').each(function () {
            grandTotal += +$(this).val();
        });
        $("#grandtotal").text(grandTotal.toFixed(2));
    }
</script>


<!-- /#page-wrapper -->