<%@ page contentType="text/html; charset=utf-8"%>



<%@page session="true"%>

<%
	String memberId = (String) session.getAttribute("MEMBERID");
	boolean login = memberId == null ? false : true;
	//false = 로그인 x / true = 로그인 o
%>

<%
	System.out.print((String) session.getAttribute("MEMBERID"));
%>
<style>
button {
	background-color: #4CAF50;
	color: black;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	/* width: 100%; */
}
</style>
<div>
	<%
		if (login) {
	%>
	<button type="button" onclick="logout('Main.jsp')"  style="width: auto;">LogOut
	</button>
	<%
		}

		else {
	%>
	<button type="button" onclick="location.href='naverLogin.jsp'"
		style="width: auto;">Login</button>
	<%
		}
	%>

</div>

<script type="text/javascript">
	function logout(str){

		var con = confirm("로그아웃 할꺼야?");
	 	if(con == true){
<%-- 	 		<%session.invalidate();%> --%>
	 		location.replace("successLogout.jsp");
	 		
	  //logout을 위해 세션을 제거하는 페이지 호출
	 	}else{}
	}
</script>



<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: #333;
}

.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.active {
	background-color: #4CAF50;
	color: white;
}

.topnav .icon {
	display: none;
}

@media screen and (max-width: 600px) {
	.topnav
	 
	a
	:not
	 
	(
	:first-child
	 
	)
	{
	display
	:
	 
	none
	;
	
	
}

.topnav a.icon {
	float: right;
	display: block;
}

}
@media screen and (max-width: 600px) {
	.topnav.responsive {
		position: relative;
	}
	.topnav.responsive .icon {
		position: absolute;
		right: 0;
		top: 0;
	}
	.topnav.responsive a {
		float: none;
		display: block;
		text-align: left;
	}
}

* {
	box-sizing: border-box;
}

.container {
	margin: 0;
	font-family: Arial;
	font-size: 17px;
	position: relative;
	max-width: 1000px;
	margin: 0 auto;
}

.container img {
	vertical-align: middle;
}

.container .content {
	position: absolute;
	bottom: 0;
	background: rgba(0, 0, 0, 0.5);
	/* Black background with transparency */
	color: #f1f1f1;
	width: 50%;
	padding: 20px;
}
</style>

<%
	String id = (String) session.getAttribute("id");
%>


<div class="topnav" id="myTopnav">
	<a href="Main.jsp" class="active">Home</a>
	<script>
	
	function loginchk(){
		 /* var logincheck = confirm("로그인 후 볼 수 있는 페이지 입니다. 로그인 페이지로 가시겠습니까?"); */
		 if(confirm("로그인 후 볼 수 있는 페이지 입니다. 로그인 페이지로 가시겠습니까?")){
			 location.replace("naverLogin.jsp");
		 } else{ 
		 }
	}
	</script>
	<% if(login){ %>
	<a href="Gallery.jsp">Gallery</a>
	<%}else{ %>
	<a onclick="loginchk()">Gallery</a>
	<%} %>
	<a href="#about">About</a> 
	<a href="mypage.jsp">마이페이지</a>
</div>

<%-- 확인 : <%=session.getAttribute("MEMBERID") %> --%>


<script>
	function myFunction() {
		var x = document.getElementById("myTopnav");
		if (x.className === "topnav") {
			x.className += " responsive";
		} else {
			x.className = "topnav";
		}
	}
</script>


