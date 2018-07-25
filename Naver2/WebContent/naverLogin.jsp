<%@page import="register.service.JoinService"%>

<%
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
	//resultCnt = service.join(user);
%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
        <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
    <link rel="stylesheet" href="naverCss.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>

</head>
<body>
<%	

	Cookie[] cookie = request.getCookies();
		String id = "";
		if(cookie!=null){
			for(int i=0; i<cookie.length;i++){
				if(cookie[i].getName().trim().equals("id")){
					System.out.println(cookie[i].getValue());
					id=cookie[i].getValue();
				}
			}
		}
		
%>
	<script type="text/javascript">
	    function checkValue()
	    {	
	        if(!document.user.id.value){
	            alert("아이디를 입력하세요.");
	            return false;
	        };
	        
	        if(!document.user.pwd.value){
	            alert("비밀번호를 입력하세요.");
	            return false;
	        };
	
	        
	         var userID = $('#idtext').val();
	         var userPassword = $('#pass1').val();
			$.ajax({
				type: 'POST',
				url: './loginCheck',
				data: {userID: userID,
					userPassword:userPassword},
				success: function(result){
					if(result == 0){
						$('#userCheck').text('멋진 아이디 입니다!').css("color","green");  
					}else{
						$('#userCheck').text('중복된 아이디 입니다.').css("color","red");
						alert("잘못된");
						return false;
						
					}
				}
			}) 
			
			
			
	    }
    </script>
    
    <style>
    .naverbanner2 > a:visited{
    	color:#2DB400;
    	text-decoration:none;
    }
    .naverbanner2 > a:link{
    	color:#2DB400;
    	text-decoration:none;
    }
    </style>
    
    <div class="main">
        <div class="midlogin">
            <select class="langoption">
                <option value="ko_KR" selected>한국어</option>
                <option value="en_US" >English</option>
                <option value="zh-Hans_CN" >中文(简体)</option>
                <option value="zh-Hant_TW" >中文(台灣)</option>
            </select>
            <div class="bannerdiv">
                <p class="naverbanner2" style="left: 10px;"><a href="Main.jsp" >NAVER</a></p>
            </div>
            <div class="mainarea">
                
                <form action="loginAction" method="post" name="user" onsubmit="return checkValue()">
                    <div class="boxarea " id="box1">
                        <input class="inputfocus" id="idtext" name="id" style="width: 100%; font-size: 18px;" type="text" value="<%=id %>"  placeholder="아이디">
                    </div>
                    <div class="boxarea">
                        <input class="passwordarea inputfocus" id="pass1" name="pwd" type="password" placeholder="비밀번호" style="width: 100%">
	                </div>
	                <div>
	                    <input class="doregi" type="submit" value="로그인" >
	                </div>
	                <input type="checkbox" class="checkbox" id="chk_1" name="id_keep" <% if(id.length()>1) out.println("checked"); %> value="">
                        <label class="check_label" for="chk_1">
                                <span class="keepid" >아이디 저장</span>
                        </label>
                     <div id="userCheck" class="divchk"></div>
                    
            	</form>
            </div>
            <ul style="position: relative; top: 100px; right: 70px;">
                <li><a href="#">아이디 찾기</a></li>
                <li><a href="#">비밀번호 찾기</a></li>
                <li style="border-right:none;"><a href="naverAgree.jsp" >회원가입</a></li>
            </ul>
            
            <ul style="width: 800px; position: relative; right:410px; top: 140px; ;">
                <li><a href="#">이용약관</a></li>
                <li><a href="#"><b>개인정보처리방침</b></a></li>
                <li><a href="#">책임의 한계와 법적고지</a></li>
                <li style="wi; border-right: none;"><a href="#">회원정보 고객센터</a></li>
            </ul>
            <div class="corp" style="position: relative; top: 200px; left: 0px;">© NAVER Corp.</div>
        </div>
        
    </div>
</body>
</html>