<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="sixteen columns">

        <div id="pageName">
            <div class="name_tag">
                <p>
                    You're Here :: <a href="#">home</a> :: Login Or Create a New Account
                </p>
                <div class="shapLeft"></div>
                <div class="shapRight"></div>
            </div>
        </div><!--end pageName-->

    </div>
</div>
<!-- container -->

<!-- strat the main content area -->

<div class="container" ng-app="app">

    <div id="user_log" class="clearfix" ng-controller="dangky">

        <div class="nine columns">
            <div class="register">
                <div class="box_head">
                    <h3>Đăng ký tài khoản mới</h3>
                </div><!--end box_head -->

                <h6>Đã có tài khoản , đăng nhập bên phải .</h6>

                <form name="userForm" ng-submit="insert(userForm.validate.$valid)">
                    <ol>
                        <span ng-show="userForm.myName.$valid  && userForm.myName.$dirty ">Bạn cần nhập đầy đủ thông tin</span>
                        <li class="row clearfix">
                            <label class="input_tag" for="firstName">Họ và tên <em>*</em></label>
                            <div class="inputOuter">
                                <input  id="firstName" type="text" name="validate" value=""
                                       placeholder="Họ và tên" ng-model="fullname"  required/>

                            </div>

                        </li>
                        <li class="row clearfix">
                            <label class="input_tag" for="email">Email <em>*</em></label>
                            <div class="inputOuter">
                                <input  ng-model="email" id="email" type="email"  name="validate" value=""
                                       placeholder="example@gmail.com" required/>

                            </div>


                        </li>
                        <li class="row clearfix">
                            <label class="input_tag" for="email">Số điện thoại <em>*</em></label>
                            <div class="inputOuter">
                                <input  id="email" type="text" name="validate" value=""
                                       placeholder="Số điện thoại" ng-model="number" required />

                            </div>

                        </li>
                        <li class="row clearfix">
                            <label class="input_tag" for="fax">Địa chỉ<em>*</em></label>
                            <div class="inputOuter">
                                <input ng-model="address" id="fax" type="text" name="validate" value="" placeholder="Địa chỉ" required/>
                            </div>

                        </li>

                        <li class="row clearfix">
                            <label class="input_tag" for="newsletter">Giới tính <em>*</em></label>
                            <div class="inputOuter">
                                    <input id="radio1" type="radio" name="newsletter" ng-model="gender" value="1">
                                    <label for="radio1">Nam</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input id="radio2" type="radio" name="newsletter" ng-model="gender" value="2">
                                    <label for="radio2">Nữ</label>
                                </select>
                            </div>
                        </li>
                    </ol>

                    <ol>
                        <li class="row clearfix">
                            <label class="input_tag" for="companyId">Tên tài khoản</label>
                            <div class="inputOuter">
                                <input ng-model="username" id="companyId" type="text" name="validate" value=""
                                       placeholder="Tên tài khoản" required/>
                            </div>
                        </li>

                        <li class="row clearfix">
                            <label class="input_tag" for="chPass">Mật khẩu <em>*</em></label>
                            <div class="inputOuter">
                                <input ng-model="password" id="chPass" type="password" name="validate" value=""
                                       placeholder="**************" required/>
                            </div>
                        </li>
                        <p class="help-block">
                        </p>
                    </ol>

                    <ol>
                        <li class="row clearfix">
                            <label class="input_tag" for="firstName">&nbsp;</label>
                            <div class="inputOuter button">
                                <button type="submit" class="red_btn"> Đăng ký tài khoản</button>
                            </div>
                        </li>
                    </ol>
                </form>
                <c:if test="${!empty message}">
                    <div style="color: #830605">
                        <strong>${message}</strong></div>
                </c:if>
            </div>
        </div><!--end nine-->


        <div class="seven columns">
            <div class="login">
                <div class="box_head">
                    <h3>Login</h3>
                </div><!--end box_head -->

                <h6>Không có tài khoản ? Đăng ký bên trái</h6>

                <form:form method="post" commandName="user"
                           action="/login">
                    <ol>
                        <li class="row clearfix">
                            <label class="input_tag" for="mail">Tên tài khoản <em>*</em></label>
                            <div class="inputOuter">
                                <form:input id="mail" type="text" name="mail" path="username"
                                            placeholder="Tên tài khoản"></form:input>
                            </div>
                        </li>
                        <li class="row clearfix">
                            <label class="input_tag" for="pass">Mật khẩu<em>*</em></label>
                            <div class="inputOuter">
                                <form:input id="pass" path="password" type="password" name="" value=""
                                            placeholder="**********"></form:input>
                            </div>
                        </li>
                        <li class="row clearfix">
                            <label class="input_tag" for="firstName">&nbsp;</label>
                            <div class="inputOuter button">
                                <form:button class="red_btn" type="submit">Login</form:button>
                            </div>
                        </li>
                    </ol>
                </form:form>
                <c:if test="${!empty message}">
                    <div style="color: #830605">
                        <strong>${message}</strong></div>
                </c:if>


            </div><!--end login-->


            <%--<div class="account_list">

                <div class="box_head">
                    <h3>Account</h3>
                </div><!--end box_head -->

                <ul>
                    <li><a href="#">Account</a></li>
                    <li><a href="#">Edit Account</a></li>
                    <li><a href="#">Password</a></li>
                    <li><a href="#">Wish List</a></li>
                    <li><a href="#">Order History</a></li>
                    <li><a href="#">DownLoads</a></li>
                    <li><a href="#">Returns</a></li>
                    <li><a href="#">Transactions</a></li>
                    <li><a href="#">Newslatter</a></li>
                    <li><a href="#">Logout</a></li>
                </ul>

            </div><!--end account_list-->--%>

        </div><!--end seven-->

    </div><!--end user_log-->
</div>
<script src="<%=request.getContextPath()%>/resources/js-user/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('app', []);

    app.controller("dangky", function ($scope, $http, $location) {
        $scope.model = "";



        $scope.insert = function (items) {


            var url ="/register";

            var data = {
                address: $scope.address,
                email: $scope.email,
                fullname: $scope.fullname,
                gender: $scope.gender,
                number: $scope.number,
                username: $scope.username,
                password: $scope.password,
                role : 3

            };

            if(items){
                $http.post(url,data, "").then(function (response) {
                        if (response.data.message == "Success") {
                            alert("Đăng ký thành công");
                            $scope.userForm.setUntouched();
                            $scope.userForm.$setPristine();
                        } else {
                            alert("Đăng ký thất bại")
                        }
                    }, function(response) {
                        $scope.getResultMessage = "Fail!";
                    }
                )
            }else{
                alert("Bạn cần nhập đầy đủ thông tin");
            }


        }



    });
</script>
