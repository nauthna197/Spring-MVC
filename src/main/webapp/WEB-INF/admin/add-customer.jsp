<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Thêm khách hàng</h1>
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
                            <form:form method="post" commandName="customer" action="/admin/customer/add">
                                <div class="form-group">
                                    <form:hidden path="id"></form:hidden>
                                    <label>Họ và tên</label>
                                    <form:input path="fullname" class="form-control"
                                                placeholder="Họ và tên"/>
                                    <p class="help-block">
                                        <form:errors path="fullname" cssClass="text-danger"/>
                                    </p>
                                    <label>Số điện thoại</label>
                                    <form:input path="number" class="form-control"
                                                placeholder="Quê quán"/>
                                    <p class="help-block">
                                        <form:errors path="number" cssClass="text-danger"/>
                                    </p>
                                    <label>Loại khách hàng</label>
                                    <form:select path="typeCustomerBean.id"
                                                 class="form-control">
                                        <form:options items="${lstTypeCustomer}" itemValue="id"
                                                      itemLabel="name"></form:options>
                                    </form:select>
                                    <label>Quê quán</label>
                                    <form:input path="country" class="form-control"
                                                placeholder="Số điện thoại"/>
                                    <p class="help-block">
                                        <form:errors path="country" cssClass="text-danger"/>
                                    </p>
                                    <label>Email</label>
                                    <form:input path="email" class="form-control"
                                                placeholder="Số điện thoại"/>
                                    <p class="help-block">
                                        <form:errors path="email" cssClass="text-danger"/>
                                    </p>

                                    <label>Thẻ căn cước/ CMTND</label>
                                    <form:input path="code" class="form-control"
                                                placeholder="Số điện thoại"/>
                                    <p class="help-block">
                                        <form:errors path="code" cssClass="text-danger"/>
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