<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/include/header.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>1:1 문의</title> 
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.validate.js"></script>
<script type="text/javascript">		
	$("#btnUpdate").click(function() {
		var title = $("#request_title").val();
		var content = $("#request_content").val();
		var id = $("#user_id").val();
		if(title == "") {
			alert("제목을 입력하세요");
			document.form1.request_title.focus();
			return;
		}
		if(content == "") {
			alert("내용을 입력하세요");
			document.form1.request_content.focus();
			return;
		}
		if(id == "") {
			alert("아이디를 입력하세요");
			document.form1.user_id.focus();
			return;
		}
		document.form1.action = "${path}/admin/requestUpdate";
		document.form1.submit();
	});
</script> 
</head>
<body>
<div align="center">
	<h2>1:1문의 내용</h2>
	<form name="form1" method="post">
		<div>
			작성일자: <fmt:formatDate value="${dto.regdate }" pattern="yyyy-MM-dd a HH:mm:ss"/>
		</div>
		<div>
			제목
			<input type="text" name="request_title" id="request_title" size="78" value="${dto.request_title }" placeholder="제목을 입력해주세요.">
		</div>
		<div>
			내용
			<textarea rows="4" cols="80" name="request_content" id="request_content" placeholder="내용을 입력해주세요.">${dto.request_content }</textarea>
		</div>
		<div>
			아이디
			<input type="text" name="user_id" id="user_id" value="${dto.user_id }" placeholder="아이디를 입력해주세요.">
		</div>
		<div style="width:650px; text-align:center;">	
			<input type="hidden" name="request_no" value="${dto.request_no }">		
			<button type="button" id="btnUpdate">수정</button>
			<button type="button" id="btnDelete">삭제</button>
		</div>
	</form>
</div>	
</body>
</html>
<%@ include file="/WEB-INF/include/footer.jsp" %>