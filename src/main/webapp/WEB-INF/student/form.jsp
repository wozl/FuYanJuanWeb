<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>发布文章</title>
    <meta name="description" content="后台页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=request.getContextPath() %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath() %>/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="<%=request.getContextPath() %>/assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/app.css">
    <script src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>

</head>

<body data-type="widgets">
    <script src="<%=request.getContextPath() %>/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 头部 -->
        <header>
            <!-- logo -->
            <div class="am-fl tpl-header-logo">
                <a href="javascript:;"><img src="<%=request.getContextPath() %>/assets/img/logo.png" alt=""></a>
            </div>
            <!-- 右侧内容 -->
            <div class="tpl-header-fluid">
                <!-- 侧边切换 -->
                <div class="am-fl tpl-header-switch-button am-icon-list">
                    <span>

                </span>
                </div>
                <!-- 搜索 -->
                <div class="am-fl tpl-header-search">
                    
                </div>
                <!-- 其它功能-->
                <div class="am-fr tpl-header-navbar">
                    <ul>
                        <!-- 欢迎语 -->
                        <li class="am-text-sm tpl-header-navbar-welcome">
                            <a href="javascript:;">欢迎你, <span>${sessionScope.username}</span> </a>
                        </li>
                        <!-- 退出 -->
                        <li class="am-text-sm">
                            <a href="<%=request.getContextPath()%>/FuYanJuan/loginout.do">
                                <span class="am-icon-sign-out"></span> 退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </header>
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
        <!-- 侧边导航栏 -->
        <div class="left-sidebar">
            <!-- 用户信息 -->
            <div class="tpl-sidebar-user-panel">
                <div class="tpl-user-panel-slide-toggleable">
                    <div class="tpl-user-panel-profile-picture">
                        <img src="<%=request.getContextPath() %>/assets/img/user04.png" alt="">
                    </div>
                    <span class="user-panel-logged-in-text">
              <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>
             ${sessionScope.username}
          </span>
                    <a href="javascript:;" class="tpl-user-panel-action-link"> <span class="am-icon-pencil"></span> 账号设置</a>
                </div>
            </div>

            <!-- 菜单 -->
            <ul class="sidebar-nav">
                <li class="sidebar-nav-heading">菜单 <span class="sidebar-nav-heading-info"></span></li>
                
                <li class="sidebar-nav-link" >
                    <a href="<%=request.getContextPath() %>/FuYanJuan/checkadmin.do" >
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 文章管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/FuYanJuan/form.do" class="active">
                        <i class="am-icon-wpforms sidebar-nav-link-logo"></i> 发布文章

                    </a>
                </li>
          
               
                
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/FuYanJuan/photo_wall.do">
                        <i class="am-icon-th-large sidebar-nav-link-logo"></i> 照片墙

                    </a>
                </li>
                
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/FuYanJuan/index.do">
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 去首页
                    </a>
                </li>
                

            </ul>
        </div>

        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">

            <div class="container-fluid am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                        <div class="page-header-heading"><span class="am-icon-envira page-header-heading-icon"></span> 文章<small></small></div>
                        
                    </div>
                    
                </div>

            </div>

            <div class="row-content am-cf">


                

                <div class="row">

                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">发布文章</div>
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
                            </div>
                            <div class="widget-body am-fr">

                                <form class="am-form tpl-form-border-form tpl-form-border-br">
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-3 am-form-label">标题 <span class="tpl-form-line-small-title">Title</span></label>
                                        <div class="am-u-sm-9">
                                            <input type="text" class="tpl-form-input" id="title" value="${requestScope.Title}" placeholder="请输入标题文字">
                                            <small>请填写标题文字10-20字左右。</small>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-email" class="am-u-sm-3 am-form-label">发布时间 <span class="tpl-form-line-small-title">Time</span></label>
                                        <div class="am-u-sm-9">
                                            <input value="${requestScope.time}" type="text" class="am-form-field tpl-form-no-bg" id="time" placeholder="发布时间" data-am-datepicker="" readonly="">
                                            <small>发布时间为必填</small>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-phone" class="am-u-sm-3 am-form-label">作者 <span class="tpl-form-line-small-title">Author</span></label>
                                        <div class="am-u-sm-9">
                                            	<small id="Author">${sessionScope.username}</small>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="user-intro" class="am-u-sm-3 am-form-label">文章内容</label>
                                        <div class="am-u-sm-9">
                                            <textarea  class="" rows="10" id="content" placeholder="请输入文章内容">${requestScope.content}
                                            </textarea>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3" id="go">
                                            <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success " onclick="publish_article()">提交</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                


            </div>
        </div>
    </div>
    </div>
    <script src="<%=request.getContextPath() %>/assets/js/amazeui.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/amazeui.datatables.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/dataTables.responsive.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/app.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
    <script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
	<script type="text/javascript">
	window.onload=function(){
		//alert(${requestScope.ArticleEdit[0].Title});
	}
		function publish_article(){
			var title=$('#title').val().trim();
			var time=$('#time').val().trim();
			var author=$('#Author').val().trim();
			var content=$('#content').val();
			console.log(title+time+author+content);
			
			var clickTime=time+nowTime();
			if(time=""){
				alert("请选择发布时间");
				return false;
			}
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/FuYanJuan/publish_article.do",
					data:{"id":null,"Title":title,"Issuing_Time":clickTime,"Author":0,"Content":content},
					beforeSend:function(){
						
						document.getElementById("go").innerHTML='<button type="button" onclick="publish_article();" class="am-btn am-btn-primary tpl-btn-bg-color-success " disabled="disabled"><span class="am-icon-spinner am-icon-spin "></span>提交中...</button>';
					},
					success:function(data){
						if(data==0){
							new $.zui.Messager('发表成功！',{
									icon:'ok-sign',
									type:'success'
								}).show();
								setTimeout(function() {
									window.location.assign("${pageContext.request.contextPath}/FuYanJuan/checkadmin.do");
								}, 2000);
							
						}else if(data==-1){
								var tip=new $.zui.Messager('文章发表失败！',{
									icon:'exclamation-sign',
									type:'danger'
									}).show();
						}
						
					},
					error:function(){
						var tip=new $.zui.Messager('未知错误！',{
							icon:'exclamation-sign',
							type:'danger'
						}).show();
					},
					complete:function(){
						document.getElementById("go").innerHTML='<button type="button" onclick="publish_article();" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>';
					}
				});
				
			}
		
		function nowTime(){
				var times=new Date();
				var y,m,date,day,hs,ms,ss,theDateStr;
				y=times.getFullYear();//年
				m=times.getMonth();//月
				date=times.getDate();//天
				day=times.getDay();//星期
				hs=times.getHours();//小时
				ms=times.getMinutes();//分钟
				ss=times.getSeconds();//秒
				//判断下，自动补“0”
				if(ms<10){
					ms="0"+ms;
				}
				if(ss<10){
					ss="0"+ss;
				}
				if(date<10){
					date="0"+date;
				}
				return " "+hs+":"+ms+":"+ss;
			}
			
			
	</script>
</body>

</html>