<%@page import="com.dzf.ssxk.SH.util.util"%>
<%@page import="com.dzf.ssxk.SH.model.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MAINNAVBAR.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="shortcut icon" href="img/favicon.ico">
    
	<!-- global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/font-icon-style.css">
	<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

	<!-- Core stylesheets -->
	<link rel="stylesheet" href="css/form.css">
	<script type="text/javascript" src="layer/jquery.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
	
  </head>
  
  <body>
  
 <%--  <% Admin ad=(Admin)(request.getSession().getAttribute("user"));%> --%>
<!--====================================================
                     MAIN NAVBAR
======================================================-->
<header class="header">

	<nav class="navbar navbar-expand-lg ">
			<div class="search-box">
					<button class="dismiss"><i class="icon-close"></i></button>
					<form id="searchForm" action="#" role="search">
							<input type="search" placeholder="Search Now" class="form-control">
					</form>
			</div>
			<div class="container-fluid ">
					<div class="navbar-holder d-flex align-items-center justify-content-between">
							<div class="navbar-header">
									<a href="index.html" class="navbar-brand">
											<div class="brand-text brand-big hidden-lg-down">
												<h4>学生选课系统</h4>
											</div>
											<div class="brand-text brand-small"><img src="img/logo-icon.png" alt="Logo" class="img-fluid"></div>
									</a>
									<a id="toggle-btn" href="#" class="menu-btn active">
											<span></span>
											<span></span>
											<span></span>
									</a>
									<a id="toggle-btn" href="#" class="menu-btn active">
											<h5>---管理端---</h5>
									</a>
							</div>
					</div>
					<ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
							<!-- Expand-->
							<!-- <li class="nav-item d-flex align-items-center full_scr_exp"><a class="nav-link" href="#"><img src="img/expand.png" onclick="toggleFullScreen(document.body)" class="img-fluid" alt=""></a></li> -->
							<li class="nav-item d-flex align-items-center full_scr_exp"><a class="nav-link" href="#"></a></li>
							<!-- Search-->
							<li class="nav-item d-flex align-items-center"><a id="search" class="nav-link" href="#"><%=util.getNowTime() %></a></li>
							<li class="nav-item d-flex align-items-center"><a id="search" class="nav-link" href="#"><i class="icon-search"></i></a></li>
							<li class="nav-item d-flex align-items-center"><a id="search" class="nav-link" href="AdminMgr?mg=Exit">退出</a></li>
							
					</ul> 
			</div>
	</nav>
</header>
<div class="page-content d-flex align-items-stretch">
       
	<!--***** SIDE NAVBAR *****-->
	<nav class="side-navbar">
	<% 
		if(request.getSession().getAttribute("user")==null){
		response.sendRedirect("Login");
		return ;
		} 
	Admin ad=(Admin)(request.getSession().getAttribute("user"));
	%>
<%-- 	Admin ad=(Admin)(request.getSession().getAttribute("Admin"));%>  --%>
	<%-- <c:if Admin ad="${!empty Admin}"
		response.sendRedirect("Login.jsp");
		return ;
	
	></c:if> --%>
			<div class="sidebar-header d-flex align-items-center">
					<div class="avatar"><img src="adminphoto\.jpg" alt="..." class="img-fluid rounded-circle"></div>
					<div class="title">
							<h1 class="h4"><!-- Ematioanl~夕颜 -->
							<%=util.convertNull(((Admin) (request.getSession().getAttribute("user"))).getAdminName())%> 
							</h1>
					</div>
			</div>
			<hr>
			<!-- Sidebar Navidation Menus-->
			<ul class="list-unstyled">
					<li><a href="#pages" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-file-o"></i>基础信息管理 </a>
						<ul id="pages" class="collapse list-unstyled">
								<li><a href="College/College">分院信息管理</a></li> 
								<li><a href="Department/Department">系部信息管理</a></li> 
								<li><a href="Profession/Profession">专业信息管理</a></li> 
								<li><a href="Class/Class">班级信息管理</a></li> 
								<li><a href="Course/Course">课程信息管理</a></li> 
								<li><a href="Student/Student">学生信息管理</a></li> 
								<li><a href="Teacher/Teacher">教师信息管理</a></li> 
								<li><a href="Admain/ClassRoom.jsp">教室信息管理</a></li> 
						</ul>
					</li>
					 <%Admin admin=(Admin)request.getSession().getAttribute("user"); 
					if(admin!=null){
					if(admin.getRole().equals("超级管理员")){
					
					%>
					<li><a href="#apps" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>账户信息管理 </a>
							<ul id="apps" class="collapse list-unstyled">
									<li><a href="Admin/Admin">管理员账户管理</a></li> 
									<!-- <li><a href="email.html">Email</a></li> 
									<li><a href="media.html">Media</a></li> 
									<li><a href="invoice.html">Invoice</a></li>  -->
							</ul>
					</li>
					 <%
						}
						}
					 %> 
					<li class="active"><a href="#forms" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-building-o"></i>个人信息维护 </a>
							<ul id="forms" class="collapse list-unstyled">
									<li class="active"><a href="Admin/AdminPersonal">个人信息修改</a></li> 
									<li><a href="Admin/AdminPwdupdate">账户密码修改</a></li> 
							</ul>
					</li>
					<li><a href="#maps" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-file-o"></i>课程信息管理 </a>
							<ul id="maps" class="collapse list-unstyled">
									<li><a href="Admain/TeachTask.jsp">开课审核</a></li> 
									<!-- <li><a href="empty.html">Empty</a></li> 
									<li><a href="gallery.html">Gallery</a></li> 
									<li><a href="login.html">Log In</a></li> 
									<li><a href="register.html">Register</a></li> 
									<li><a href="search-result.html">Search Result</a></li> 
									<li><a href="404.html">404</a></li>  -->
							</ul>
					</li>
					<!-- <li> <a href="tables.html"> <i class="icon-grid"></i>Tables </a></li>  -->
					<li><a href="#elements" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-globe"></i>公告信息管理  </a>
							<ul id="elements" class="collapse list-unstyled">
									<li><a href="Admain/NoticePublish.jsp">公告发布</a></li> 
									<li><a href="Admain/NoticeManager.jsp">公告管理</a></li> 
									<li><a href="Admain/NoticeNew.jsp">最新公告</a></li> 
								
							</ul>
					</li>
		<!-- 	</ul><span class="heading">Extras</span>
			<ul class="list-unstyled"> 
					<li> <a href="#"> <i class="icon-picture"></i>Demo </a></li>
			</ul> -->
	</nav>
<!-- </div> -->
 <!--Global Javascript -->
 <script src="js/jquery.min.js"></script>
 <script src="js/popper/popper.min.js"></script>
 <script src="js/tether.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="js/jquery.cookie.js"></script>
 <script src="js/jquery.validate.min.js"></script>
 <script src="js/chart.min.js"></script> 
 <script src="js/front.js"></script> 
 
 <!--Core Javascript -->
 <script>
		 new Chart(document.getElementById("myChart-nav").getContext('2d'), {
			 type: 'doughnut',
			 data: {
				 labels: ["M", "T", "W", "T", "F", "S", "S"],
				 datasets: [{
					 backgroundColor: [
						 "#2ecc71",
						 "#3498db",
						 "#95a5a6",
						 "#9b59b6",
						 "#f1c40f",
						 "#e74c3c",
						 "#34495e"
					 ],
					 data: [12, 19, 3, 17, 28, 24, 7]
				 }]
			 },
			 options: {
					 legend: { display: false },
					 title: {
						 display: true,
						 text: ''
						} 
				 }
		 });
 </script>
  </body>
</html>
