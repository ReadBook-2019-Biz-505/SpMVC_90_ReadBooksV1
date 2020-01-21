<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="rootPath" value="${pageContext.request.contextPath}"/>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>





	<title>Home</title>
</head>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<style>

* {
	
	margin:0;
	padding:0;
}

body{
	
	width:978px;

}


table{	
	border-bottom:none;
	text-align:center;
	width: 100%;
    table-layout: fixed;
    float: left;
    border-collapse: collapse;
    margin-top: 1%;
    margin-left: 28%;
}

tr{

}

td{
padding: 1%;
   /*  width: 10%; */
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}

tr:hover{
	background-color: rgb(242,242,242);
}


#view_bookDetailTR{
	cursor: pointer;
}

.table_title{

    /* display: block; */
    float: left;
    font-size: x-large;
    margin-top: 21%;
    margin-left:70%;
}


#login_modal{

	display:none;
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	z-index:5;
	background-color: rgba(0,0,0,0.3);
}

#cancel_login{

	font-size:50px;
	color:white;
	float:right;
	cursor: pointer;

}


</style>

<script>



function tdClick(b_code,b_name){
	
	
	//document.location.href = "${rootPath}/book/update?b_code="+b_code

	$('input[id=top_fixedNav_b_code]').attr('value', b_code)
	$('input[id=top_fixedNav_b_name]').attr('value', b_name)


	 bookSubButton = document.getElementById('bookSubButton')
	 bookMDButton = document.getElementById('bookMDButton')
	 getSpecifyReadBookListButton = document.getElementById('getSpecifyReadBookListButton')

	 bookSubButton.style.visibility = 'visible';
	bookMDButton.style.visibility = 'visible';
	getSpecifyReadBookListButton.style.visibility = 'visible';
	 
}



$(function(){
	
	$('#cancel_login').click(function(){

		
		$("#login_modal").css("display", "none")
		
		
		})
	
	
})

</script>

<body>





<%@ include file="/WEB-INF/views/include/fixed_top.jsp" %>










<a class="table_title"><b>○도서 리스트</b></a>
<table border= "1">


	<tr>
		<th>도서코드</th>
		<th>도서명</th>
		<th>저자</th>
		<th>출판사</th>
		<th style="width: 12%;">구입일자</th>
		<th style="width: 8%;">구입가격</th>
	</tr>
	
	<c:choose>
	
		<c:when test="${empty BOOKLIST}">
			<tr>
				<td colspan="6">자료가 없음</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${BOOKLIST}" var="bookList">
				<tr id="view_bookDetailTR" onclick="tdClick('${bookList.b_code}', '${bookList.b_name}')">
					<td id="b_code">${bookList.b_code}</td>
					<td id="b_name">${bookList.b_name}</td>
					<td>${bookList.b_auther}</td>
					<td>${bookList.b_comp}</td>
					<td>${bookList.b_year}</td>
					<td>${bookList.b_iprice}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	
	</c:choose>

</table>






<div id="login_modal">
	
		<a id="cancel_login">&times;</a>
	
	<%@ include file="/WEB-INF/views/include/login.jsp" %>

</div>




</body>
</html>
