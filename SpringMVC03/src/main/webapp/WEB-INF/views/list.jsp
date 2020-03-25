<%@page import="com.mvc.upgrade.model.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>myname</th>
			<th>mytitle</th>
			<th>mycontent</th>
			<th>mydate</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr><td colspan="4">----------작성된 글이 존재하지 않습니다.</td></tr>
			</c:when>	
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.myname }</td>
						<td><a href="selectOne.do?myno=${dto.myno }">${dto.mytitle }</a></td>
						<td>${dto.mycontent }</td>
						<td>${dto.mydate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="글작성" onclick="location.href='insert.do'">
			</td>
		</tr>
	</table>
</body>
</html>