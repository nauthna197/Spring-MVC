    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
        <div class="container">
        <div class="sixteen columns">

        <div id="slide_outer">
        <div class="mainslide">

        <div class="pagers center">
        <a class="prev slide_prev" href="#prev">Prev</a>
        <a class="nxt slide_nxt" href="#nxt">Next</a>
        </div>

        <ul class="cycle-slideshow clearfix"
        data-cycle-fx="scrollHorz"
        data-cycle-timeout="2000"
        data-cycle-slides="> li"
        data-cycle-pause-on-hover="true"
        data-cycle-prev="div.pagers a.slide_prev"
        data-cycle-next="div.pagers a.slide_nxt"
        >
        <li class="clearfix">
        <div class="slide_img">
        <img src="<%=request.getContextPath()%>/resources/images/icons/pep.jpg" alt="">
        </div>
        <div class="flex-caption">
        <h5>PEPSI (LỚN)</h5>
        <p>
        Lớn hơn uống đã hơn
        </p>
        <p>
        Áp dụng cho tất cả đơn order.
        </p>
        <a href="#"><span>Xem sản phẩm</span><span class="shadow">+−
        17.000 VNĐ</span></a>
        </div>
        </li>

        <li class="clearfix">
        <div class="slide_img">
        <img src="<%=request.getContextPath()%>/resources/images/icons/kem1.jpg" alt="">
        </div>
        <div class="flex-caption">
        <h5>KEM SUNDAE KFC<br></h5>
        <p>
        Kem Sundae KFC

        </p>
        <p>
        Món Ăn Này Không Áp Dụng Giao Hàng Tận Nơi.
        </p>
        <a href="#"><span>Xem sản phẩm</span><span class="shadow">+−
        12.000 VNĐ</span></a>
        </div>
        </li>

        <li class="clearfix">
        <div class="slide_img">
        <img src="<%=request.getContextPath()%>/resources/images/icons/milo.jpg" alt="">
        </div>
        <div class="flex-caption">
        <h5>MILO (1 LY)</h5>
        <p>
        Milo (1 ly)
        Nestlé MILO cùng công thức cải tiến ACTIV-GO chiết xuất mầm lúa mạch, vitamin và khoáng chất mới, mang lại giá
        trị dinh dưỡng thiết yếu, cung cấp năng lượng bền bỉ để trẻ năng động và vươn xa hơn.
        </p>
        <p>
        Thành phần

        Nước, sữa bột tách kem (skimmed milk powder), đường, Protomalt 2.4% (chiết xuất từ mầm lúa mạch), sirô glucose,
        bột cacao, dầu bơ, dầu thực vật, bột whey, chất ổn định 471, 407, 401, các khoáng chất (magnesi cacbonat,
        dicaclci phosphat, dinatri phosphat, sắt pyrophosphat) chất nhũ hóa 322 (i) – chiết xuất từ đậu nành (soya
        lecithin), các vitamin (nicacin, biotin, canxi pantothenat, vitamin b6, B1, B2), chất tạo ngọt tổng hợp 950, 955
        và hương vani tổng hợp.
        </p>
        <a href="#"><span>Xem sản phẩm</span><span class="shadow">20.000 VNĐ</span></a>
        </div>
        <li class="clearfix">
        <div class="slide_img">
        <img src="<%=request.getContextPath()%>/resources/images/icons/kemsua.png" alt="">
        </div>
        <div class="flex-caption">
        <h5>KEM SỮA CHEESECAKE KACCHIATO RED VELVET</h5>
        <p>
        XIN MỜI BẠN THỬ, MỘT NGỤM KACCHIATO RED VELVET!
        Cảm giác đầu tiên khi vừa thử ngụm đầu tiên Kem sữa Kacchiato Red Velvet chính là cảm giác sung sướng nhất trước
        giờ. Vị ngọt đậm đà của bánh phô mai Red Velvet, beo béo lớp kem sữa thơm lừng, sẽ khiến bạn mê quên lối về. Chỉ
        33k/ly thôi, còn ngại gì không thử ngay một ly Kacchiato Red Velvet của KFC!
        </p>

        <a href="#"><span>Xem sản phẩm</span><span class="shadow">20.000 VNĐ</span></a>
        </div>

        </li>
        </ul>
        </div>
        <div class="shadow_left"></div>
        <div class="shadow_right"></div>
        </div>

        </div>
        </div><!-- container -->