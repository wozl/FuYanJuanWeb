<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>首页</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/zui/css/zui.min.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/lib/jquery/jquery.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/zui/js/zui.min.js" ></script>
		
	</head>
	<body>
		
		<!--
        	作者：LQ
        	时间：2018-04-08
        	描述：顶部导航栏
        -->
		<div>
			<nav class="navbar navbar-default" role="navigation">
			  <div class="container-fluid">
			    <!-- 导航头部 -->
			    <div class="navbar-header" id="time">
			      ...
			    </div>
			    <!-- 导航项目 -->
			    <div class="collapse navbar-collapse navbar-collapse-example">
			      
			      <!-- 右侧的导航项目 -->
			      <ul class="nav navbar-nav navbar-right" id="home">
			        <li><a href="<%=request.getContextPath() %>/FuYanJuan/loginIndex.do" >登录</a></li>
			        <li class="dropdown">
			          <a href="<%=request.getContextPath() %>/FuYanJuan/regindex.do"  class="dropdown-toggle">注册</a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
		</div>
		<script type="text/javascript">
			//动态显示时间
			var days= new Array("日","一","二","三","四","五","六");
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
				theDateStr="<iframe width='280' scrolling='no' height='40'  style='margin-top: 6px;' frameborder='0' allowtransparency='true' src='http://i.tianqi.com/index.php?c=code&id=34&icon=1&num=3'></iframe>"+"<ul class='nav navbar-nav navbar-left'><li><a href='##'>现在是："+"<strong>"+y+"</strong>"+"年"+"<strong>"+m+"</strong>"+"月"+"<strong>"+date+"</strong>"+"日"+"星期："+"<strong>"+days[day]+"</strong>"+"  "+"<strong>"+hs+"</strong>"+"："+"<strong>"+ms+"</strong>"+"："+"<strong>"+ss+"</strong></a></li></ul>";
 			document.getElementById("time").innerHTML=theDateStr;
			}
			//定时函数，每隔一秒调用一次
			window.setInterval(nowTime(),1000);
		</script>
		<!--
        	作者：LQ
        	时间：2018-03-13
        	描述：首页轮播
        -->
        <div style="height: 50%; width: 50%; margin-left: 20%; margin-right: 20%;">
        	<div id="MyNiceCarousel" class="carousel slide" data="carousel">
        		<!--
                	作者：LQ
                	时间：2018-03-13
                	描述：原点指示器
                -->
                <ol class="carousel-indicators">
                	<li data-target="#MyNiceCarousel" data-slide-to="0" class="active"></li>
                	<li data-target="#MyNiceCarousel" data-slide-to="1"></li>
                	<li data-target="#MyNiceCarousel" data-silde-to="2"></li>
                	<li data-target="#MyNiceCarousel" data-silde-to="3"></li>
                </ol>
                <!--
                	作者：LQ
                	时间：2018-03-13
                	描述：轮播项目
                -->
                <div class="carousel-inner">
                	<div class="item active">
                		<img src="<%=request.getContextPath() %>/img/1.jpg" />
                		<div class="carousel-caption">
                			<h3>学院美景</h3>
                			
                		</div>
                	</div>
                	<div class="item">
                		<img src="<%=request.getContextPath() %>/img/2.jpg" />
                		<div class="carousel-caption">
                			<h3>学院美景1</h3>
                		
                		</div>
                	</div>
                	<div class="item">
                		<img src="<%=request.getContextPath() %>/img/3.jpg" />
                		<div class="carousel-caption">
                			<h3>学院美景2</h3>
                			
                		</div>
                	</div>
                	<div class="item">
                		<img src="<%=request.getContextPath()%>/img/4.jpg" />
                		<div class="carousel-caption">
                			<h3>学院美景3</h3>
                			
                		</div>
                	</div>
                </div>
                <!--
                	作者：LQ
                	时间：2018-03-13
                	描述：项目切换按钮
                -->
                <a class="left carousel-control" href="#MyNiceCarousel" data-slide="prev">
				    <span class="icon icon-chevron-left"></span>
				</a>
				<a class="right carousel-control" href="#MyNiceCarousel" data-slide="next">
				    <span class="icon icon-chevron-right"></span>
				</a>
        	</div>
        </div>
        <!--
        	作者：LQ
        	时间：2018-03-22
        	描述：文章区
        -->
        <div>
        	<ul class="nav nav-tabs">
        		<li class="active"><a href="##">学生文章</a></li>
        	</ul>
        	<!--
            	作者：LQ
            	时间：2018-03-22
            	描述：文章列表
            -->
            <div class="list" id="contents_of_article">
            	<header>
            		<h3><i class="icon-list-ul"></i>最新动态<samp>更新<span id="count" style="color: red;"></span>条</samp></h3>
            	</header>
            	<div class="items items-hover" id="ArticeCount">
            	</div>
            	<!--
                	作者:LQ
                	时间：2018-03-22
                	描述：分页条
                -->
            	<footer>
            		<ul class="pager" id="pager">
            			
            		</ul>
            	</footer>
            </div>
        </div>
        
        <!--
        	作者：LQ
        	时间：2018-03-22
        	描述：留言板
        -->
        <div>
        	<ul class="nav nav-tabs">
        		<li class="active"><a href="##">留言板</a></li>
        	</ul>
        	<div class="comments">
        		<header>
        			
        			<h3>所有留言</h3>
        		</header>
        		<div>
        		<div class="comment"  style="overflow:scroll;height:250px;" id="message_board">
        			
        		</div>
        		</div>
        		
        		<!--
                	作者：LQ
                	时间：2018-03-22
                	描述：留言发布区
                -->
                <footer>
                	<div class="reply-form">
                		<a href="##" class="avatar"><i class="icon-user icon-2x"></i></a>
                		<form class="form">
					        <div class="form-group">
					          <textarea id="messaecontent" class="form-control new-comment-text" rows="2" placeholder="撰写评论..."></textarea>
					        </div>
					        <div class="form-group comment-user">
					          <div class="row" id="messageBtn">
					            <div class="pull-left"><button  class="btn btn-primary" onclick="checkmessage()"><i class="icon icon-comment-alt"></i>发表留言</button></div>
					          </div>
					        </div>
					     </form>
                	</div>
                </footer>
        	</div>
        </div>
        
        <!--
        	作者：LQ
        	时间：2018-03-22
        	描述：照片墙
        -->
        <div>
        	<ul class="nav nav-tabs">
        		<li class="active"><a href="##">相片墙</a></li>
        	</ul>
        	<!--<div>
        		<a href="img/c.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="img/c.jpg" width="200" height="200" class="img-rounded" alt=""></a>
				<a href="img/c.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="img/c.jpg" width="200" height="200" class="img-rounded" alt=""></a>
				<a href="img/c.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="img/c.jpg" width="200" height="200" class="img-rounded" alt=""></a>
        	</div>-->
        	<div id="img_wall">
        	
        	</div>
        	<%--  <div style="width: 250px;height: 200px;float: left;">
        		<a class="card" href="###">
				  <img src="<%=request.getContextPath() %>/img/c.jpg" width="250" height="200" alt="">
				  <div class="card-heading"><strong>良辰美景</strong></div>
				  <div class="card-content text-muted">良辰美景奈何天，赏心乐事谁家院。</div>
				</a>
        	</div>
        	
        	<div style="width: 250px;height: 200px; float: left;">
        		<a class="card" href="###">
				  <img src="<%=request.getContextPath() %>/img/c.jpg" width="250" height="200" alt="">
				  <div class="card-heading"><strong>良辰美景</strong></div>
				  <div class="card-content text-muted">良辰美景奈何天，赏心乐事谁家院。</div>
				</a>
        	</div>
        	
        	<div style="width: 250px;height: 200px; float: left;">
        		<a class="card" href="###">
				  <img src="<%=request.getContextPath() %>/img/c.jpg" width="250" height="200" alt="">
				  <div class="card-heading"><strong>良辰美景</strong></div>
				  <div class="card-content text-muted">良辰美景奈何天，赏心乐事谁家院。</div>
				</a>
        	</div> --%>
        </div>
	</body>
	<script type="text/javascript">
			window.onload=function(){
				CheckLogin();
				studentarticle();
				loadMessage();
				photo_wall();
			}
			function CheckLogin(){//检查是否有用户登录
				 var name="${sessionScope.username}";
				console.log(name);
			 	if(name.length==0){
					document.getElementById("home").innerHTML='<li><a href="<%=request.getContextPath() %>/FuYanJuan/loginIndex.do" >登录</a></li>'+
					'<li class="dropdown"><a href="<%=request.getContextPath() %>/FuYanJuan/regindex.do"  class="dropdown-toggle">注册</a></li>';
				}else{
					document.getElementById("home").innerHTML='<li><a href="##">欢迎您：${sessionScope.username}</a></li>'+
					'<li class="dropdown"><a href="${pageContext.request.contextPath}/FuYanJuan/checkadmin.do" class="dropdown-toggle"><span class="icon icon-home"></span>我的小屋</a></li>';
				} 
				
			}
			
			function studentarticle(){
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/FuYanJuan/ArticleAll.do',
					data:{},
					success:function(data){
						
						document.getElementById("ArticeCount").innerHTML='';
						var list=data.lists;
						if(list.length>0){
							for(var i=0;i<list.length;i++){
								//document.getElementById("ArticeCount").innerHTML='';
		            			var text=list[i].content;
		            			if(text.length>0){
		            				text=text.substring(0,9)+"...";
		            			}
		            			document.getElementById("ArticeCount").innerHTML+='<div class="item">'+
		            			'<div class="item-heading">'+
		            			'<h4><a href="##" onclick="test(this);">'+list[i].title+'</a></h4>'+
		            			'</div>'+
		            			'<div class="item-content">'+
		            			'<div class="text">'+
		            			text+
		            			'</div>'+
		            			'</div>'+
		            			'<div class="item-footer">'+
		            			'<a href="##" class="text-muted"><i>'+list[i].users.userName+'发布于：</i>&nbsp; <span class="text-muted">'+list[i].issuing_Time+'</span></a>'+
		            			'</div>'+
		            			'</div>';
							}
						}
						
						$('#pager').pager({
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
						
						 /* for(var j=0;j<data.totalPage;j++){
							if(j==0){
								document.getElementById("pager").innerHTML='<li class="active" onclick="getPageNo(this);"><a href="##">1</a></li>';
							}else{
								
							document.getElementById("pager").innerHTML+='<li  onclick="getPageNo(this);"><a href="##">'+(j+1)+'</a></li>';
							}
						}  */
						$("#count").text(data.totalCount);
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
				console.log(obj);
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/FuYanJuan/ArticleAll.do',
					data:{"currentPage":pages},
					beforeSend:function(){
						
						document.getElementById("ArticeCount").innerHTML='';
					},
					success:function(data){
						console.log(data);
						var list=data.lists;
						if(list.length>0){
							for(var i=0;i<list.length;i++){
								//document.getElementById("ArticeCount").innerHTML='';
		            			var text=list[i].content;
		            			if(text.length>0){
		            				text=text.substring(0,9)+"...";
		            			}
		            			document.getElementById("ArticeCount").innerHTML+='<div class="item">'+
		            			'<div class="item-heading">'+
		            			'<h4><a href="##" onclick="test(this);">'+list[i].title+'</a></h4>'+
		            			'</div>'+
		            			'<div class="item-content">'+
		            			'<div class="text">'+
		            			text+
		            			'</div>'+
		            			'</div>'+
		            			'<div class="item-footer">'+
		            			'<a href="##" class="text-muted"><i>'+list[i].users.userName+'发布于：</i>&nbsp; <span class="text-muted">'+list[i].issuing_Time+'</span></a>'+
		            			'</div>'+
		            			'</div>';
							}
						}
						
						$("#count").text(data.totalCount);
					},
					error:function(){
						var tip=new $.zui.Messager('未知错误！',{
							icon:'exclamation-sign',
							type:'danger'
						}).show();
					}
					
				});
			}
			
			function test(obj){
				var title=$(obj).text();
				var url="${pageContext.request.contextPath}/FuYanJuan/Articles.do?title="+title;
				window.location.href=url;
			}
			
			var minute=1000*60;
			var hour=minute*60;
			var day=hour*24;
			var halfamonth=day*15;
			var month=day*30;
			function getDataDiff(time){
				var result;
				var now=new Date().getTime();
				var diff=now - time;
				if(diff<0){
					alert("结束日期不能小于开始日期");
				}
				var monthc=diff/month;
				var weekc=diff/(7*day);
				var dayc=diff/day;
				var hourc=diff/hour;
				var minc=diff/minute;
				if(monthc>=1){
					result=parseInt(monthc)+"个月前";
				}else if(weekc>=1){
					result=parseInt(weekc)+"个星期前";
				}else if(dayc>=1){
					result=parseInt(dayc)+"天前";
				
				}else if(hourc>=1){
					result=parseInt(hourc)+"小时前";
				}else if(minc>=1){
					result=parseInt(minc)+"分钟前";
				}else{
					result="刚刚";
				}
				return result;
			}
			
			function loadMessage(){//加载所有留言
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/FuYanJuan/allmessage.do',
					data:{},
					beforeSend:function(){
						document.getElementById("message_board").innerHTML='';
					},
					success:function(data){
						if(data.length==0){
							document.getElementById("message_board").innerHTML='<span class="icon icon-smile">暂无留言！</span>';
						}else{
							for(var i=0;i<data.length;i++){
								var datalate=data[i].time;
								document.getElementById("message_board").innerHTML+='<div class="content">'+
								'<div class="pull-right text-muted">'+getDataDiff(new Date(datalate.replace(/-/gi,"/")).getTime())+'</div>'+
								'<div>'+
								'<a href="##"><strong>'+data[i].commenter+'</strong></a><span class="text-muted">说：</span>'
								+'</div>'+
								'<div>'+data[i].content+'</div>'
								+'</div>';
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
        	function checkmessage(){//检查并添加留言
        		var name="${sessionScope.username}";
        		if(name.length==0){//检查是否有用户登录
        			var tip=new $.zui.Messager('请先登录后再发表留言！',{
						icon:'exclamation-sign',
						type:'danger'
					}).show();
        		return false;
        		}
        		var countent=$('#messaecontent').val();
        		$.ajax({
        			type:"post",
        			url:'${pageContext.request.contextPath}/FuYanJuan/AddMessage.do',
        			async:true,
        			data:{"id":null,"Commenter":"无","Content":countent,"Time":"后台完成"},
        			beforeSend:function(){
        				document.getElementById("messageBtn").innerHTML='<button class="btn btn-primary" onclick="checkmessage()" disabled="disabled"><i class="icon icon-spin icon-spinner"></i>发表中...</button></div>';
        				
        			},
        			success:function(data){
        				if(data==0){
        					var tip=new $.zui.Messager('发表成功！',{
    							icon:'exclamation-sign',
    							type:'success'
    						}).show();
        					//location.reload();
    						
        				}else if(data==-1){
        					var tip=new $.zui.Messager('留言发表失败！',{
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
        				document.getElementById("messageBtn").innerHTML='<div class="pull-left"><button class="btn btn-primary" onclick="checkmessage()"><i class="icon icon-comment-alt"></i>发表留言</button></div>';
        			}
        		});
        	}
			
        	
        	function photo_wall(){
        		$.ajax({
        			type:'POST',
        			url:'${pageContext.request.contextPath}/FuYanJuan/allphotos.do',
        			data:{},
        			success:function(data){	
        				for(var i=0;i<data.length;i++){
        					
        					document.getElementById("img_wall").innerHTML+='<div style="width: 250px;height: 200px; float: left;">'+
        					'<a class="card" href="##">'+
        					'<img src="${pageContext.request.contextPath}/../file/'+data[i].fileUrl+'"'+'width="250" height="200" alt="">'+
        					'<div class="card-heading"><strong>'+data[i].uploader+'</strong></div>'+
        					'<div class="card-content text-muted">'+data[i].photo_Description+'</div>'
        					+'</a>'
        					+'</div>';
        				}
        			},
        			error:function(){
        				alert("网络错误");
        			}
        		});
        	}
        	
        
		</script>
</html>
