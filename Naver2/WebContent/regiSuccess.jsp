<%@page import="register.service.JoinService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 1. 사용자 입력 데이터 받기 
	// 2. 요구사항을 처리할 서비스 객체 생성 ( 받아오는것 )
	// 3. 처리요청 ( service.wirite 실행)
	// 4. 결과 받아서 사용자에게 보여줄 응답 view를 작성0

	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="member.model.Userset"/>
<jsp:setProperty property="*" name="user"/>

<%
	int resultCnt = 0;

	JoinService service = JoinService.getInstance();
	System.out.println(user.getBirth());
	//user.setGender(request.getParameter("gender1"));
	//user.setBirth1(request.getParameter("birth1"));
	resultCnt = service.join(user);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="naverCss.css" />
<title>환영합니다.</title>
</head>
<body>
<h1><%=request.getParameter("name") %>	님 환영합니다.</h1>

	<a href="naverLogin.jsp">로그인하러 가기</a>
</body>
</html>