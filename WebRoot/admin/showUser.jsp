<%@ page language="java" import="java.util.*,com.domain.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询用户</title>
    
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
     <%
	 if ((String)request.getAttribute("deleteUserInfo")==("success")) {
	 %>
	 <script>
	   alert("删除用户成功！");
	 </script>
	 <%
	 }
	 %>
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
            <div id="main_page">
           
            <div id="body">
               
                <div id="content">
                    <div class="title">
                       
                    </div>
                    <div class="main" style="padding-top:30px;">
                    	<form action="<%=request.getContextPath()%>/searchUser?flag=search" method="post" name="myform">
                    	请输入用户名：
                    		<input type="text" name="username">    		             
                    		<button type="submit" class="btn btn-warning">查询</button>                  		
                    	</form>
                    	<table class="table table-bordered" cellspacing="0" width="80%" align="center">
                    		<tr>
                    			<th>用户名</th>
                    			<th>真实姓名</th>
                    			<th>密码</th>
                    			<th>性别</th>
                    			<th>用户类型</th>
                    			<th>单位</th>
                    			<th>违规次数</th>                   			
                    			<th>操作</th>
                    		</tr>
                    		<% 
								List<User> user = (List<User>)request.getAttribute("user");
								if(user.isEmpty()) {
							 %>
							 	<tr>
									<td colspan="9"><font color="red">没有用户</font></td>
								</tr>
								
							<%
								}
								else {
							 %>	
	                    		<c:forEach items="${user}" var="u" varStatus="s">
	                    		
	                    		<tr>
	                    			<td>${u.username}</td>
	                    			<td>${u.name}</td>
	                    			<td>${u.password}</td>
	                    			<td>${u.sex}</td>
	                    			<td>${u.type}</td>
	                    			<td>${u.unit}</td>
	                    			<td>${u.illegal}</td>
	                    			<td>
	                    			  <button type="button" class="btn btn-warning" onclick="window.location.href('userManagement?flag=search&username='+${u.username})" >修改</button>
                                      <button type="button" class="btn btn-danger" onclick="window.location.href('userManagement?flag=delete&username='+${u.username})" >删除</button>	                    			  
	                    			</td>	                    				             
	                             
	                    		</tr>
	                    		
	                    		</c:forEach>
                    		<%} %>
                    	</table>	
                   
                    	<ul class="pager">
						    <li><a href="<%=request.getContextPath()%>/searchUser?flag=first">首页</a></li>
						    <li><a href="<%=request.getContextPath()%>/searchUser?flag=pre">&larr;上一页</a></li>
						    <li><a href="<%=request.getContextPath()%>/searchUser?flag=next">下一页&rarr;</a></li>
						    <li><a href="<%=request.getContextPath()%>/searchUser?flag=last">尾页</a></li>
						    <form action="searchUser?flag=define" method="post">
						            跳转到第<input type="text" name="userPage">页
						      <button type="submit" class="btn btn-info">跳转</button>
						    </form>	
						</ul>	
							
					</div>    
                </div>  <!--content-->
            </div>  <!--body-->
        </div>
           
          </div><!--/row-->
        </div><!--/span-->
        
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
