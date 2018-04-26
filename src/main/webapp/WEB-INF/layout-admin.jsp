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
    <script type="text/javascript">
        window.onload = function () {

            var dataPoints = [];

            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                theme: "light2",
                title: {
                    text: "Thống kê bán hàng 7 ngày gần nhất"
                },
                axisY: {
                    title: "Đơn vị",
                    titleFontSize: 24
                },
                data: [{
                    type: "column",
                    yValueFormatString: "#,### Units",
                    dataPoints: dataPoints
                }]
            });

            $.getJSON("http://localhost:8080/admin/date", function (data) {
                    for (var i = 0; i < data.length; i++) {
                        dataPoints.push({
                            x: new Date(data[i].date),
                            y: data[i].count
                        });

                    }
                    chart.render();

                }
            )

        }


    </script>


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