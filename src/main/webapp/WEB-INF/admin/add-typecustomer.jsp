<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Thêm nhóm khách hàng
            </h1>
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
                            <form:form method="post" commandName="typeCustomer" action="/admin/typecustomer/add">
                                <div class="form-group">
                                    <form:hidden path="id"></form:hidden>
                                    <label>Tên nhóm khách hàng</label>
                                    <form:input path="name" class="form-control"
                                                placeholder="Nhập tên nhóm khách hàng"/>
                                    <p class="help-block">
                                        <form:errors path="name" cssClass="text-danger"/>
                                    </p>
                                    <label>% Giảm giá</label>
                                    <form:select path="discount" class="form-control">
                                        <form:option value="0">Chọn mức giảm giá</form:option>
                                        <form:option value="10">10%</form:option>
                                        <form:option value="20">20%</form:option>
                                        <form:option value="30">30%</form:option>
                                    </form:select>
                                    <p class="help-block">
                                        <form:errors path="discount" cssClass="text-danger"/>
                                    </p>
                                </div>
                                <button type="submit" class="btn btn-default">
                                    Cập nhật
                                </button>
                                <button type="reset" class="btn btn-default">
                                    Reset
                                </button>
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