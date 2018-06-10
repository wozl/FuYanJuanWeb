<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		
		<title>忘记密码</title>
	</head>
	<body>
		
		
		<ul class="nav nav-tabs">
		  <li class="active"><a href="##">忘记密码</a></li>
		</ul>
		<br />
		<br />
		<div class="input-control has-label-left has-icon-right" style="width: 30%;">
		  <input id="inputEmailExample3" type="email" class="form-control" placeholder="">
		  <label for="inputEmailExample3" class="input-control-label-left text-right">邮箱:</label>
		  
		</div>
		<br />
		<button class="btn btn-primary " type="button" onclick="go();">发送</button>
	</body>
	<script type="text/javascript">
			
			function go(){
				
				var mail=$('#inputEmailExample3').val().trim();
				var checkmail= /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
				if(checkmail.test(mail)){
					$.ajax({
						type:'post',
						url:'${pageContext.request.contextPath}/Admin/email.do',
						data:{"email":mail},
						success:function(data){
							if(data==0){
								var tip=new $.zui.Messager('邮件成功，请打开邮箱查收！',{
									icon:'exclamation-sign',
									type:'success'
								}).show();
						}},
						error:function(){
							var tip=new $.zui.Messager('网络错误！',{
								icon:'exclamation-sign',
								type:'danger'
								}).show();
						}
					});
				}else{
					var tip=new $.zui.Messager('邮箱格式不正确！',{
									icon:'exclamation-sign',
									type:'danger'
									}).show();
					return false;
				}
			}
			
	</script>
</html>
