<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>用户主页</title>
		<!--  <link href="request.getContextPath()/css/style.css" rel="stylesheet" type="text/css" /> -->
		<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css"
			rel="stylesheet" type="text/css" />
		
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/css/pic.css">
		<script src="<%=request.getContextPath()%>/js/comm.js"
			type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/jquery.js"
			type="text/javascript"></script>
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>		    
		<script>
			$(function() {
				new ZoomPic("jswbox");
		
			});
		</script>


		<style type="text/css">
		body {
			padding-top: 60px;
			padding-bottom: 40px;
		}
		
		.sidebar-nav {
			padding: 9px 0;
		}
		
		@media ( max-width : 980px) { /* Enable use of floated navbar text */
			.navbar-text.pull-right {
				float: none;
				padding-left: 5px;
				padding-right: 5px;
			}
		}
		</style>

  </head>
  
  <body>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              当前用户： <a href="#" class="navbar-link"> ${user.name}</a>
            </p>
            <ul class="nav">
              <li style="margin-left:20px;"><a><b><font color="white" size="4">个性化图书借阅系统-用户</font></b></a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						<li class="active"><a
							href="<%=request.getContextPath()%>/user/index.jsp" id="mainpage"
							class="optionbar" style="padding:15px;
      font-size:15px">
								<i class="icon-home"></i>首&nbsp;&nbsp;&nbsp;&nbsp;页</a>
						</li>
						<li><a
							href="<%=request.getContextPath()%>/user/updateUserInfo.jsp"
							class="optionbar" style="padding:15px;
      font-size:15px"><i
								class="icon-film"></i>个人中心 </a>
						</li>
						<li><a
							href="<%=request.getContextPath()%>/searchBook?flag=first"
							class="optionbar" style="padding:15px;
      font-size:15px"><i
								class="icon-shopping-cart"></i>图书查询</a>
						</li>
						<li><a
							href="<%=request.getContextPath()%>/searchRecord"
							class="optionbar" style="padding:15px;
      font-size:15px">
								<i class="icon-user"></i>借阅记录</a>
						</li>
						<li><a
							href="<%=request.getContextPath()%>/recommendation"
							class="optionbar" style="padding:15px;
      font-size:15px"><i
								class=" icon-plus"></i>个性化推荐</a>
						</li>
						<li><a href="<%=request.getContextPath()%>/logoutCl?flag=user"
							class="optionbar" style="padding:15px;
      font-size:15px"><i
								class="icon-remove"></i> 退&nbsp;&nbsp;&nbsp;&nbsp;出 </a>
						</li>
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->

			<div class="span9">
				<div id="jswbox">
					<pre class="prev">prev</pre>
					<pre class="next">next</pre>
					<ul>
	<li style="display: block; width: 262px; height: 300px; left: 0px;   z-index: 1; top: 152px; "><img src="<%=request.getContextPath()%>/images/c.jpg"  style="opacity: 87; "></li>
    <li style="display: block; width: 262px; height: 389px; left: 0px;   z-index: 2; top: 152px;"><img src="<%=request.getContextPath()%>/images/java.jpg"  style="opacity: 87; "></li>
    <li style="display: block; width: 262px; height: 389px; left: 200px; z-index: 3; top: 152px;"><img src="<%=request.getContextPath()%>/images/jsj.jpg"  style="opacity: 87; "></li>
    <li style="display: block; width: 320px; height: 389px; left: 388px; z-index: 4; top: 124px; "><img src="<%=request.getContextPath()%>/images/jsjjc.gif"  style="opacity: 87; "></li>
    <li style="display: block; width: 262px; height: 389px; left: 668px; z-index: 3; top: 152px; "><img src="<%=request.getContextPath()%>/images/sjjg.jpg"  style="opacity: 87; "></li>
    <li style="display: block; width: 262px; height: 389px; left: 834px; z-index: 2; top: 152px; "><img src="<%=request.getContextPath()%>/images/jsjwl.jpg"  style="opacity: 87; "></li>
    
					
					</ul>
				</div>

				<div class="row-fluid" style="margin-top:130px;">

					<div class="hero-unit">
						<p>
							– 到图书馆借书的读者凭本馆的借书证借书，借书证只限本人使用，不得转借。 <br /> –
							读者对所借图书须经当面检查，否则在还书时发现污损、勾画、缺页等，概由本人负责。 <br /> –
							所借图书丢失要赔偿，金额为书价2至4倍，损坏书刊封面、封底，书页脱落和书标、磁条遗失，或在书中批阅、圈划、污损者视情节赔偿。 <br />
						</p>
					</div>
				</div>
				<!--/row-->
			</div>
			<!--/span-->
		</div>
		<!--/row-->

		<hr>


		<div align="center">
			<br> Copyright © 2018, 北京信息科技大学信息管理学院<br>
			信息管理与信息系统信管1401<br> All Rights Reserved
		</div>


	</div>
	<!--/.fluid-container-->
  </body>
</html>
