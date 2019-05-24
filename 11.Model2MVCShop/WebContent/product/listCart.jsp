<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->

	<script type="text/javascript">

	 $(function() {

		 $( "td:nth-child(2)" ).on("click" , function() {
			
				self.location ="/product/getProduct?prodNo="+$(this).text().trim()+"&menu=search";
				
		});
	
		 
		 $( "td.ct_btn01:contains('선택상품 구매하기')" ).on("click" , function() {
				
	
					self.location = "/purchase/addPurchaseView2.jsp"
			
				});
			 

		 $("input[name=check_all]").on("click" , function() {
				 var total = 0;
				var check=$(this).is(":checked");
		
				if(check){
					$("input[name='input_check']").prop("checked",true);
					$('#amount').val('${totalPrice}');
				}else{
					$("input[name='input_check']").prop("checked",false);
		            $('#amount').val('0');
				}
		});
		 
		 
	     
			    $("input[name=input_check]").click(function(event) {
			        var total = 0;
			        $("input[name=input_check]:checked").each(function() {
			            total += parseInt($(this).val());
			        });
			        
			        if (total == 0) {
			            $('#amount').val('0');
			           
			        } else {                
			            $('#amount').val(total);
			        }
			    });

		 
		});
	 
			</script>
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>My Cart</h3>
	    </div>
	   

      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
 
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">상품번호</th>
            <th align="left">물품명</th>
          
            <th align="left">상세정보</th>
            <th align="left">price</th>
			<th align="left"><input type="checkbox" name="check_all" value=${totalPrice} checked="checked"></th>
          </tr>
        </thead>
       
       
		<tbody>
		
		<c:set var="i" value="0" />
		<c:forEach var="product" items="${cart}">
  		<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			 <td align="left">${product.prodNo}</td>
			  <td align="left">${product.prodName}</td>
			  <td align="left">${product.prodDetail}</td>
			  	  <td align="left">${product.price}</td>
			  <td align="left"><input type="checkbox" name="input_check" checked="checked" value=${product.price}></td>
				<td align="left"></th>
</tr>
		
	 </c:forEach>
        
        </tbody>
      
      <p align="right">
    <strong >Total Price : </strong> <input name="amount" id="amount" value="${totalPrice}"/>원
</p>
      
      <!-- 	<div align="right"> Total Price : ${totalPrice} 원</div>//-->
		
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">선택상품 구매하기</button>
	  		</div>
		</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>