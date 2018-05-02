<%--
  Created by IntelliJ IDEA.
  User: CPN63TNH
  Date: 4/23/2018
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Thống kê doanh thu theo 7 ngày gần nhất
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
                    <script type="text/javascript">
                        window.onload = function () {

                            var dataPoints = [];

                            var chart = new CanvasJS.Chart("chartContainer", {
                                animationEnabled: true,
                                theme: "light2",
                                title: {
                                    text: "Thống kê doanh thu 7 ngày gần nhất"
                                },
                                axisY: {
                                    title: "Đơn vị",
                                    titleFontSize: 24
                                },
                                data: [{
                                    type: "column",
                                    yValueFormatString: "#,### VND",
                                    dataPoints: dataPoints
                                }]
                            });

                            $.getJSON("http://localhost:8080/admin/moneychart", function (data) {
                                    for (var i = 0; i < data.length; i++) {
                                        dataPoints.push({
                                            x: new Date(data[i].date),
                                            y: data[i].money
                                        });

                                    }
                                    chart.render();

                                }
                            )

                        }

                    </script>

                    <!-- /.table-responsive -->
                    <div id="chartContainer" style="height: 370px; width: 50%; margin: auto"></div>
                    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
                    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>


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

