<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		
	        	 <div class="navbar-header">
	                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
            	</div>
	        	
	        	<!-- //////////////////////////// 추가된 부분 ////////////////////////////////////// -->
  				<div 	class="collapse navbar-collapse" id="target" 
  							data-hover="dropdown" 
  							data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
				<!-- //////////////////////////// 추가된 부분 ////////////////////////////////////// -->
				           	        	
	            	<!-- Tool Bar 를 다양하게 사용하면.... -->
	                <ul class="nav navbar-nav">
	                
		                <!--  DrowDown 사용 -->
		                <li class="dropdown">
	                        <a  href="#" class="dropdown-toggle" data-toggle="dropdown">
	                            <span>WOMEN</span>
	                            <span class="caret"></span>
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a href="#">TOP</a></li>
	                            <li><a href="#">BOTTOM</a></li>
	                  			<li><a href="#">DRESS</a></li>
	                  		    <li><a href="#">BAG</a></li>
	                            <li><a href="#">ACC</a></li>
	                        </ul>
	                    </li>
	                
	                
	                	  <li class="dropdown">
	                        <a  href="#" class="dropdown-toggle" data-toggle="dropdown">
	                            <span>MEN</span>
	                            <span class="caret"></span>
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a href="#">TOP</a></li>
	                            <li><a href="#">BOTTOM</a></li>
	                  	
	                  		    <li><a href="#">BAG</a></li>
	                            <li><a href="#">ACC</a></li>
	                        </ul>
	                    </li>
	                
	                
	                
	                
	                    <li><a href="#">SALE</a></li>
	                    
	                   
	                </ul>
	                
	                
	            <ul class="nav navbar-nav navbar-right">
	            <li><a href="#">Logout</a></li>
	            </ul>
	
	                <ul class="nav navbar-nav navbar-right">
	                
	                  <c:if test="${sessionScope.user.role == 'user'}">
	                    <li><a href="#">My Info</a></li>
	           
	                    
	                   <li class="dropdown">
	                  <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >My Shopping</span>
		                         <span class="caret"></span>
		                     </a>
		                     
		                  <ul class="dropdown-menu">
	                    <li><a href="#">구매내역조회</a></li>
	                    <li><a href="#">장바구니</a></li>
	           
	                      </ul>
		                </li>
	                    
	                    
	                    
	                    
	                    
	                     </c:if>
	                     
	                       <c:if test="${sessionScope.user.role == 'admin'}">
	                  <li class="dropdown">
	                  <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >판매관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     
		                  <ul class="dropdown-menu">
	                    <li><a href="#">판매상품등록</a></li>
	                     <li class="divider"></li>
	                    <li><a href="#">상품관리</a></li>
	                    <li><a href="#">판매관리</a></li>
	                      </ul>
		                </li>
		                
		                
		                   <li class="dropdown">
	                  <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >회원관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     
		                  <ul class="dropdown-menu">
	                    <li><a href="#">개인정보조회</a></li>
	                    <li><a href="#">회원정보조회</a></li>
	           
	                      </ul>
		                </li>
		        
	                     </c:if>
	               	</ul>
	     
				</div>	       
	       
    		</div>
    	</div>
		
		
		
		
		
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('Logout')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('My Info')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
		
		
		
		
		
	 	$( "a:contains('WOMEN')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		});
		
		
	 	$( "a:contains('구매내역조회')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/purchase/listPurchase");
		});
		
		$( "a:contains('장바구니')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/listCart");
		});
		
		
	 	$( "a:contains('판매상품등록')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/addProductView.jsp;");
		});
		

	 	$( "a:contains('상품관리')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		});
		
 	$( "a:contains('판매관리')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/listProduct?menu=manage");
		});
		
	</script>  