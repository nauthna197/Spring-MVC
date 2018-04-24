<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/logo.jsp" />
<jsp:include page="layout/menu.jsp" />
<jsp:include page="layout/slide.jsp" />
<!-- strat the main content area -->

<jsp:include page="${param.view}"/>


<jsp:include page="layout/footer.jsp" />