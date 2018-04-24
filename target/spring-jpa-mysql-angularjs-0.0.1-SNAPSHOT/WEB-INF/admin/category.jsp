<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                - <a href="admin/category/add">Thêm danh mục</a>
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
                            <th>#</th>
                            <th>Tên</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${category}" var="item" varStatus="i">
                            <tr class="odd gradeX">
                                <td>${i.count}</td>
                                <td>${item.name}</td>
                                <td class="center"><a
                                        href="admin/category/edit/${item.categoryId}.html">Sửa</a> - <a
                                        href="admin/category/delete/${item.categoryId}.html">Xóa</a></td>
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