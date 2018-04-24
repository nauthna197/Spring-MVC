<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button>
					</span>
                </div> <!-- /input-group -->
            </li>
            <li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
                Dashboard</a></li>
            <li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
                Charts<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="flot.html">Flot Charts</a></li>
                    <li><a href="morris.html">Morris.js Charts</a></li>
                </ul> <!-- /.nav-second-level --></li>
            <li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
                Tables</a></li>
            <li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
                Forms</a></li>
            <li><a href="#"><i class="fa fa-wrench fa-fw"></i> Quản lý cửa hàng<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="admin/product/">Quản lý sản phẩm</a></li>
                    <li><a href="admin/category/">Quản lý danh mục</a></li>
                    <li><a href="admin/emp/">Quản lý nhân viên</a></li>
                </ul>
            <li><a href="/admin/user/"><i class="fa fa-wrench fa-fw"></i> Quản lý tài khoản</a>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->