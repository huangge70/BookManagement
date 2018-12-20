<%@page import="com.domain.Record"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>借阅记录</title>
        <!--  <link href="request.getContextPath()/css/style.css" rel="stylesheet" type="text/css" /> -->
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />  
        <link href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />  
        <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    
      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
         <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-calendar.js"></script> 
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-calendar.css" /> 
		 
  </head>
  
  <body>
     <%
	 if ((String)request.getAttribute("returnBookInfo")==("success")) {
	 %>
	 <script>
	   alert("还书成功！");
	 </script>
	 <%
	 }
	 %>
	
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
						<li ><a
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
						<li class="active"><a
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
         <div class="row-fluid">
            <div id="main_page">
           
            <div id="body">
               
                <div id="content">
                    <div class="title">
                       
                    </div>
                    <div class="main" style="padding-top:30px;">
                    	<form action="<%=request.getContextPath()%>/searchRecordByDate" method="post" name="myform">
                    	请选择起始日期：
                    		<input type="text" name="beginDate" id="beginDate"  maxlength="10" onfocus="$(this).calendar()" readonly>    		
                    		请选择结束日期:
                    		<input type="text" name="endDate" id="endDate"  maxlength="10" onfocus="$(this).calendar()" readonly>
                    		<input type="submit" value="查询" class="btn btn-success">              		
                    	</form>
               
                    	<table class="table table-bordered" cellspacing="0" width="80%" align="center">
                    		<tr>
                    			<th>序号</th>
                    			<th>用户名</th>
                    			<th>真实姓名</th>
                    			<th>图书编号</th>
                    			<th>书名</th>
                    			<th>操作时间</th>    
                    			<th>状态</th>                			
                    			<th>&nbsp;</th>
                    		</tr>
                    		<% 
								List<Record> record = (List<Record>)request.getAttribute("record");
								if(record.isEmpty()) {
							 %>
							 	<tr>
									<td colspan="7"><font color="red">没有借阅记录</font></td>
								</tr>
							<%
								}
								else {
							 %>	
	                    		<c:forEach items="${record}" var="r" varStatus="s">
	                    		<form method="post" action="returnBook?id=${r.id}">
	                    		<tr>
	                    			<td>${r.id}</td>
	                    			<td>${r.username}</td>
	                    			<td>${r.name}</td>
	                    			<td>${r.bid}</td>
	                    			<td>${r.bookname}</td>	                    			
	                    			<td>${r.time}</td>	                    			
	                    			<td>${r.state}</td>	                    			
	                    			<td>
	                    				<c:if test="${r.state == '已借'}">
	                    					<input class="btn btn-success" type="submit" value="还书" >
	                    				</c:if>
	                    				<c:if test="${b.state == '已还'}">
	                    					&nbsp;	                    		
	                    				</c:if>
	                    			</td>
	                              </form>
	                    		</tr>
	                    		
	                    		</c:forEach>
                    		<%} %>
                    	</table>	
                   
                    	<ul class="pager">
						    <li><a href="<%=request.getContextPath()%>/searchBook?flag=first">首页</a></li>
						    <li><a href="<%=request.getContextPath()%>/searchBook?flag=pre">&larr;上一页</a></li>
						    <li><a href="<%=request.getContextPath()%>/searchBook?flag=next">下一页&rarr;</a></li>
						    <li><a href="<%=request.getContextPath()%>/searchBook?flag=last">尾页</a></li>
						    <form action="searchBook?flag=define" method="post">
						            跳转到第<input type="text" name="page">页
						      <button type="submit" class="btn btn-info">跳转</button>
						    </form>	
						</ul>	
							
					</div>    
                </div>  <!--content-->
            </div>  <!--body-->
        </div>
           
          </div><!--/row-->
        </div><!--/span-->
      </div><!--/row-->
      
      <hr>


		<div align="center">
			<br> Copyright © 2018, 北京信息科技大学信息管理学院<br>
			信息管理与信息系统信管1401<br> All Rights Reserved
		</div>


	</div>
	<!--/.fluid-container-->
  </body>
</html>
