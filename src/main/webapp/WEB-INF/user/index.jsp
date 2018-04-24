<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body ng-app="app">
<div class="container" ng-controller="cartController">


    <div class="featured">
        <div class="box_head">
            <h3>Phần ăn Combo</h3>
            <div class="pagers center">
                <a class="prev featuredPrev" href="#">Prev</a>
                <a class="nxt featuredNxt" href="#">Next</a>
            </div>
        </div><!--end box_head -->


        <div class="cycle-slideshow"
             data-cycle-fx="scrollHorz"
             data-cycle-timeout=0
             data-cycle-slides="> ul"
             data-cycle-prev="div.pagers a.featuredPrev"
             data-cycle-next="div.pagers a.featuredNxt"
        >
            <ul class="product_show">
                <li class="column">
                    <div class="img">
                        <div class="offer_icon"></div>
                        <div class="hover_over">
                            <a class="link" href="#">link</a>
                            <a class="cart" href="#">cart</a>
                        </div>
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/images/icons/TEEN.jpg" alt="product">
                        </a>
                    </div>
                    <h6><a href="#">Combo 3 Người</a></h6>
                    <h5>199.000 VNĐ</h5>
                </li>
                <li class="column">
                    <div class="img">
                        <div class="offer_icon"></div>
                        <div class="hover_over">
                            <a class="link" href="#">link</a>
                            <a class="cart" href="#">cart</a>
                        </div>
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/images/icons/cb2.png" alt="product">
                        </a>
                    </div>
                    <h6><a href="#">Combo 3 Người</a></h6>
                    <h5>199.000 VNĐ</h5>
                </li>
                <li class="column">
                    <div class="img">
                        <div class="offer_icon"></div>
                        <div class="hover_over">
                            <a class="link" href="#">link</a>
                            <a class="cart" href="#">cart</a>
                        </div>
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/images/icons/cb1.png" alt="product">
                        </a>
                    </div>
                    <h6><a href="#">Combo KIDDIE </a></h6>
                    <h5>199.000 VNĐ</h5>
                </li>
                <li class="column">
                    <div class="img">
                        <div class="hover_over">
                            <a class="link" href="#">link</a>
                            <a class="cart" href="#">cart</a>
                        </div>
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/images/icons/tt.jpg" alt="product">
                        </a>
                    </div>
                    <h6><a href="#">Combo Gà Rán B</a></h6>
                    <h5>81.000 VNĐ</h5>
                </li>
            </ul>
            <ul class="product_show">
                <li class="column">
                    <div class="img">
                        <div class="hover_over">
                            <a class="link" href="#">link</a>
                            <a class="cart" href="#">cart</a>
                        </div>
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/images/icons/BF1.png" alt="product">
                        </a>
                    </div>
                    <h6><a href="#">Phần Ăn XL</a></h6>
                    <h5>99.000 VNĐ</h5>
                </li>
                <li class="column">
                    <div class="img">
                        <div class="offer_icon"></div>
                        <div class="hover_over">
                            <a class="link" href="#">link</a>
                            <a class="cart" href="#">cart</a>
                        </div>
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/images/icons/2.jpg" alt="product">
                        </a>
                    </div>
                    <h6><a href="#">Combo Gà Rán A</a></h6>
                    <h5>81.000 VNĐ</h5>
                </li>
                <li class="column">
                    <div class="img">
                        <div class="offer_icon"></div>
                        <div class="hover_over">
                            <a class="link" href="#">link</a>
                            <a class="cart" href="#">cart</a>
                        </div>
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/images/icons/tt.jpg" alt="product">
                        </a>
                    </div>
                    <h6><a href="#">Combo Gà Rán B</a></h6>
                    <h5>81.000 VNĐ</h5>
                </li>
                <li class="column">
                    <div class="img">
                        <div class="hover_over">
                            <a class="link" href="#">link</a>
                            <a class="cart" href="#">cart</a>
                        </div>
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/images/icons/cb5.jpg" alt="product">
                        </a>
                    </div>
                    <h6><a href="#">COMBO FAMILY MEAL 3</a></h6>
                    <h5>+−
                        250.000 VNĐ</h5>
                </li>
            </ul>
        </div>
    </div><!--end featured-->


    <div class="latest">

        <div class="box_head">
            <h3>Phần ăn đặc biệt</h3>
            <div class="pagers center">
                <a class="prev latest_prev" href="">Prev</a>
                <a class="nxt latest_nxt" href="">Next</a>
            </div>
        </div><!--end box_head -->

        <div class="cycle-slideshow"
             data-cycle-fx="scrollHorz"
             data-cycle-timeout=0
             data-cycle-slides="> ul"
             data-cycle-prev="div.pagers a.latest_prev"
             data-cycle-next="div.pagers a.latest_nxt"
        >

            <c:forEach items="${listProduct}" var="product" varStatus="itr">
            <c:if test="${(itr.count==1)||(itr.count%5==0)}">
            <ul class="product_show">
                </c:if>
                <li class="column">
                    <div class="img">
                        <div class="hover_over">
                            <a class="link" href="#">link</a>
                            <a class="cart" href="/ordernow/${product.id}" >cart</a>
                        </div>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/productImage?id=${product.id}"  alt="product">
                        </a>

                    </div>
                    <h6><a href="#">${product.name}</a></h6>
                    <h5><fmt:formatNumber type="currency" pattern="###,###">${product.price}</fmt:formatNumber> VND</h5>
                </li>
                    <c:if test="${itr.count%4==0}">
                    </ul>
                    </c:if>
                </c:forEach>
        </div>
    </div><!--end latest-->


    <div class="sixteen columns clearfix">
        <div class="ten columns alpha">
            <div class="welcome">
                <div class="clearfix">
                    <h2>KFC-AMT Fast Food</h2>
                    <p>
                        KFC-AMT là cụm từ viết tắt của Kentucky Fried Chicken - (Anh Mạnh Tú) - Gà Rán Kentucky, một
                        trong các thương hiệu thuộc Tập đoàn Yum Brands Inc (Hoa Kỳ). KFC chuyên về các sản phẩm gà rán
                        và nướng, với các món ăn kèm theo và các loại sandwiches chế biến từ thịt gà tươi. Hiện nay đang
                        có hơn 20.000 nhà hàng KFC tại 109 quốc gia và vùng lãnh thổ trên toàn thế giới.
                    </p>
                    <p>
                        KFC-AMT nổi tiếng thế giới với công thức chế biến gà rán truyền thống Original Recipe, được tạo
                        bởi cùng một công thức pha trộn bí mật 11 loại thảo mộc và gia vị khác nhau do Đại tá Harland
                        Sanders hoàn thiện hơn nửa thế kỷ trước. Ngoài thực đơn gà rán, KFC còn đa dạng hóa sản phẩm tạo
                        nên thực đơn vô cùng phong phú dành cho người tiêu dùng trên toàn thế giới có thể thưởng thức
                        hơn 300 món ăn khác nhau từ món gà nướng tại thị trường Việt Nam cho tới sandwich cá hồi tại
                        Nhật Bản.
                    </p>
                    <h4>Chúng tôi thanh toán:</h4>
                    <ul>
                        <li><a class="bank" href="#">text</a></li>
                        <li><a class="card" href="#">text</a></li>
                        <li><a class="order" href="#">text</a></li>
                        <li><a class="paypal" href="#">text</a></li>
                        <li><a class="discover" href="#">text</a></li>
                    </ul>
                </div>
            </div><!--end welcome-->
        </div><!--end ten-->

        <div class="six columns omega">
            <div class="home_news">
                <h3>Lịch sử hình thành</h3>
                <div class="acc">
                    Gà rán Kentucky (KFC), nhãn hiệu được tiên phong bởi ông Harland Sanders, đã phát triển và trở thành
                    một trong những hệ thống phục vụ thức ăn nhanh lớn nhất trên thế giới, với hơn 1 tỉ bữa ăn tối KFC
                    được phục vụ hàng năm trên hơn 80 quốc gia khác nhau. Nhưng để có được thành công như vậy thì không
                    phải dễ dàng.
                </div>


                <h3>Tìm cửa hàng gần nhất</h3>
                <div class="acc">
                    <p>

                        <option data-name="ho-chi-minh" value="1">Hồ Chí Minh</option>
                        <option data-name="ha-noi" value="2">Hà Nội</option>
                        <option data-name="hai-duong" value="55">Hải Dương</option>
                        <option data-name="hai-phong" value="3">Hải Phòng</option>
                        <option data-name="quang-ninh" value="66">Quảng Ninh</option>
                        <option data-name="nghe-an" value="28">Nghệ An</option>
                        <option data-name="hue" value="5">Huế</option>
                        <option data-name="da-nang" value="4">Đà Nẵng</option>
                        <option data-name="binh-dinh" value="52">Bình Định</option>
                        <option data-name="khanh-hoa" value="50">Khánh Hòa</option>
                        <option data-name="binh-thuan" value="53">Bình Thuận</option>
                        <option data-name="dak-lak" value="6">Đắk Lắk</option>
                        <option data-name="binh-duong" value="7">Bình Dương</option>
                        <option data-name="dong-nai" value="8">Đồng Nai</option>
                        <option data-name="vung-tau" value="9">Vũng Tàu</option>
                        <option data-name="an-giang" value="51">An Giang</option>
                        <option data-name="can-tho" value="11">Cần Thơ</option>
                        <option data-name="kien-giang" value="54">Kiên Giang</option>
                        <option data-name="thanh-hoa" value="954">Thanh Hóa</option>
                        <option data-name="ben-tre" value="1069">Bến Tre</option>
                        <option data-name="nam-dinh" value="1072">Nam Định</option>
                        </select>
                    </p>
                </div>
                <h3>Nhận thông báo ngay</h3>
                <div class="acc">
                    <p>

                        Hãy nhập Email của bạn để chúng tôi giúp bạn có những thông tin mới nhất. Các chương trình ưu
                        đãi khuyến mại mà bạn nhận được nhé !
                    </p>
                    <form method="get" action="#" class="clearfix">
                        <label>
                            <input type="text" name="newslatter" placeholder="Nhập Email của bạn" value="">
                        </label>
                        <label>
                            <input class="gray_btn" type="submit" name="submit" value="Gửi">
                        </label>
                    </form>
                </div>
            </div><!--end home_news-->
        </div><!--end six-->
    </div>

</div><!--end home_news-->
</div>
<!--end six-->
</body>