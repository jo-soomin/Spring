<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<f:form action="insertRes.do" method="post" modelAttribute="boardDto">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><f:input path="myname"/></td>
				<td><f:errors path="myname"></f:errors></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><f:input path="mytitle"/></td>
				<td><f:errors path="mytitle"></f:errors></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><f:textarea path="mycontent"/></td>
				<td><f:errors path="mycontent"></f:errors></td>
			</tr>
			
			<tr>
				<td colspan="4" align="right">
				<input type="submit" value="글 작성하기">
				<input type="button" value="취소" onclick="location.href='list.do'">
				</td>
			</tr>
		</table>
		
	</f:form>

</body>
</html>