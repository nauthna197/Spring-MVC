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
                Thống kê món ăn trong tháng
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

                            var dps = [];
                            var sum =0;

                            $.getJSON("http://localhost:8080/admin/chart/month", function (data) {
                                    for (var i = 0; i < data.length; i++) {
                                        dps.push({
                                            label: data[i].name,
                                            name: data[i].name,
                                            y: data[i].count
                                        });
                                        sum = sum + data[i].count;
                                    }
                                    chart.render();

                                }
                            )

                            var chart = new CanvasJS.Chart("chartContainer", {
                                theme: "light2", // "light1", "dark1", "dark2"
                                exportEnabled: true,
                                animationEnabled: true,
                                title: {
                                    text: "Tổng :" + sum
                                },
                                data: [{
                                    type: "pie",
                                    showInLegend: "true",
                                    legendText: "{label}",
                                    indexLabelFontSize: 16,
                                    indexLabel: "{label} - {y}",
                                    dataPoints: dps
                                }]
                            });


                        }

                    </script>

                    <!-- /.table-responsive -->
                    <div id="chartContainer" style="height: 370px; width: 100%;"></div>

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

