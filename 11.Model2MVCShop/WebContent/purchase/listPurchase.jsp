<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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
				
				//////////////////////////// �߰� , ����� �κ� ///////////////////////////////////
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
															+"���̵� : "+JSONData.userId+"<br/>"
															+"��  �� : "+JSONData.userName+"<br/>"
															+"�̸��� : "+JSONData.email+"<br/>"
															+"ROLE : "+JSONData.role+"<br/>"
															+"����� : "+JSONData.regDate+"<br/>"
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���Ÿ����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    

      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ�� ID</th>
            <th align="left">�����ڸ�</th>
            <th align="left">��ǰ��</th>
            <th align="left">������</th>
            <th align="left">����</th>
             <th align="left"></th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center"  title="Click : �������� Ȯ��">${ i }<div id=tranNoj style="display:none">${purchase.tranNo}</div>
		</td>
			  <td align="left"  title="Click : ȸ������ Ȯ��">${purchase.buyer.userId}</td>
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.purchaseProd.prodName}</td>
			 <td align="left">${purchase.orderDate}</td>
			 <td align="left"><c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '0  ')}">
		�Ǹ���
		</c:if>
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '1  ')}">
		���ſϷ� (�����)
		</c:if>
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '2  ')}">
		����� 
		</c:if>
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '3  ')}">
		��ۿϷ� (����Ȯ��) 
		</c:if>
		
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '4  ')}">
		�������  
		</c:if>
		
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '5  ')}">
		��ǰ�Ϸ�
		</c:if></td>
		
		
		
		
			 <td align="left">	<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '2  ')}">
		<a href= "/purchase/updateTranCodeListPurchase?tranNo=${purchase.tranNo}&tranCode=3">����Ȯ��</a>
		<a href= "/purchase/updateTranCodeListPurchase?tranNo=${purchase.tranNo}&tranCode=5">��ǰ��û</a>
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
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>