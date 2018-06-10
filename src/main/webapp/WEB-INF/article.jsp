<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		
		<title>文章展示页</title>
	</head>
	<body>
		
        <!--
        	作者：LQ
        	时间：2018-03-26
        	描述：文章详情页
        -->
        
		
		<article class="article">
			<!--
            	作者：LQ
            	时间：2018-03-26
            	描述：文章头部
            -->
            <header>
            	<h1 class="text-center">${requestScope.Title}</h1>
            	<dl class="dl-inline">
            		<dt>来源：</dt>
            		<dd>${requestScope.Author}</dd>
            		<dt>发布时间：</dt>
            		<dd>${requestScope.time}</dd>
            		<dt></dt>
            		<dd class="pull-right">
            			<span class="label label-success">最新</span>
            		</dd>
            	</dl>
            	<section class="abstract">
            		<p>
            			<strong>老师评语：</strong>
            			<span id="teachertak">革命尚未成功，同学您仍需努力！</span>
            			
            		</p>
            	</section>
            </header>
            <!--
            	作者：LQ
            	时间：2018-03-26
            	描述：文章主体
            -->
            <section class="content" >
            	<div style="white-space:pre-wrap">
            	${requestScope.Content}
            	</div>
            </section>
            <footer >
            	
            </footer>
		</article>
	</body>
	<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
	<script type="text/javascript">
	window.onload=function(){
		loadData();
	}
		function loadData(){
			
			var Comment="${requestScope.Comment}";
			if(Comment==""){
				Comment="暂无评语！";
			}
			document.getElementById("teachertak").innerText=Comment;
		}
	</script>
</html>
