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
	        	
	        	<!-- //////////////////////////// �߰��� �κ� ////////////////////////////////////// -->
  				<div 	class="collapse navbar-collapse" id="target" 
  							data-hover="dropdown" 
  							data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
				<!-- //////////////////////////// �߰��� �κ� ////////////////////////////////////// -->
				           	        	
	            	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	                <ul class="nav navbar-nav">
	                
		                <!--  DrowDown ��� -->
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
	                    <li><a href="#">���ų�����ȸ</a></li>
	                    <li><a href="#">��ٱ���</a></li>
	           
	                      </ul>
		                </li>
	                    
	                    
	                    
	                    
	                    
	                     </c:if>
	                     
	                       <c:if test="${sessionScope.user.role == 'admin'}">
	                  <li class="dropdown">
	                  <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >�ǸŰ���</span>
		                         <span class="caret"></span>
		                     </a>
		                     
		                  <ul class="dropdown-menu">
	                    <li><a href="#">�ǸŻ�ǰ���</a></li>
	                     <li class="divider"></li>
	                    <li><a href="#">��ǰ����</a></li>
	                    <li><a href="#">�ǸŰ���</a></li>
	                      </ul>
		                </li>
		                
		                
		                   <li class="dropdown">
	                  <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >ȸ������</span>
		                         <span class="caret"></span>
		                     </a>
		                     
		                  <ul class="dropdown-menu">
	                    <li><a href="#">����������ȸ</a></li>
	                    <li><a href="#">ȸ��������ȸ</a></li>
	           
	                      </ul>
		                </li>
		        
	                     </c:if>
	               	</ul>
	     
				</div>	       
	       
    		</div>
    	</div>
		
		
		
		
		
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('Logout')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('My Info')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
		
		
		
		
		
	 	$( "a:contains('WOMEN')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		});
		
		
	 	$( "a:contains('���ų�����ȸ')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/purchase/listPurchase");
		});
		
		$( "a:contains('��ٱ���')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/listCart");
		});
		
		
	 	$( "a:contains('�ǸŻ�ǰ���')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/addProductView.jsp;");
		});
		

	 	$( "a:contains('��ǰ����')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		});
		
 	$( "a:contains('�ǸŰ���')" ).on("click" , function() {
			
	 		$(self.location).attr("href","/product/listProduct?menu=manage");
		});
		
	</script>  