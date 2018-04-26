<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <a href="/admin/product/add">
                <button style="background-color: #1ab7ea;color: #fef9ff;border: none;border-radius: 3px;text-align: center;
    text-decoration: none; font-size:30px;
    display: inline-block;  ">
                    <i class="material-icons" style="font-size:30px;color: #f3faff">add</i>
                    Thêm sản phẩm </button>
            </a>
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
                            <th style="width: 80px !important;">STT</th>
                            <th style="width: 70px !important;">Sửa</th>
                            <th style="width: 70px !important;">Xóa</th>
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
                                <td><a href="admin/product/edit/${item.id}">
                                    <button style="background-color: #1ab7ea;color: #fef9ff;border: none;border-radius: 8px;text-align: center;
    text-decoration: none;
    display: inline-block;">
                                        <i class="material-icons" style="font-size:24px;color:#fef9ff">border_color</i>
                                    </button>
                                </a></td>
                                <td><a
                                        href="admin/product/delete/${item.id}">
                                    <button style="color: #fef9ff;border: none;border-radius: 8px;text-align: center;
    text-decoration: none;
    display: inline-block;">
                                        <i class="material-icons" style="font-size:25px;color:#ff4a00">delete_sweep</i>
                                    </button>
                                </a></td>
                                <td>${item.name}</td>
                                <td>${item.price}</td>
                                <td>${item.categoryBean.name}</td>
                                <td><img
                                        src="${pageContext.request.contextPath}/admin/product/productImage?id=${item.id}"
                                        width="50" height="50"/></td>
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