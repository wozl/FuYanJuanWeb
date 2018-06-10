<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		
		<title>重置密码</title>
	</head>
	<body>
		<ul class="nav nav-tabs">
		  <li class="active"><a href="##">重置密码</a></li>
		</ul>
		<br />
		<br />
		<div class="input-control has-icon-left" style="width: 30%;">
		  <input id="user" type="text" class="form-control" placeholder="用户名">
		  <label for="inputAccountExample1" class="input-control-icon-left"><i class="icon icon-user "></i></label>
		</div>
		<br />
		<div class="input-control has-icon-left has-icon-right" style="width: 30%;">
		  <input id="pass" type="password" class="form-control" placeholder="确认密码">
		  <label for="inputEmailExample1" class="input-control-icon-left"><i class="icon icon-key "></i></label>
		  <label for="inputEmailExample1" class="input-control-icon-right"></label>
		</div>
		<br />
		<div class="input-control has-icon-left has-icon-right" style="width: 30%;">
		  <input id="pass1" type="password" class="form-control" placeholder="确认密码">
		  <label for="inputEmailExample1" class="input-control-icon-left"><i class="icon icon-key "></i></label>
		  <label for="inputEmailExample1" class="input-control-icon-right"></label>
		</div>
		<br />
		<button class="btn btn-primary " type="button" onclick="restpass();">确定</button>
	</body>
	<script type="text/javascript">
		function checkname(){
			var name=document.getElementById("user").value.trim();
			if(!name){
				var m= new $.zui.Messager('请检查用户名是否为空！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
			}
			return true;
		}
		
		function checkpass(){
			var pass=document.getElementById("pass").value.trim();
			var pass1=document.getElementById("pass1").value.trim();
			if(!pass || !pass1){
				var m= new $.zui.Messager('密码不能为空！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
			}else if(!(pass==pass1)){
				var m= new $.zui.Messager('两次输入的密码不一致！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
			}
			return true;
		}
		
		function restpass(){
			checkname();
			checkpass();
			if(!checkname() || !checkpass()){
				new $.zui.Messager('失败，请确保填写信息正确！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
			}else{
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/Admin/upps.do',
					data:{"name":document.getElementById("user").value.trim(),"pass":document.getElementById("pass1").value.trim()},
					success:function(data){
						if(data==1){
							var tip=new $.zui.Messager('密码重置成功！',{
								icon:'exclamation-sign',
								type:'success'
							}).show();
						}else if(data==0){
							var tip=new $.zui.Messager('重置失败！用户名不存在。',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
						}
					},
					error:function(){
						var tip=new $.zui.Messager('网络错误！',{
							icon:'exclamation-sign',
							type:'danger'
						}).show();
					}
				});
			}
		}
	</script>
</html>
