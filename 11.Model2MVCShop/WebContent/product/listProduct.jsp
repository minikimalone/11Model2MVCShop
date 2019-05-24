<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="en">
  <head>
	<meta charset="EUC-KR">
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/carousel/">

    <title>Carousel Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
     <!--  /////////////////////// 추가된 CSS , js ///////////////////////////////// -->
		<!-- Bootstrap Dropdown Hover CSS -->
	    <link href="../css/animate.min.css" rel="stylesheet">
	    <link href="../css/bootstrap-dropdownhover.min.css" rel="stylesheet">
       <!-- Bootstrap Dropdown Hover JS -->
	    <script src="../js/bootstrap-dropdownhover.min.js"></script>
		
	
		<!--  //////////////////////////////////////////////////////////////////////////////////// -->
		   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	

			<style>
	        body {
	            padding-top : 70px;
	        }
	        	.dropdown:hover .dropdown-menu {
			/*.dropdown-menu {  */
			    display: block; 
			}
    	</style>	
    	
    	
    	
    	 <script type="text/javascript">

    	 function fncGetList(currentPage) {
    	  
    	  $("#currentPage").val(currentPage)
    	  $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}&category1=${param.category1}").submit();
    	 }
    	 $(function() {
			
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
    	 
    	  function fncOrderByLowPrice(currentPage) {
    	  $("#currentPage").val(currentPage)
    	  $("#orderByHighPrice").val('0')
    	  $("#orderByLowPrice").val('1')
    	  $("#orderByProdNo").val('0')
    	  $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}&category1=${param.category1}").submit(); 
    	  }
    	  
    	  function fncOrderByHighPrice(currentPage) {
    	   $("#currentPage").val(currentPage)
    	   $("#orderByLowPrice").val('0')
    	   $("#orderByHighPrice").val('1')
    	   $("#orderByProdNo").val('0')
    	   $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}&category1=${param.category1}").submit(); 
    	   }
    	  
    	  function fncOrderByProdNo(currentPage) {
    	   $("#currentPage").val(currentPage)
    	   $("#orderByProdNo").val('1')
    	   $("#orderByLowPrice").val('0')
    	   $("#orderByHighPrice").val('0')
    	   $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}&category1=${param.category1}").submit(); 
    	   }
    	 
    	 
    	  $(function() {
    		  var productList=[];
    		 
    		  $.ajax( 
    					{
    						url : "/product/json/getProductName",
    						method : "GET" ,
    						dataType : "json" ,
    						headers : {
    							"Accept" : "application/json",
    							"Content-Type" : "application/json"
    						},
    		  
    		  
    						success : function(JSONData) {
    		  
    		/*
    							$.each(productList,function(index,value){
    			
    			
    						}
    		*/					
    						  $("#searchKeyword").autocomplete({
    							  source: JSONData
    						  });
    						}

    		});
    		  
    		  
    		
    	    
    	    $( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
    	    $("h7").css("color" , "red");
    	    $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");  
    	    
    	    $("h2").on("click" , function() {
    	     var menu ="${param.menu}";
    	     //alert(menu);
    	     if( menu=='manage'){ 
    	     self.location ="/product/updateProductView?prodNo="+$(this).children("#prodNom").text().trim()+"&menu=manage";
    	     } else{

    	    self.location ="/product/getProduct?prodNo="+$(this).children("#prodNos").text().trim()+"&menu=search";
    	     }
    	      });
    	  
    	  }); 
    		  
 
    	  
    	</script>
    	</head>
<!-- NAVBAR
================================================== -->
  <body>
  	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	

    <!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container">
	
		<div class="page-header text-info">
	       <h3> </h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${! empty search.searchCondition&&search.searchCondition.equals('0') ? 'selected' : ''}>상품번호</option>
   						 <option value="1" ${! empty search.searchCondition&&search.searchCondition.equals('1') ? 'selected' : ''}>상품명</option>
    						<option value="2" ${! empty search.searchCondition&&search.searchCondition.equals('2') ? 'selected' : ''}>가격 </option></select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">Search</button>
				  <br><br><br>
				   
				  <div class="form-group">
				  <input type="hidden" id="orderByProdNo" name="orderByProdNo" value="${! empty search.orderByProdNo?search.orderByProdNo : "1"}"/>

      		<a href="javascript:fncOrderByProdNo('1');">상품명순</a><tr>
   

<input type="hidden" id="orderByLowPrice" name="orderByLowPrice" value="${! empty search.orderByLowPrice?search.orderByLowPrice : "0"}"/>

      <a href="javascript:fncOrderByLowPrice('1');">낮은가격순</a>
     
  
 <input type="hidden" id="orderByHighPrice" name="orderByHighPrice" value="${! empty search.orderByHighPrice?search.orderByHighPrice : "0"}"/>

      <a href="javascript:fncOrderByHighPrice('1');">높은가격순</a>
   
				   </div>
				  
				  
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
      <table class="table table-hover table-striped" >
      

    <div class="container marketing">

      <div class="row">
      		  <c:forEach var="product" items="${list}">
 <div class="col-lg-4" >
      
    
		  <c:set var="i" value="0" />

			<c:set var="i" value="${ i+1 }" />
			
		<img class="img-circle" src="/images/uploadFiles/${product.fileName}" alt="Generic placeholder image" width="140" height="140">
         <h2>${product.prodName}<div id=prodNos style="display:none">${product.prodNo}</div></h2>
         <p>${product.prodDetail}</p>
         <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        
		
          </c:forEach>
  

</div>

      <!-- FOOTER -->
      <footer>
        <p class="pull-right" role="button"><a href="#"> back to top </a></p>

      </footer>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
