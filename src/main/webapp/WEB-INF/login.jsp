<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>欢迎登录系统</title>
    <meta name="description" content="登录页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=request.getContextPath() %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath() %>/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/app.css">
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
                <div class="tpl-login-logo">

                </div>



                <form class="am-form tpl-form-line-form">
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" id="username" placeholder="请输入账号">

                    </div>

                    <div class="am-form-group">
                        <input type="password" class="tpl-form-input" id="password" placeholder="请输入密码">

                    </div>
                    <div class="am-form-group tpl-login-remember-me">
                        <input id="remember-me" type="checkbox" checked="checked">
                        <label for="remember-me">
       
                        记住密码
                         </label>

                    </div>






                    <div class="am-form-group" id="go">

                        <button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" onclick="Login();">登录</button>

                    </div>
                    <a href="<%=request.getContextPath() %>/Admin/reqpass.do">忘记密码？</a>
                </form>
            </div>
        </div>
    </div>
    <script src="<%=request.getContextPath() %>/assets/js/amazeui.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/app.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
	<script type="text/javascript">
		function checkname(){//检查是否输入用户名
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
			
			var pwd=$("#password").val().trim();
			if(!pwd){
				var tip=new $.zui.Messager('请输入密码！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show();
				return false;
			}
				return true;
		}
		
		function Login(){
			checkname();
			checkpwd();
			var name=$('#username').val().trim();
			var pwd=$('#password').val().trim();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/FuYanJuan/login.do",
				data:{"id":null,"UserName":name,"PassWord":pwd},
				beforeSend:function(){
					document.getElementById("go").innerHTML='<button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" onclick="Login();" disabled="disabled"><span class="am-icon-spinner am-icon-spin "></span>登录中...</button>';
				},
				success:function(data){
					if(data==1){
						new $.zui.Messager('登陆成功！',{
									icon:'ok-sign',
									type:'success'
								}).show();
						setTimeout(function(){
							window.location.assign("${pageContext.request.contextPath}/FuYanJuan/checkadmin.do")
						},3000);
					}else{
						new $.zui.Messager('用户名或密码错误！',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
					}
				},
				error:function(){
					new $.zui.Messager('未知错误！',{
								icon:'exclamation-sign',
								type:'danger'
							}).show();
				},
				complete:function(){
					document.getElementById("go").innerHTML='<button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" onclick="Login();">登录</button>';
				}
			});
		}
		
	</script>
</body>

</html>