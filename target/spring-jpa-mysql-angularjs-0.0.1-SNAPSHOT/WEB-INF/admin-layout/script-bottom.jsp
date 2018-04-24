<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- jQuery -->
<script
        src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
        src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
        src="<%=request.getContextPath()%>/resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script
        src="<%=request.getContextPath()%>/resources/vendor/raphael/raphael.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/vendor/morrisjs/morris.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script
        src="<%=request.getContextPath()%>/resources/dist/js/sb-admin-2.js"></script>

<!-- DataTables JavaScript -->
<script
        src="<%=request.getContextPath()%>/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>
<script>
    $(() = > {
        $("#locales"
    ).change(() = > {
        let selectedOption = $('#locales').val();
    let path = window.location.pathname;
    let url = path + '?language=';
    if (selectedOption !== '') {
        $.get(url + selectedOption, () = > {
            location.reload();
    })
        ;
    }
    })
    ;
    })
    ;
</script>