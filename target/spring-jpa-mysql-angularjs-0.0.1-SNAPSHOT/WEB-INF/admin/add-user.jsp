<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Thêm tài khoản</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <c:if test="${!empty message}">
                                <div class="alert alert-danger alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert"
                                            aria-hidden="true">×
                                    </button>
                                        ${message}</div>
                            </c:if>
                            <form:form method="post" commandName="user">
                                <div class="form-group">
                                    <label>Tên đầy đủ</label>
                                    <form:input path="fullname" class="form-control"
                                                placeholder="Enter category name"/>
                                    <p class="help-block">
                                        <form:errors path="fullname" cssClass="text-danger"/>
                                    </p>
                                    <label>Giới tính</label>
                                    <form:select path="gender" class="form-control">
                                        <form:option value="1" label="Name"></form:option>
                                        <form:option value="2" label="Nữ"></form:option>
                                    </form:select>
                                    <p class="help-block">
                                        <form:errors path="gender" cssClass="text-danger"/>
                                    </p>
                                    <label>Số điệnt thoại</label>
                                    <form:input path="number" class="form-control"
                                                placeholder="Enter category name"/>

                                    <p class="help-block">
                                        <form:errors path="number" cssClass="text-danger"/>
                                    </p>
                                    <label> Email</label>
                                    <form:input path="email" class="form-control"
                                                placeholder="Enter category name"/>
                                    <p class="help-block">
                                        <form:errors path="email" cssClass="text-danger"/>
                                    </p>
                                    <label> Địa chỉ</label>
                                    <form:input path="address" class="form-control"
                                                placeholder="Enter category name"/>
                                    <p class="help-block">
                                        <form:errors path="address" cssClass="text-danger"/>
                                    </p>
                                    <label> Tài khoản</label>
                                    <form:input path="username" class="form-control"
                                                placeholder="Enter category name"/>
                                    <p class="help-block">
                                        <form:errors path="username" cssClass="text-danger"/>
                                    </p>
                                    <label> Mật khẩu</label>
                                    <form:input path="password" class="form-control"
                                                placeholder="Enter category name"/>
                                    <p class="help-block">
                                        <form:errors path="password" cssClass="text-danger"/>
                                    </p>
                                    <label>Quyền</label>
                                    <form:select path="role" class="form-control">
                                        <form:option value="1" label="Admin"></form:option>
                                        <form:option value="2" label="Quản lý"></form:option>
                                        <form:option value="3" label="Khách hàng"></form:option>
                                    </form:select>
                                    <p class="help-block">
                                    <form:errors path="role" cssClass="text-danger"/>
                                    </p>

                                </div>
                                <button type="submit" class="btn btn-default">Submit</button>
                                <button type="reset" class="btn btn-default">Reset</button>
                            </form:form>
                        </div>
                        <!-- /.col-lg-6 (nested) -->
                    </div>
                    <!-- /.row (nested) -->
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