<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>文章管理</title>
    <meta name="description" content="后台">
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
                    <a href="##" class="active">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 文章管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/FuYanJuan/form.do">
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
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">文章列表</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                            	<a type="button" href="<%=request.getContextPath() %>/FuYanJuan/form.do" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</a> 
                                            	 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                       
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        
                                    </div>
                                </div>

                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>文章标题</th>
                                                <th>作者</th>
                                                <th>时间</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="TableContent">
                                            
                                            <!-- more data -->
                                        </tbody>
                                    </table>
                                </div>
                                <div class="am-u-lg-12 am-cf">

                                    <div class="am-fr">
                                        <ul class="page" id="page">
                                            
                                        </ul>
                                    </div>
                                </div>
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
		Article();
	}
		function Article(){
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/FuYanJuan/Article.do',
				data:{},
				success:function(data){
					console.log(data);
					var list=data.lists;
					if(list.length>0){
						
						 for(var i=0;i<list.length;i++){
							document.getElementById("TableContent").innerHTML+='<tr class="even gradeX">'+
							'<td>'+list[i].title+'</td>'+
							'<td>'+list[i].users.userName+'</td>'+
							'<td>'+list[i].issuing_Time+'</td>'+
							'<td><div class="tpl-table-black-operation">'+
							'<a href="##" onclick="redact(this);"><i class="am-icon-pencil"></i> 编辑</a>'+
							'<a href="##" class="tpl-table-black-operation-del"><i class="am-icon-trash"></i> 删除</a>'+
							'</div></td>'+
							'</tr>';
						}
					}
					 $('#page').pager({
						page:1,
						recTotal:data.totalCount,
						recPerPage:data.pageSize,
						elements:['prev_icon','page_of_total_text','next_icon'],
						onPageChange:function(state,oldState){//当页码改变的时候的监听函数
							if(state.page !== oldState.page){
								console.log("页码由"+oldState.page+"改变成"+state.page);
								getPageNo(state.page);
							}
							
						}
					}); 
				},
				error:function(){
					var tip=new $.zui.Messager('未知错误！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show(); 
				}
			});
		}
		
		function getPageNo(obj){//点击页码查询新数据
			console.log(obj);
			/* $(obj).siblings('li').removeClass('am-active');
			$(obj).addClass('am-active');
			var pages=parseInt($(obj).text()); */
			var pages=parseInt(obj);
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/FuYanJuan/Article.do',
				data:{"currentPage":pages},
				beforeSend:function(){
					document.getElementById("TableContent").innerHTML='';
				},
				success:function(data){
					console.log(data);
					var list=data.lists;
					if(list.length>0){
						
						 for(var i=0;i<list.length;i++){
							document.getElementById("TableContent").innerHTML+='<tr class="even gradeX">'+
							'<td>'+list[i].title+'</td>'+
							'<td>'+list[i].users.userName+'</td>'+
							'<td>'+list[i].issuing_Time+'</td>'+
							'<td><div class="tpl-table-black-operation">'+
							'<a href="##" onclick="redact(this);"><i class="am-icon-pencil"></i> 编辑</a>'+
							'<a href="##" class="tpl-table-black-operation-del"><i class="am-icon-trash"></i> 删除</a>'+
							'</div></td>'+
							'</tr>';
						}
					}
				},
				error:function(){
					var tip=new $.zui.Messager('未知错误1！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show(); 
				}
			});
		}
		
		function redact(obj){
			var tr=obj.parentNode.parentNode.parentNode;//获取当前节点的父节点（tr）
			var title=tr.cells[0].innerText;
			var url="${pageContext.request.contextPath}/FuYanJuan/Articles.do?title="+title;
			
			console.log(url);
			window.location.href=url;
		}
		
		
	</script>
</body>

</html>