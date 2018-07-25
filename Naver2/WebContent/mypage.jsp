<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
</head>
<body>





<%@ include file="\mainTop_bar.jsp"%> 
<%-- <%@ include file="\loginButton.jspf" %> --%>

<%

if (login){ %>


 마이페이지
	 <%
}
else { %> 로그인 필요  
<script>
if(confirm("로그인을 해야 볼 수 있어")){ 
	location.replace("naverLogin.jsp");
}else{
	history.back(-1);
}
</script>

<%
	
		}
	%>

</body>
</html>