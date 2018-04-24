<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SB Admin 2 - Bootstrap Admin Theme</title>
    <jsp:include page="admin-layout/stylesheet.jsp"/>
    <jsp:include page="admin-layout/script.jsp"/>
    <base href="<%=request.getContextPath()%>/"/>
</head>

<body>

<div id="wrapper">

    <jsp:include page="admin-layout/navigation.jsp"/>

    <jsp:include page="${param.view}"/>

</div>
<!-- /#wrapper -->


<jsp:include page="admin-layout/script-bottom.jsp"/>

</body>

</html>