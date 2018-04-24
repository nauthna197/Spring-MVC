    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
                 pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
        <!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
        <!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
        <!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
        <head>

        <!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <title>KFC-AMT FAST FOOD</title>
        <meta name="description" content="">
        <meta name="author" content="Ahmed Saeed">

        <!-- Mobile Specific Metas
        ================================================== -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- CSS
        ================================================== -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css-user/main.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css-user/home2.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css-user/responsive.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css-user/home.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css-user/cart.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css-user/user_log.css">


        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
        <link rel="stylesheet" type="text/css" href="css/ie8-and-down.css" />
        <![endif]-->

        <!-- Favicons
        ================================================== -->
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico">
        <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/resources/images/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="<%=request.getContextPath()%>
        /resources/images/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="<%=request.getContextPath()%>
        /resources/images/apple-touch-icon-114x114.png">

        </head>
        <body>
        <!--start header-->
        <header>
        <div id="topHeader">
        <div class="container">
        <div class="sixteen columns">
        <ul id="currency">
        <li class="active_currency"><a href="#">$</a></li>
        <li><a href="#">£</a></li>
        <li><a href="#">€</a></li>
        </ul>
        <ul id="lang">
        <li class="active_lang"><a href="#">en</a></li>
        <li><a href="#">es</a></li>
        <li><a href="#">fr</a></li>
        </ul>

        <ul id="topNav">
        <c:if test="${sessionScope.USER!=null}"><li><a>Xin chào ${sessionScope.USER.fullname}</a></li></c:if>
        <c:if test="${sessionScope.USER==null}"><li><a href="/login">Đăng Kí Ngay</a></li></c:if>
        <li><a href="/cart">Danh sách giỏ hàng</a></li>
        <li><a href="cart.html">Giỏ hàng</a></li>
        </ul>
        </div><!--end sixteen-->
        </div><!--end container-->
        </div><!--end topHeader-->