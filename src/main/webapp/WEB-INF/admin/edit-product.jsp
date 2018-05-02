<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="page-wrapper">
    <div class="row">
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
                            <form:form method="post" commandName="productInfo" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label>Tên</label>
                                    <form:input path="name" class="form-control"
                                                placeholder="Nhập vào tên sản phẩm"/>
                                    <p class="help-block">
                                        <form:errors path="name" cssClass="text-danger"/>
                                    </p>
                                    <label>Giá</label>
                                    <form:input path="price" class="form-control"
                                                placeholder="Nhập vào giá" type="number"/>
                                    <p class="help-block">
                                        <form:errors path="price" cssClass="text-danger"/>
                                    </p>
                                    <label>Chọn danh mục</label>
                                    <form:select path="categoryBean.categoryId"
                                                 class="form-control">
                                        <form:options items="${lstCategory}" itemValue="categoryId"
                                                      itemLabel="name"></form:options>
                                    </form:select>

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