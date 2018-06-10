<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户管理</title>
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
                            <a href="<%=request.getContextPath()%>/Admin/loginout.do">
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
                    <a href="<%=request.getContextPath() %>/Admin/adminIndex.do" class="active">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 文章管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/Admin/adminForm.do">
                        <i class="am-icon-wpforms sidebar-nav-link-logo"></i> 发布文章

                    </a>
                </li>
                
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/Admin/admintables.do">
                        <i class="am-icon-pencil sidebar-nav-link-logo"></i> 文章评阅

                    </a>
                </li>
                
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/Admin/adminchart.do">
                        <i class="am-icon-user sidebar-nav-link-logo"></i> 学生管理

                    </a>
                </li>
                
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/Admin/adminPhoto_wall.do">
                        <i class="am-icon-th-large sidebar-nav-link-logo"></i> 照片墙

                    </a>
                </li>
                
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/Admin/index.do">
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
                                <div class="widget-title  am-cf"><span class="am-icon-users "></span>&nbsp;学生管理</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                      <div class="input-group">
										<div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
										   <input id="inputSearchExample3" type="search" class="form-control search-input" placeholder="搜索">
										   <label for="inputSearchExample3" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
										</div>
										<span class="input-group-btn">
										   <button class="btn btn-primary" type="button" onclick="search();">搜索</button>
										</span>
									</div>
                                    <div style="display: none;" id="tips">
										<select  class="chosen-select form-control" tabindex="2" multiple="" id="options">
										
										</select>
									</div>
                                </div>

                                <div class="am-u-sm-12">
                                    <table width="100%"   class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>用户名</th>
                                                <th>注册时间</th>
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
                                        <ul class="am-pagination tpl-pagination" id="page">
                                           
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
    	
    	AllUser();
    }
    function AllUser(){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/Admin/alluser.do',
			data:{},
			success:function(data){
				
				document.getElementById("TableContent").innerHTML="";
				var list=data.lists;
				if(list.length>0){
					 for(var i=0;i<list.length;i++){
						 var text=list[i].content;
						document.getElementById("TableContent").innerHTML+='<tr class="even gradeX">'+
						'<td>'+list[i].id+'</td>'+
						'<td>'+list[i].userName+'</td>'+
						'<td>'+list[i].registration_Time+'</td>'+
						'<td><div class="tpl-table-black-operation">'+
						'<a href="##" onclick="redact(this)"><i class="am-icon-pencil"></i> 重置密码</a>'+
						'<a href="##" class="tpl-table-black-operation-del"><i class="am-icon-trash"></i> 删除</a>'+
						'</div></td>'+
						'</tr>';
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
				}else{
					document.getElementById("TableContent").innerHTML='<center>无记录</center>'
				}
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
		
		var pages=parseInt(obj);
		
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/Admin/alluser.do',
			data:{"currentPage":pages},
			beforeSend:function(){
				document.getElementById("TableContent").innerHTML='';
			},
			success:function(data){
				
				var list=data.lists;
				if(list.length>0){
					
					for(var i=0;i<list.length;i++){
						 var text=list[i].content;
						document.getElementById("TableContent").innerHTML+='<tr class="even gradeX">'+
						'<td>'+list[i].id+'</td>'+
						'<td>'+list[i].userName+'</td>'+
						'<td>'+list[i].registration_Time+'</td>'+
						'<td><div class="tpl-table-black-operation">'+
						'<a href="##" onclick="redact(this)"><i class="am-icon-pencil"></i> 重置密码</a>'+
						'<a href="##" class="tpl-table-black-operation-del"><i class="am-icon-trash"></i> 删除</a>'+
						'</div></td>'+
						'</tr>';
					}
				}
			
			},
			error:function(){
				var tip=new $.zui.Messager('未知错误！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show(); 
			}
		});
	}
    
    
    function redact(obj){//单击编辑按钮跳转到编辑页面
    	var tr=obj.parentNode.parentNode.parentNode;//获取当前节点的父节点（tr）
    	var title=tr.cells[1].innerText;
    	var url="${pageContext.request.contextPath}/Admin/ArticleEdit.do?title="+title;
    	window.location.href=url;
    }
    
    $('#inputSearchExample3').searchBox({
		escToClear: true,// 设置点击 ESC 键清空搜索框
		changeDelay:0,
		onSearchChange:function(a,b){//文本框发送变化时立即触发
			Fuzzy_search(a);
			
		}
	});
    
    function Fuzzy_search(obj){//模糊搜索
		var name=obj;
		$.ajax({
				type:'post',
				url:"${pageContext.request.contextPath}/Admin/SearchByName.do",
				data:{"name":name},
				success:function(data){
					console.log(data);
					document.getElementById("tips").style.display="block";
					document.getElementById("options").options.length=0;
					if(data.length==0){
						$("#options").append('<option value="" onclick="get(this);">无记录...</option>');
					}else{
						for(var i=0;i<data.length;i++){
							$("#options").append('<option value="'+data[i].userName+'" onclick="get(this);">'+data[i].userName+'</option>');
						}
					}
				},
				error:function(){
					var tip=new $.zui.Messager('未知错误！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show(); 
				}
			});
	}
    
    function get(obj){
    	document.getElementById("inputSearchExample3").value=obj.value;
		document.getElementById("tips").style.display="none";
		document.getElementById("options").options.length=0;
    }
    
    function search(){
		var value=document.getElementById("inputSearchExample3").value;
		console.log(value);
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/Admin/UsersInfo.do',
			data:{"name":value},
			success:function(data){
						document.getElementById("TableContent").innerHTML="";
						document.getElementById("TableContent").innerHTML+='<tr class="even gradeX">'+
						'<td>'+data.id+'</td>'+
						'<td>'+data.userName+'</td>'+
						'<td>'+data.registration_Time+'</td>'+
						'<td><div class="tpl-table-black-operation">'+
						'<a href="##" onclick="redact(this)"><i class="am-icon-pencil"></i> 重置密码</a>'+
						'<a href="##" class="tpl-table-black-operation-del"><i class="am-icon-trash"></i> 删除</a>'+
						'</div></td>'+
						'</tr>';
			},
			error:function(){
				var tip=new $.zui.Messager('未知错误！',{
					icon:'exclamation-sign',
					type:'danger'
				}).show(); 
			}
		});
	}
    
    </script>
</body>

</html>