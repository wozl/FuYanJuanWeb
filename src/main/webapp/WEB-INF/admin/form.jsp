<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/app.css">
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
                    <a href="<%=request.getContextPath() %>/Admin/adminIndex.do" >
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 文章管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="<%=request.getContextPath() %>/Admin/adminForm.do" class="active">
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
                                            <input type="text" class="tpl-form-input" id="user-name" placeholder="请输入标题文字">
                                            <small>请填写标题文字10-20字左右。</small>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-email" class="am-u-sm-3 am-form-label">发布时间 <span class="tpl-form-line-small-title">Time</span></label>
                                        <div class="am-u-sm-9">
                                            <input type="text" class="am-form-field tpl-form-no-bg" placeholder="发布时间" data-am-datepicker="" readonly="">
                                            <small>发布时间为必填</small>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-phone" class="am-u-sm-3 am-form-label">作者 <span class="tpl-form-line-small-title">Author</span></label>
                                        <div class="am-u-sm-9">
                                            <select data-am-selected="{searchBox: 1}" style="display: none;">
  <option value="a">-The.CC</option>
  <option value="b">夕风色</option>
  <option value="o">Orange</option>
</select>

                                        </div>
                                    </div>

                                   

                                    

                                    <!--<div class="am-form-group">
                                        <label for="user-weibo" class="am-u-sm-3 am-form-label">添加分类 <span class="tpl-form-line-small-title">Type</span></label>
                                        <div class="am-u-sm-9">
                                            <input type="text" id="user-weibo" placeholder="请添加分类用点号隔开">
                                            <div>

                                            </div>
                                        </div>
                                    </div>-->

                                    

                                    <div class="am-form-group">
                                        <label for="user-intro" class="am-u-sm-3 am-form-label">文章内容</label>
                                        <div class="am-u-sm-9">
                                            <textarea class="" rows="10" id="user-intro" placeholder="请输入文章内容"></textarea>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3">
                                            <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
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

</body>

</html>