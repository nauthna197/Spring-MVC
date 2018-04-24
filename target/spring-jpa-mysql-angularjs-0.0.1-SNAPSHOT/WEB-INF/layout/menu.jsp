<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
									<li><a href="#">PHẦN ĂN COMBO</a></li>
									<li><a href="#">GÀ RÁN & QUAY</a></li>
									<li><a href="#">THỨC ĂN NHẸ</a></li>
								</ul>
							</li>
							<li><a class="labtops" href="#">NHÀ HÀNG</a></li>
						
							<li><a class="tablets" href="#">KHUYẾN MẠI</a></li>
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
						<a class="cart_dropdown" href="javascript:void(0);"><img src="<%=request.getContextPath()%>/resources/images/icons/cart_icon.png" alt=""> 3 items<span>: $320.00<span></a>
						<div class="cart_content">
							<b class="cart_content_arrow"></b>
							<ul>
								<li class="clearfix">
									<div class="cart_product_name">
										<img src="<%=request.getContextPath()%>/resources/images/photos/dropdown_cart_image.jpg" alt="product image">
										<span>
											<strong><a href="#">product Name Here and long</a></strong><br>
											Color: black<br>
											Size: 36
										</span>
									</div>
									<div class="cart_product_price">
										<span>
											<strong>2x - $130.00</strong><br>
											<a class="remove_item" href="#">Remove</a>
										</span>
									</div>
									<div class="clear"></div>
								</li>

							</ul><!--end ul-->

							<div class="dropdown_cart_info clearfix">
								<div class="cart_buttons">
									<a class="gray_btn" href="/cart">View Cart</a><br>
									<a class="red_btn" href="#">Checkout</a>
								</div><!--end cart buttons-->

								<div class="cart_total_price">
									<span>
										<strong>TOTAL : $1,598.30</strong>
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