<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<link rel="stylesheet"href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- CDN(Content Delivery Network) 호스트 사용 -->

 <script type="text/javascript">
 

   
  
</script>
</head>
<body bgcolor="#ffffff" text="#000000">
<div style="width:98%; margin-left:10px;">
<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
 <tr>
  <td width="15" height="37">
   <img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
  </td>
  <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    
    <tr>
     <td width="93%" class="ct_ttl01">
     
       Cart
     
     </td>
    </tr>
    
     


 

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
 <tr>
  </td>
 </tr>
 <tr>
  <td class="ct_list_b" width="100">No</td>
  
  <td class="ct_line02"></td>
 
  <td class="ct_list_b" width="150">
   상품명
  </td>
  <td class="ct_list_b" width="150">가격</td>
 
  <td class="ct_list_b">상품 상세정보</td> 


 </tr>
 <tr>
  <td colspan="11" bgcolor="808285" height="1"></td>
 </tr>
  
  
  
 <c:set var="i" value="0" />
<c:forEach var="product" items="${cart}">
  <c:set var="i" value="${ i+1 }" />
  <tr class="ct_list_pop">
   <td align="center">${ i }</td>
   <td></td>
   
  
 
  <td align="left">${product.prodName}</td>

 
  <td align="left">${product.price}</td>
 
  <td align="left">${product.prodDetail}</td>
 </tr> 
 <tr>
  <td colspan="11" bgcolor="D6D7D6" height="1"></td>
 </tr>
 </c:forEach>
 </table>
 
<!--  페이지 Navigator 시작 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
 <tr>
  <td align="center">
     </td>
  </tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>
</div>
</body>
</html>