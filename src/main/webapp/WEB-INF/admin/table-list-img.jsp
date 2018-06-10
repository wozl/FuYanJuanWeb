<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>照片墙</title>
    <meta name="description" content="后台页面">
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
                    <a href="<%=request.getContextPath() %>/Admin/adminIndex.do">
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
                    <a href="<%=request.getContextPath() %>/Admin/adminPhoto_wall.do" class="active">
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
                                <div class="widget-title  am-cf"><span class="am-icon-th-large"></span>&nbsp;照片墙</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <!--
                                	作者：LQ
                                	时间：2018-04-07
                                	描述：zui文件上传组件
                                -->
                                <link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.lite.min.css" />
                                <link rel="stylesheet" href="<%=request.getContextPath() %>/zui/lib/uploader/zui.uploader.min.css" />
                                <script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
								<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
								<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/uploader/zui.uploader.min.js" ></script>
                                <div class="input-control has-label-left">
								  <input id="photomsg" type="text" class="form-control" placeholder="">
								  <label for="inputAccountExample3" class="input-control-label-left text-right">请输入照片描述</label>
								</div>
                                <div id='uploadFile' class="uploader"  >
									  <div class="uploader-message text-center">
									    <div class="content"></div>
									    <button type="button" class="close">×</button>
									  </div>
									  <div class="uploader-files file-list file-list-lg" data-drag-placeholder="请拖拽文件到此处"></div>
									  <div class="uploader-actions">
									    <div class="uploader-status pull-right text-muted"></div>
									    <button type="button" class="btn btn-link uploader-btn-browse"><i class="icon icon-plus"></i> 选择文件</button>
									    <button type="button" class="btn btn-link uploader-btn-start"><i class="icon icon-cloud-upload"></i> 开始上传</button>
									  </div>
									  <span style="color: red">只能上传jpg,gif,png,jpeg格式，最大5MB，不符合要求会自动过滤</span>
								</div>
								<!--
                                	作者：LQ
                                	时间：2018-04-07
                                	描述：文件上传控制器
                                -->
                                <script type="text/javascript">
                                var msgphoto=$('#photomsg').val();
                                	console.log(msgphoto);
                                $('#uploadFile').uploader({
                        			//autoUpload:true,//选择文件后自动上传
                        			filters:{
                        				mime_types:[
                        					{title:'图片',extensions:'jpg,gif,png,jpeg'},
                        					{title:'图标',extensions:'ico'}
                        				],
                        				max_file_size:'5mb',
                        				prevent_duplicates:true
                        			},
                        			chunk_size:0,
                        			multipart_params:function(){
                        				return{FileUrl:"",Photo_Description:$("#photomsg").val(),Uploader:'<%=session.getAttribute("username")%>'};
                        			},
                        			url:'${pageContext.request.contextPath}/Admin/addPhoto.do'
                        		});
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="<%=request.getContextPath() %>/assets/js/amazeui.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/app.js"></script>

</body>

</html>