<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="login" method="post">
	<table border="1">
		<tr>
			<th><input type="text" name="id" placeholder="ID 입력" required></th>
			<th><input type="password" name="pw" placeholder="비밀번호 입력" required></th>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="로그인"></th>
		</tr>
	</table>
	</form>
</body>
</html>