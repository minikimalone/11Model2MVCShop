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
    	  $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
    	 }
    	  function fncOrderByLowPrice(currentPage) {
    	  $("#currentPage").val(currentPage)
    	  $("#orderByHighPrice").val('0')
    	  $("#orderByLowPrice").val('1')
    	  $("#orderByProdNo").val('0')
    	  $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit(); 
    	  }
    	  
    	  function fncOrderByHighPrice(currentPage) {
    	   $("#currentPage").val(currentPage)
    	   $("#orderByLowPrice").val('0')
    	   $("#orderByHighPrice").val('1')
    	   $("#orderByProdNo").val('0')
    	   $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit(); 
    	   }
    	  
    	  function fncOrderByProdNo(currentPage) {
    	   $("#currentPage").val(currentPage)
    	   $("#orderByProdNo").val('1')
    	   $("#orderByLowPrice").val('0')
    	   $("#orderByHighPrice").val('0')
    	   $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit(); 
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
    		  
    		  
    		  
    		  
    		  
    		  
    	   
    	    $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
    	    fncGetList(1);
    	   });
    	    
    	    $( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
    	    $("h7").css("color" , "red");
    	    $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");  
    	    
    	    $(".ct_list_pop td:nth-child(3)" ).on("click" , function() {
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
   <div class="navbar  navbar-inverse navbar-fixed-top">
		
	        <div class="container">
	        
	        	<a class="navbar-brand" href="#">Bootstrap01</a>
	        	
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
	                            <span>HTML5</span>
	                            <span class="caret"></span>
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a href="#">Web UI</a></li>
	                            <li><a href="#">W3C</a></li>
	                            <li class="divider"></li>
	                            <li><a href="#">Static Contents</a></li>
	                        </ul>
	                    </li>
	                
	                    <li><a href="#">JavaScript</a></li>
	                    <li><a href="#">CSS3</a></li>
	                    
	                    <!--  /////////////////////// DropDown 내부에 다시 DropDown///////////////////////////////// -->
	                    <!--  DropDown 사용 -->
		                <li class="dropdown">
	                        <a  href="#" class="dropdown-toggle" data-toggle="dropdown">
	                            <span>HTML5</span>
	                            <span class="caret"></span>
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a href="#">Web UI</a></li>
	                            <li><a href="#">W3C</a></li>
	                            
	                            <!--  DrowDown 사용 -->
				                <li class="dropdown">
			                        <a  href="#" class="dropdown-toggle" data-toggle="dropdown">
			                            <span>HTML5</span>
			                            <span class="caret"></span>
			                        </a>
			                        <ul class="dropdown-menu">
			                            <li><a href="#">Web UI</a></li>
			                            <li><a href="#">W3C</a></li>
			                            <li class="divider"></li>
			                            <li><a href="#">Static Contents</a></li>
			                        </ul>
			                    </li>
	                            
	                            <li class="divider"></li>
	                            <li><a href="#">Static Contents</a></li>
	                        </ul>
	                    </li>
	                    <!--  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	                    
	                </ul>
	                
	                <ul class="nav navbar-nav navbar-right">
	                    <li><a href="#">J2SE</a></li>
	                    <li><a href="#">API</a></li>
	               	</ul>
	               	
				</div>	       
	       
    		</div>
    	</div>


    <!-- Wrap the rest of the page in another container to center all the content. -->




    <div class="container marketing">

      <div class="row">
 <div class="col-lg-4" >
      
    
		  
 <c:set var="i" value="0" />
 <c:forEach var="product" items="${list}">
  <c:set var="i" value="${ i+1 }" />
			
		<img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
         <h2>${product.prodName}</h2>
         <p>${product.prodDetail}</p>
         <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        
		
          </c:forEach>
  

</div>


      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->


      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->

	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
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
