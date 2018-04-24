<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<head>


</head>
<div class="container">
    <div class="sixteen columns">

        <div id="pageName">
            <div class="name_tag">
                <p>
                    You're Here :: <a href="#">home</a> :: My Shopping Cart
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
<div class="container" ng-controller="cartController">


    <div class="sixteen columns"  ng-init="getAll()">

        <div class="box_head">
            <h3>My Shopping Cart</h3>
        </div>
        <!--end box_head -->
        <table class="cart_table">
            <thead>
            <tr>
                <th class="first_td"><h4>Sản phẩm</h4></th>
                <th><h4>Số lượng</h4></th>
                <th><h4>Đơn giá</h4></th>
                <th><h4>Thành tiền</h4></th>
                <th><h4>Xóa khỏi giỏ hàng</h4></th>
            </tr>
            </thead>
            <tbody>


            <tr ng-repeat="cart in carts.data.items">
                <td class="first_td">
                    <div class="clearfix">
                        <img width="40px"
                             src="${pageContext.request.contextPath}/productImage?id={{cart.product.id}}"
                             alt="product image">
                        <span>
    <strong><a href="#">{{cart.product.name}}</a></strong><br>
    <ul>
    <li><a href="javascript:void(0);">text</a></li>
    <li><a href="javascript:void(0);">text</a></li>
    <li><a href="javascript:void(0);">text</a></li>
    <li><a href="javascript:void(0);">text</a></li>
    <li><a href="javascript:void(0);">text</a></li>
    </ul>
    Color: black<br>
    Size: 36
    </span>
                    </div>
                </td>
                <td class="quantity">
                    <form>
                        <label>
                            <a href="" ><input ng-click="decrase(cart.product.id)"
                                              class="gray_btn" type="button" id="Min" class="qty" value="-"
                            ></a>
                        </label>
                        <a href="#"><span>{{cart.quantity}}</span></a>
                        <label>
                            <a href="#" > <input ng-click="increase(cart.product.id)"
                                                class="gray_btn" type="button" id="max_qty" class="qty" value="+"
                            ></a>

                        </label>
                    </form>
                </td>
                <td>
                    <h5>{{cart.product.price | currency : "" : 0 }} VND
                    </h5>


                </td>
                <td class="total_price">
                    <h5>{{cart.product.price*cart.quantity | currency : "" : 0}} VND
                        <br></h5>
                </td>
                <td>
                  <a >  <input ng-click="delete(cart.product.id)"
                           class="gray_btn" type="button"  class="qty" value="Xóa khỏi giỏ hàng"
                    ></a>
                </td>
            </tr>

            </tbody>
        </table><!--end cart_table-->

    </div><!--end sixteen-->


    <div class="ten columns">
        <div class="cart_tabs clearfix">c

            <ul class="cart_tabs_nav">
                <li><a class="active_tab" href="#estimate">Estimate Shipping&amp;Taxes</a></li>
                <li><a href="#discount_code">Applying Discount Code</a></li>
                <li><a href="#gift_voucher">Use Gift Voucher</a></li>
            </ul><!--end cart_tabs_nav-->

            <div class="cart_tabs_content">
                <div id="estimate" class="tab">
                    <p>Enter your destination to get a shipping estimate...</p>
                    <form method="#" action="#">
                        <label class="clearfix">
                            <strong>You Country:</strong>
                            <select class="default" tabindex="1">
                                <option value="">-- Choise your Country --</option>
                                <option value="sometext1">sometext1</option>
                                <option value="sometext2">sometext2</option>
                                <option value="sometext3">sometext3</option>
                            </select>
                        </label>

                        <label class="clearfix">
                            <strong>State/Regoin:</strong>
                            <select name="state" class="default" tabindex="1">
                                <option value="">-- Choise your Regoin --</option>
                                <option value="text1">text1</option>
                                <option value="text2">text2</option>
                                <option value="text3">text3</option>
                            </select>
                        </label>

                        <label for="post_code" class="clearfix">
                            <strong>Post Code:</strong>
                            <input type="text" name="post_code" value="" placeholder="12345">
                        </label>

                        <div class="submit">
                            <input class="gray_btn" type="submit" name="submit" value="Get Quotes">
                        </div>
                    </form>
                </div>


                <div id="discount_code" class="tab">
                    <p>Enter your Discount Code Below...</p>
                    <form method="#" action="#">
                        <label for="country" class="clearfix">
                            <strong>Discount Code:</strong>
                            <input type="text" name="post_code" value="" placeholder="Enter Code">
                        </label>

                        <div class="submit">
                            <input class="gray_btn" type="submit" name="submit" value="Apply Coupon">
                        </div>
                    </form>
                </div>

                <div id="gift_voucher" class="tab">
                    <p>Enter your gift voucher code Below...</p>
                    <form method="#" action="#">
                        <label for="country" class="clearfix">
                            <strong>voucher code:</strong>
                            <input type="text" name="post_code" value="" placeholder="Enter Code">
                        </label>

                        <div class="submit">
                            <input class="gray_btn" type="submit" name="submit" value="Apply Voucher">
                        </div>
                    </form>
                </div>
            </div><!--end cart_tabs_content-->

        </div><!--end cart_tabs-->
    </div><!--end ten-->


    <div class="six columns">

        <table class="receipt">
            <tbody>
            <tr>
                <td style="font-weight:600;font-size:16px;">Thành tiền</td>

                    <td style="font-weight:600;font-size:16px;" ng-init='getTotal()'>
                        {{total.data | currency : "" : 0 }} VND
                    </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td class="last_td">
                    <a class="gray_btn" href="/index">Tiếp tục mua sắm</a>
                </td>
                <td class="last_td">
                    <input ng-click="checkout()"
                           class="red_btn" type="button"  class="qty" value="Đặt hàng ngay"
                    >
                </td>
            </tr>
            </tfoot>


        </table>

    </div><!--end six -->


</div>

</div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('app', []);

    app.controller("cartController", function ($scope, $http, $location,$window) {



        $scope.getAll = function () {
            var url = "/getorder";

            $http.get(url, "").then(function (response) {
                    if (response.data.message == "successs") {
                        $scope.carts = response.data;
                    } else {
                        $scope.getResultMessage = "Cannot get cart";
                    }
                }, function (response) {
                    $scope.getResultMessage = "Fail!!!"
                }
            )
        }


        $scope.decrase = function (productid) {
            var url = "/reduceorder/" + productid;



            $http.get(url, "").then(function (response) {
                    if (response.data.message == "successs") {
                        $scope.carts = response.data;
                        $scope.getTotal()
                    } else {
                        $scope.getResultMessage = "Không thể giảm sản phẩm";
                    }
                }, function (response) {
                    $scope.getResultMessage = "Fail!!!"
                }
            )
        }


        $scope.increase = function (productid) {
            var url = "/cartplus/" + productid;



            $http.get(url, "").then(function (response) {
                    if (response.data.message == "successs") {
                        $scope.carts = response.data;
                        $scope.getTotal()
                    } else {
                        $scope.getResultMessage = "Không thể tăng sản phẩm";
                    }
                }, function (response) {
                    $scope.getResultMessage = "Fail!!!"
                }
            )


        }


        $scope.getTotal = function () {
            var url = "/getTotal";
            $http.get(url, "").then(function (response) {
                    if (response.data.message == "successs") {
                        $scope.total = response.data;
                    } else {
                        $scope.total = 0;
                    }
                }
            )
        }


        $scope.delete = function(productid) {
            var url = "/deleteorder/" + productid;



            $http.get(url, "").then(function (response) {
                    if (response.data.message == "Delete success") {
                        $scope.carts = response.data;
                        $scope.getTotal();
                    } else {
                        $scope.getResultMessage = "Không thể xóa sản phẩm";
                    }
                }, function (response) {
                    $scope.getResultMessage = "Xóa sản phẩm lỗi"
                }
            )
        };
        
        
        $scope.checkout = function () {
            var url = "/checkout";
            
            $http.post(url,"").then(function (response) {
                if(response.data.message=="Đặt sản phẩm thành công !! Chúng tôi sẽ liên lạc sớm với bạn"){
                    alert(response.data.message);
                    $window.location.reload();
                }
            })
        }




    });
</script>
<!--end container-->
<!-- end the main content area -->
