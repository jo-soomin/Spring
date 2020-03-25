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
	<form action="updateRes.do" method="post">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="myname" value="${dto.myname }"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="mytitle" value="${dto.mytitle }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" name="mycontent">${dto.mycontent }</textarea></td>
			</tr>
			
			<tr >
				<td colspan="4" align="right">
				<input type="hidden" name="myno" value="${dto.myno }">
				<input type="button" value="취소" onclick="location.href='selectOne.do?myno=${dto.myno}'">
				<input type="submit" value="수정하기">
				</td>
			</tr>
			
		</table>
	</form>

</body>
</html>