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
	
	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase?menu=${param.menu}").submit();
	
	}
	 $(function() {

		 $( "td:nth-child(1)" ).on("click" , function() {
			
				self.location ="/purchase/getPurchase?tranNo="+$(this).children("#tranNoj").text().trim();
				
		});
		 
	
		 $("td:nth-child(7) > i").on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				
				//////////////////////////// 추가 , 변경된 부분 ///////////////////////////////////
				//self.location ="/user/getUser?userId="+$(this).text().trim();
				////////////////////////////////////////////////////////////////////////////////////////////
				var userId = $(this).text().trim();
				$.ajax( 
						{
							url : "/user/json/getUser/"+userId ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								
								var displayValue = "<h3>"
															+"아이디 : "+JSONData.userId+"<br/>"
															+"이  름 : "+JSONData.userName+"<br/>"
															+"이메일 : "+JSONData.email+"<br/>"
															+"ROLE : "+JSONData.role+"<br/>"
															+"등록일 : "+JSONData.regDate+"<br/>"
															+"</h3>";
								//Debug...									
								//alert(displayValue);
								$("h3").remove();
								$( "#"+userId+"" ).html(displayValue);
							}
					});
					////////////////////////////////////////////////////////////////////////////////////////////
				
		});
		 
		 $( "td:nth-child(1)" ).css("color" , "red");
		 $("h3").css("color" , "blue");
		 $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");	
			
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
	       <h3>구매목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    

      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원 ID</th>
            <th align="left">구매자명</th>
            <th align="left">물품명</th>
            <th align="left">구매일</th>
            <th align="left">상태</th>
             <th align="left"></th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center"  title="Click : 구매정보 확인">${ i }<div id=tranNoj style="display:none">${purchase.tranNo}</div>
		</td>
			  <td align="left"  title="Click : 회원정보 확인">${purchase.buyer.userId}</td>
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.purchaseProd.prodName}</td>
			 <td align="left">${purchase.orderDate}</td>
			 <td align="left"><c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '0  ')}">
		판매중
		</c:if>
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '1  ')}">
		구매완료 (배송전)
		</c:if>
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '2  ')}">
		배송중 
		</c:if>
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '3  ')}">
		배송완료 (구매확정) 
		</c:if>
		
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '4  ')}">
		구매취소  
		</c:if>
		
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '5  ')}">
		반품완료
		</c:if></td>
		
		
		
		
			 <td align="left">	<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '2  ')}">
		<a href= "/purchase/updateTranCodeListPurchase?tranNo=${purchase.tranNo}&tranCode=3">구매확정</a>
		<a href= "/purchase/updateTranCodeListPurchase?tranNo=${purchase.tranNo}&tranCode=5">반품신청</a>
		</c:if>
		
		
		<c:if test="${! empty purchase.tranCode && !(purchase.tranCode eq '2  ')}">
			 
		</c:if></td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${user.userId}"></i>
			  	<input type="hidden" value="${user.userId}">
			  </td>
			
			</tr>
          </c:forEach>
          
          
          
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>