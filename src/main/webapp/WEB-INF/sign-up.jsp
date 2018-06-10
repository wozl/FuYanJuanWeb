<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>欢迎加入我们</title>
    <meta name="description" content="注册 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=request.getContextPath() %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath() %>/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/app.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
    <script src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>

</head>

<body data-type="login">
    <script src="<%=request.getContextPath() %>/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 风格切换 -->
        <div class="tpl-skiner">
            <div class="tpl-skiner-toggle am-icon-cog">
            </div>
            <div class="tpl-skiner-content">
                <div class="tpl-skiner-content-title">
                    选择主题
                </div>
                <div class="tpl-skiner-content-bar">
                    <span class="skiner-color skiner-white" data-color="theme-white"></span>
                    <span class="skiner-color skiner-black" data-color="theme-black"></span>
                </div>
            </div>
        </div>
        <div class="tpl-login">
            <div class="tpl-login-content">
                <div class="tpl-login-title">注册用户</div>
                <span class="tpl-login-content-info">
                  创建一个新的用户
              </span>


                <div class="am-form tpl-form-line-form">
                   
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" id="username" placeholder="用户名">
                    </div>

                    <div class="am-form-group">
                        <input type="password" class="tpl-form-input" id="pwd1" placeholder="请输入密码">
                    </div>

                    <div class="am-form-group">
                        <input type="password" class="tpl-form-input" id="pwd2" placeholder="再次输入密码">
                    </div>

                    <div class="am-form-group tpl-login-remember-me">
                        <input id="remember-me" type="checkbox">
                        <label for="remember-me">
       
                        我已阅读并同意 <a href="javascript:;">《用户注册协议》</a> 
                         </label>

                    </div>






                    <div class="am-form-group" id="go">

                        <button type="button" onclick="registered();" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" >提交</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<%=request.getContextPath() %>/assets/js/amazeui.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/app.js"></script>
	<script src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/zui/js/zui.min.js"></script>
	<script type="text/javascript">
		function checkname(){
			var name=$('#username').val().trim();
			if(!name){
				var tip=new $.zui.Messager('请检查用户名是否为空！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
			}
			return true;
		}
		
		function checkpwd(){
			
			var pwd1=$("#pwd1").val().trim();
			var pwd2=$('#pwd2').val().trim();
			if(pwd1!=pwd2){
				var tip=new $.zui.Messager('两次输入的密码不一致！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
			}else if(!pwd1 || !pwd2){
				var tip=new $.zui.Messager('请检查密码是否为空！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
			}
				return true;
			
		}
		
		function registered(){
			
			checkname();
			checkpwd();
			var name=document.getElementById("username").value.trim();
			var pwd=document.getElementById("pwd2").value.trim();
			var time=nowTime().toString();
			
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/FuYanJuan/reg.do',
				data:{"id":null,"UserName":name,"PassWord":pwd,"Registration_Time":time},
				beforeSend:function(){
					document.getElementById("go").innerHTML='<button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" onclick="registered();" disabled="disabled"><span class="am-icon-spinner am-icon-spin "></span>提交中...</button>';
				},
				success:function(data){
					
					if(data==0){
						var tip=new $.zui.Messager('注册成功，即将为您跳转到登录页！',{
							icon:'exclamation-sign',
							type:'success'
						}).show();
						setTimeout(function(){//设置三秒后跳转页面
							goLogin();	
						}, 3000);
					}else{
						var tip=new $.zui.Messager('注册失败，改用户名已被注册！',{
							icon:'exclamation-sign',
							type:'danger'
						}).show();
					}
				},
				error:function(){
					var tip=new $.zui.Messager('网络故障！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show();
				},
				complete:function(){
					document.getElementById("go").innerHTML='<button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" onclick="registered();">提交</button>';
				}
			}); 
		}
		
		function nowTime(){
	 		var times=new Date();
	 		var y,m,date,day,hs,ms,ss,theDateStr;
	 		y=times.getFullYear();//四位年例如2017
	 		m=times.getMonth()+1;//月
	 		date=times.getDate();//天
	 		day=times.getDay();//星期
	 		hs=times.getHours();//时
	 		ms=times.getMinutes();//分
	 		ss=times.getSeconds();//秒
	 		if(m<10){
	 			m="0"+m;
	 		}
	 		if(ms<10){
	 			ms="0"+ms;
	 		}
	 		if(ss<10){
	 			ss="0"+ss;
	 		}
	 		if(date<10){
	 			date="0"+date;
	 		}
	 		theDateStr=y+"-"+m+"-"+date+" "+hs+":"+ms+":"+ss;
	 		return theDateStr;
	 	}
		
		
		function goLogin(){
			window.location.assgin("${pageContext.request.contextPath}/FuYanJuan/loginIndex.do");
			
			
		}
	</script>
</body>

</html>