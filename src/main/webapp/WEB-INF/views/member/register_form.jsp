<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  register_form.jsp (가입폼)
	   register_result.jsp (가입결과화면,가입정보 출력) 
 -->
 <script type="text/javascript">
 $(document).ready(function(){
		var checkResultId="";		
		$("#regForm").submit(function(){				
			if(checkResultId==""){
				alert("아이디 중복확인을 하세요");
				return false;
			}		
		});
		$(":input[name=id]").keyup(function(){
			var id=$(this).val().trim();
			if(id.length<4 || id.length>10){
				$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!").css(
						"background","pink");
				checkResultId="";
				return;
			}			
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/idcheckAjax.do",				
				data:"id="+id,	
				success:function(data){						
					if(data=="fail"){
					$("#idCheckView").html(id+" 사용불가!").css("background","red");
						checkResultId="";
					}else{						
						$("#idCheckView").html(id+" 사용가능!").css(
								"background","yellow");		
						checkResultId=id;
					}					
				}//callback			
			});//ajax
		});//keyup
	});//ready
 </script>
 <form method="post" action="${pageContext.request.contextPath}/registerMember.do" id="regForm">
아이디 <input type="text" name="id" required="required"><span id="idCheckView"></span><br>
비밀번호 <input type="password" name="password"  required="required"><br>
이름 <input type="text" name="name"  required="required"><br>
주소 <input type="text" name="address"  required="required"><br>
<input type="submit" value="가입하기">
</form>