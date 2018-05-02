    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
                 pageEncoding="UTF-8" %>
        <div class="container">
        <div class="sixteen columns">
        <div id="mainNav" class="clearfix">
        <nav>
        <ul>
        <li>
        <a class="hasdropdown" href="#">TRANG</a>
        <ul class="submenu">
        <li><a href="index.html">TRANG CHỦ</a></li>
        <li><a href="index2.html">Home 2</a></li>
        <li><a href="about.html">GIỚI THIỆU</a></li>
        <li><a href="blog.html">Blog</a></li>
        <li><a href="blog_post.html">Blog Post</a></li>
        <li><a href="contact.html">Contact</a></li>
        </ul>
        </li>
        <li>
        <a class="desktop hasdropdown" href="#">THỰC ĐƠN</a>
        <ul class="submenu">
        <c:forEach items="${category}" var="product">
        <li><a href="#">${product.name} </a></li>
        </c:forEach>
        </ul>
        </li>
        <li><a class="labtops" href="#">NHÀ HÀNG</a></li>
        <li><a class="tablets" href="/history">LỊCH SỬ ĐẶT HÀNG</a></li>
        <li><a class="software" href="#">THƯ VIỆN ẢNH</a></li>
        <li>
        <a class="watches hasdropdown" href="#">THÀNH VIÊN</a>
        <ul class="submenu">
        <li><a href="#">Test one</a></li>
        <li><a href="#">Test Two</a></li>
        <li><a href="#">Test Three</a></li>
        <li><a href="#">Test Four</a></li>
        <li><a href="#">Test Five</a></li>
        </ul>
        </li>
        </ul>
        </nav><!--end nav-->

        <div id="cart">

        <a class="cart_dropdown" href="javascript:void(0);"><img src="<%=request.getContextPath()%>
        /resources/images/icons/cart_icon.png" alt=""> ${sessionScope.cart.getCount()} sản phẩm <span>  :
        <fmt:formatNumber pattern="###,###"
                          type="currency">${sessionScope.cart.getTotal()}</fmt:formatNumber>
         VND<span> </a>
        <div class="cart_content">
        <b class="cart_content_arrow"></b>
        <c:forEach var="product" items="${sessionScope.cart.items}" varStatus="itr">
            <ul>
            <li class="clearfix">
            <div class="cart_product_name">
            <img src="${pageContext.request.contextPath}/productImage?id=${product.product.id}" alt="product image"
            width="40px">
            <span>
            <strong><a href="#">${product.product.name}</a></strong><br>
            Color: black<br>
            Size: 36
            </span>
            </div>
            <div class="cart_product_price">
            <span>
            <strong>${product.quantity}x -
            <fmt:formatNumber pattern="###,###"
                              type="currency">${product.product.price*product.quantity}</fmt:formatNumber> VND
            </strong><br>
            <a class="remove_item" href="#">Remove</a>
            </span>
            </div>
            <div class="clear"></div>
            </li>
            </ul><!--end ul-->
        </c:forEach>
        <div class="dropdown_cart_info clearfix">
        <div class="cart_buttons">
        <a class="gray_btn" href="/cart">View Cart</a><br>
        <a class="red_btn" href="#">Checkout</a>
        </div><!--end cart buttons-->

        <div class="cart_total_price">
        <span>
        <strong><fmt:formatNumber pattern="###,###"
                                  type="currency">${sessionScope.cart.getTotal()}</fmt:formatNumber>  VND</strong>
        </span>
        </div><!--end cart buttons-->
        </div><!--end dropdown_cart_info-->

        </div><!--end cart_content-->
        </div><!--end cart-->

        </div><!--end main-->
        </div><!--end sixteen-->
        </div><!--end container-->

        </header>
        <!--end header-->