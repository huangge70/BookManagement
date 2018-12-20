<%@ page language="java" import="java.util.*,com.domain.Book" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书查询</title>
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
		 <script type="text/javascript">
            //添加购物车
            function addCart(bid,state) {    	    	 	
            	if(state=="在架"){
            	    window.location.href="<%=request.getContextPath()%>/bookCl.java?state=1&bid="+bid+"";
            	}
            }
            
        </script>
  </head>
  
  <body>
   <%
	 if ((String)request.getAttribute("borrowInfo")==("success")) {
	 %>
	 <script>
	   alert("借书成功！");
	 </script>
	 <%
	 }
	 %>
	 <%
	 if ((String)request.getAttribute("bookingInfo")==("success")) {
	 %>
	 <script>
	   alert("预定成功！");
	 </script>
	 <%
	 }
	 %>
	  <%
	 if ((String)request.getAttribute("tjInfo")==("success")) {
	 %>
	 <script>
	   alert("推荐提交成功！");
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
						<li class="active"><a
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
         <div class="row-fluid">
            <div id="main_page">
           
            <div id="body">
               
                <div id="content">
                    <div class="title">
                       
                    </div>
                    <div class="main" style="padding-top:30px;">
                    	<form action="<%=request.getContextPath()%>/searchBook?flag=search" method="post" name="myform">
                    	请输入书名：
                    		<input type="text" name="bookname">    		             
                    		<button type="submit" class="btn btn-warning">查询</button>                  		
                    	</form>
                    	<table class="table table-bordered" cellspacing="0" width="80%" align="center">
                    		<tr>
                    			<th>序号</th>
                    			<th>图书编号</th>
                    			<th>典藏部门</th>
                    			<th>书名</th>
                    			<th>作者</th>
                    			<th>出版社</th>
                    			<th>出版时间</th>
                    			<th>状态</th>
                    			<th>价格</th>
                    			<th>&nbsp;</th>
                    		</tr>
                    		<% 
								List<Book> book = (List<Book>)request.getAttribute("book");
								if(book.isEmpty()) {
							 %>
							 	<tr>
									<td colspan="9"><font color="red">没有图书</font></td>
								</tr>
								<tr>
									<td colspan="9"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">图书采购推荐</button></td>
								</tr>
							<%
								}
								else {
							 %>	
	                    		<c:forEach items="${book}" var="b" varStatus="s">
	                    		<form method="post" action="bookCl?state=${b.state}&bid=${b.id}">
	                    		<tr>
	                    			<td>${b.id}</td>
	                    			<td>${b.bid}</td>
	                    			<td>${b.collection}</td>
	                    			<td>${b.bookname}</td>
	                    			<td>${b.author}</td>
	                    			<td>${b.press}</td>
	                    			<td>${b.time}</td>
	                    			<td>${b.state}</td>
	                    			<td>${b.price}</td>
	                    			<td>
	                    				<c:if test="${b.state == '在架'}">
	                    					<input class="btn btn-success" type="submit" value="借阅" >
	                    				</c:if>
	                    				<c:if test="${b.state == '借出'}">
	                    					<input class="btn btn-danger" type="submit" value="预定" >	                    		
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
      
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label" align="center">图书采购推荐</h4>
                </div>
                <div class="modal-body">
                   <form class="form-horizontal" role="form" method="post" action="userFunction?flag=purchasetj">
                       <table>
                         <tr>
							<div class="form-group">
							<td><label for="firstname" class="col-sm-2 control-label">书名:</label></td>
								<td><div class="col-sm-10">
									<input type="text" class="form-control" id="firstname" name="bookname"
										   placeholder="请输入图书名">
								</div></td>
							</div>
						</tr>
						<tr>
							<div class="form-group">
								<td><label for="lastname" class="col-sm-2 control-label">作者:</label></td>
								<td><div class="col-sm-10">
									<input type="text" class="form-control" id="lastname" name="author"
										   placeholder="请输入作者(选填)">
								</div></td>
							</div>
							</tr>
							<tr>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10" >
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="submit" class="btn btn-success" >提交</button></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="reset" class="btn btn-warning">重置</button></td>
								</div>
							</div>
							</tr>
						</table>
					</form>
                </div>
              
            </div>
        </div>
    </div>
      
      <hr>


		<div align="center">
			<br> Copyright © 2018, 北京信息科技大学信息管理学院<br>
			信息管理与信息系统信管1401<br> All Rights Reserved
		</div>


	</div>
	<!--/.fluid-container-->
  </body>
</html>
