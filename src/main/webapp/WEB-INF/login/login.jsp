<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link
            href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link
            href="<%=request.getContextPath()%>/resources/vendor/metisMenu/metisMenu.min.css"
            rel="stylesheet">

    <!-- Custom CSS -->
    <link
            href="<%=request.getContextPath()%>/resources/dist/css/sb-admin-2.css"
            rel="stylesheet">

    <!-- Custom Fonts -->
    <link
            href="<%=request.getContextPath()%>/resources/vendor/font-awesome/css/font-awesome.min.css"
            rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <base href="<%=request.getContextPath()%>/">
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <c:if test="${!empty message}">
                        <div class="alert alert-danger alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert"
                                    aria-hidden="true">×
                            </button>
                                ${message}</div>
                    </c:if>
                    <form:form method="post" commandName="user"
                               action="admin/login">
                        <fieldset>
                            <div class="form-group">
                                <form:input path="username" class="form-control"
                                            placeholder="Username"/>
                            </div>
                            <div class="form-group">
                                <form:input path="password" class="form-control"
                                            placeholder="Password" type="password"/>
                            </div>
                            <button class="btn btn-lg btn-success btn-block">Login</button>
                        </fieldset>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script
        src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
        src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
        src="<%=request.getContextPath()%>/resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script
        src="<%=request.getContextPath()%>/resources/dist/js/sb-admin-2.js"></script>

</body>

</html>