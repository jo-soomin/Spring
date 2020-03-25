<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="update.do" method="POST">
	<table border="1">
		<tr>
			<th>작성자</th>
			<td>${detail.myname }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${detail.mytitle }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="30" readonly="readonly">${detail.mycontent }</textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="hidden" name="myno" value="${detail.myno }">
				<input type="button" value="취소"  onclick="location.href='list.do'">
				<input type="button" value="삭제" onclick="location.href='delete.do?myno=${detail.myno}'">
				<input type="submit" value="수정하기">
			</td>
		</tr>
		
	
	</table>
	</form>

</body>
</html>