<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                - <a href="admin/emp/add">Thêm nhân viên</a>
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
                            <th>Tên đầy đủ</th>
                            <th>Giới tính</th>
                            <th>Số điện thoại</th>
                            <th>Quê quán</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${emp}" var="item" varStatus="i">
                            <tr class="odd gradeX">
                                <td>${i.count}</td>
                                <td>${item.fullname}</td>
                                <td><c:if test="${item.gender==1}">Nam</c:if>
                                    <c:if test="${item.gender==2}">Nữ</c:if>
                                </td>
                                <td>${item.number}</td>
                                <td>${item.country}</td>
                                <td class="center"><a
                                        href="admin/emp/edit/${item.id}">Sửa</a> - <a
                                        href="admin/emp/delete/${item.id}">Xóa</a></td>
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