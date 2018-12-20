<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人中心</title>
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
		
	    
		<script type="text/javascript">
			function check() {
        		var password = $("#password").val();
        		var confirmPass = $("#confirmPass").val();
        		var gender1 = $("#gender1").val();
        		var gender0 = $("#gender0").val();  		
        		if(password == "") {
        			$("#passwordInfo > font").text("请输入密码");
        			haserror=true;
        		}
        		else {
        			$("#passwordInfo > font").text("");
        		}
        		if(confirmPass == "") {
        			$("#confirmPassInfo > font").text("请输入确认密码");
        			haserror=true;
        		}
        		else {
        			if(password != confirmPass) {
        				$("#confirmPassInfo > font").text("确认密码与密码不一致");
        				haserror=true;
        			}
        			else {
        				$("#confirmPassInfo > font").text("");
        			}
        		}
        		if(gender1 == "" && gender0 == "") {
        			$("#genderInfo > font").text("请选择性别");
        			haserror=true;
        		}
        		else {
        			$("#genderInfo > font").text("");
        		}
        		if(!haserror)
        			document.myform.submit();
        	 	else 
        	 		return;
        	}
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
    <%
	 if ((String)request.getAttribute("updateUser")==("success")) {
	 %>
	 <script>
	   alert("操作成功！");
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
								<i class="icon-home"></i> 首&nbsp;&nbsp;&nbsp;&nbsp;页</a>
						</li>
						<li class="active"><a
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
				<div class="row-fluid">
         
                          <h3><font color="darkblue" size=3><b>请修改以下信息：</b></font></h3>
                    	<form action="<%=request.getContextPath()%>/updateUserInfo" method="post" name="myform">
                    		<table class="table table-bordered table-hover">
                    			<tr>
                    				<td>用户名：${user.username}&nbsp;&nbsp;&nbsp;</td>
                    				<td>真实姓名：${user.name}</td>
                    			</tr>
                    			<tr>
                    				<td>新密码：</td>
                    				<td>
                    					<input type="password" name="password" id="password" >
                    					<span id="passwordInfo"><font color="red"></font></span>
                    				</td>
                    			</tr>
                    			<tr>
                    				<td>密码确认：</td>
                    				<td>
                    					<input type="password" name="confirmPass" id="confirmPass" >
                    					<span id="confirmPassInfo"><font color="red"></font></span>
                    				</td>
                    			</tr>
      
                    			<tr>
                    				<td>性&nbsp;&nbsp;别：</td>
                    				<td>
                    					<input type="radio" name="sex" value="男" id="gender1" 
                    					<c:if test="${user.sex == '男'}">checked="checked"</c:if>
                    					>男
                    					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    					<input type="radio" name="sex" value="女" id="genger0"
                    					<c:if test="${user.sex == '女'}">checked="checked"</c:if>
                    					>女
                    					<span id="genderInfo"><font color="red"></font></span>
                    				</td>
                    			</tr>
                    			<tr>
                    				<td>用户类型：</td>
                    				<td>
                    					${user.type }
               
                    				</td>
               
                    			</tr>         
                    			<tr style="display:none;">
                    				<td>所属单位：</td>
                    				<td>${user.unit }</td>
                    			</tr>           			
                    			<tr>
                    				<td>违规次数：</td>
                    				<td>
                    					${user.illegal }
                    				</td>
                    				
                    			</tr>                    			
          
                    			<tr>
                    				<td colspan="2" align="center">
                    					<button type="submit" class="btn btn-primary btn-lg btn-block" onclick="check()" >修改</button>
                    				</td>
                    			</tr>
                    		</table>
                    	</form>
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
