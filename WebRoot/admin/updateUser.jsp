<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/pic.css">
	<script src="<%=request.getContextPath()%>/js/comm.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
    <style type="text/css">
   .navbar-collapse{
    padding-left: 5px;
    padding-right: 5px;
	 }
	 .nav>li{
	     text-align: center;
	 }
	 .nav>li>a{
	     color:#444;
	     margin: 0 5px;
	 }
	 .nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover{
	     background-color: #222222;
	 }
	 .dropdown-menu{
	     min-width: 200px;
	     margin-left: 40px;
	     background-color: #E3E3E3;
	 }
	 .dropdown-menu>li>a{
	     padding: 10px 15px;
	 }
	 body {
    width: 100%;
    height: 100%;
    margin: 0;
    overflow: hidden;
    background-color: #FFFFFF;
    font-family: "Microsoft YaHei", sans-serif;
 }
 .pageSidebar{
    width: 240px;
    height:100%;
    padding-bottom: 30px;
    overflow: auto;
    background-color: #e3e3e3;
 }
 .splitter {
     width: 5px;
     height: 100%;
     bottom: 0;
     left: 240px;
     position: absolute;
     overflow: hidden;
     background-color: #fff;
 }
 .pageContent{
     height: 100%;
     min-width: 768px;
     left: 246px;
     top: 0;
     right: 0;
     z-index: 3;
     padding-bottom: 30px;
     position: absolute;
 }
 .pageContainer{
     bottom: 0;
     left:0;
     right: 0;
     top: 53px;
     overflow: auto;
     position: absolute;
     width: 100%;
 }
 .footer {
     width: 100%;
     height: 30px;
     line-height: 30px;
     margin-top: 0;
     left: 0;
     right: 0;
     bottom: 0;
     position: absolute;
     z-index: 10;
     background-color:#DFDFDF;
 }
    </style>
    <script type="text/javascript">
		$(".nav li").click(function() {
    $(".active").removeClass('active');
    $(this).addClass("active");
});
	</script>

  </head>
  
  <body>
     <!--顶部导航栏部分-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="logoTitle" href="#">个性化图书借阅系统-管理员</a>
       </div>
       <div class="collapse navbar-collapse">
           <ul class="nav navbar-nav navbar-right">
               <li role="presentation">
                   <a href="#">当前用户：<span class="badge">${admin.name }</span></a>
               </li>
               <li>
                   <a href="logoutCl?flag=admin">
                         <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
       </div>
    </div>      
</nav>
<!-- 中间主体内容部分 -->
<div class="pageContainer">
     <!-- 左侧导航栏 -->
     <div class="pageSidebar">
         <ul class="nav nav-stacked nav-pills">
             <li class="dropdown">
                 <a class="dropdown-toggle" data-toggle="dropdown" href="#">用户管理<span class="caret"></span>
                 </a>
                 <ul class="dropdown-menu">
                     <li>
                         <a href="<%=request.getContextPath()%>/admin/addUser.jsp">新增用户</a>
                     </li>
                     <li>
                         <a href="<%=request.getContextPath()%>/searchUser?flag=first">查看用户</a>
                     </li>
                 </ul>
             </li>
             <li class="dropdown">
                 <a class="dropdown-toggle" data-toggle="dropdown" href="#">图书管理<span class="caret"></span>
                 </a>
                 <ul class="dropdown-menu">
                     <li>
                         <a href="<%=request.getContextPath()%>/admin/addBook.jsp">新增图书</a>
                     </li>
                     <li>
                         <a href="<%=request.getContextPath()%>/adminSearchBook?flag=first">查询图书</a>
                     </li>
                 </ul>
             </li>
             <li class="dropdown">
                 <a class="dropdown-toggle" data-toggle="dropdown" href="#">统计分析<span class="caret"></span>
                 </a>
                 <ul class="dropdown-menu">
                     <li>
                         <a href="<%=request.getContextPath()%>/statisticsCl?flag=borrowTj&flag2=first">借阅排行榜</a>
                     </li>
                     <li>
                         <a href="<%=request.getContextPath()%>/statisticsCl?flag=retrieval">检索排行榜</a>
                     </li>
                     <li>
                         <a href="<%=request.getContextPath()%>/statisticsCl?flag=tuijian">采购推荐统计</a>
                     </li>
                 </ul>
             </li>
             <li role="presentation">
                 <a href="<%=request.getContextPath()%>/recordCl?flag=first">借阅记录管理</a>
             </li>
         </ul>
     </div>
     <!-- 左侧导航和正文内容的分隔线 -->
     <div class="splitter"></div>
     <!-- 正文内容部分 -->
     <div class="pageContent">
        	<div class="span9">
				<div class="row-fluid">
         
                          <h3><font color="darkblue" size=3><b>请修改以下信息：</b></font></h3>
                    	<form action="<%=request.getContextPath()%>/userManagement?flag=update&username=${user.username}" method="post" name="myform">
                    		<table class="table table-bordered table-hover">
                    			<tr>
                    				<td>用户名：</td>
                    				<td>${user.username}</td>
                    			</tr>
                    			<tr>
                    				<td>真实姓名：</td>
                    				<td>${user.name}</td>
                    			</tr>                   		   
                    			<tr>
                    				<td>性&nbsp;&nbsp;别：</td>
                    				<td>${user.sex}</td>
                    			</tr>
                    			<tr>
                    				<td>用户类型：</td>
                    				<td>${user.type }</td>
               
                    			</tr>         
                    			<tr>
                    				<td>所属单位：</td>
                    				<td><input type="text" name="unit" value="${user.unit }"></td>
                    			</tr>           			
                    			<tr>
                    				<td>违规次数：</td>
                    				<td>
                    				<input type="text" name="illegal" value="${user.illegal }">                    					
                    				</td>
                    				
                    			</tr>                    			
          
                    			<tr>
                    				<td colspan="2" align="center">
                    					<button type="submit" class="btn btn-primary btn-lg btn-block" >修改</button>
                    				</td>
                    			</tr>
                    		</table>
                    	</form>
                    </div>
				<!--/row-->
			</div>
     </div>
 </div>
 <!-- 底部页脚部分 -->
 <div class="footer">
     <p class="text-center">
         2018 &copy; 北京信息科技大学信息管理学院.
     </p>
 </div>
  </body>
</html>
