<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                - <a href="admin/product/add">Thêm sản phẩm</a>
            </h1>
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
                            <th>Tên</th>
                            <th>Giá</th>
                            <th>Danh mục</th>
                            <th>Ảnh</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${product}" var="item" varStatus="i">
                            <tr class="odd gradeX">
                                <td>${i.count}</td>
                                <td>${item.name}</td>
                                <td>${item.price}</td>
                                <td>${item.categoryBean.name}</td>
                                <td><img
                                        src="${pageContext.request.contextPath}/admin/product/productImage?id=${item.id}"
                                        width="50" height="50"/></td>
                                <td class="center"><a
                                        href="admin/product/edit/${item.id}">Sửa</a> - <a
                                        href="admin/product/delete/${item.id}">Xóa</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- /.table-responsive -->

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