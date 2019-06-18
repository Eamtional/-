<%@page import="com.dzf.ssxk.SH.util.util"%>
<%@page import="com.dzf.ssxk.SH.model.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教师信息页面</title>
    
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
											<h5>---教师端---</h5>
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
							<li class="nav-item d-flex align-items-center"><a id="search" class="nav-link" href="TeacherMgr?mg=Exit">退出</a></li>
							
					</ul> 
			</div>
	</nav>
</header>
<div class="page-content d-flex align-items-stretch">
       
	<!--***** SIDE NAVBAR *****-->
	<nav class="side-navbar">
		<% 
		if(request.getSession().getAttribute("teacher")==null){
		response.sendRedirect("Login.jsp");
		return ;
		}
		Teacher te=(Teacher)(request.getSession().getAttribute("teacher"));%>  
			<div class="sidebar-header d-flex align-items-center">
					<div class="avatar"><img src="adminphoto\.jpg" alt="..." class="img-fluid rounded-circle"></div>
					<div class="title">
							<h1 class="h4"> <!-- Ematioanl~夕颜 -->
						<%=util.convertNull(((Teacher)(request.getSession().getAttribute("teacher"))).getTeacherName()) %> 
							</h1>
					</div>
			</div>
			<hr>
			<!-- Sidebar Navidation Menus-->
			<ul class="list-unstyled">
					
					<li class="active"><a href="#forms" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-building-o"></i>个人信息维护 </a>
							<ul id="forms" class="collapse list-unstyled">
									<li class="active"><a href="Teacher/Personal.jsp">个人信息修改</a></li> 
									<li><a href="Teacher/Pwdupdate.jsp">账户密码修改</a></li> 
							</ul>
					</li>
					<li><a href="#elements" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-globe"></i>课程信息 </a>
							<ul id="elements" class="collapse list-unstyled">
							<li><a href="TeachTask/TeachTask">课程开设</a></li> 
									<li><a href="Teacher/TeachTask">课程审核结果</a></li> 
									<li><a href="Teacher/Schedule.jsp">课表创建</a></li> 
									<li><a href="Teacher/CourseSchedule.jsp">成绩录入</a></li> 
									<li><a href="Teacher/Table.jsp">课表配置</a></li>  
							</ul>
					</li>
					<!-- <li> <a href="maps.html"> <i class="fa fa-map-o"></i>Maps </a></li> -->
				
					<li><a href="#pages" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-file-o"></i>公告查看 </a>
							<ul id="pages" class="collapse list-unstyled">
									<li><a href="Teacher/NoticeNew.jsp">公告查看</a></li> 
									<!-- <li><a href="empty.html">Empty</a></li> 
									<li><a href="gallery.html">Gallery</a></li> 
									<li><a href="login.html">Log In</a></li> 
									<li><a href="register.html">Register</a></li> 
									<li><a href="search-result.html">Search Result</a></li> 
									<li><a href="404.html">404</a></li>  -->
							</ul>
					</li>
					<!--<li> <a href="tables.html"> <i class="icon-grid"></i>Tables </a></li>  -->
					<!-- <li><a href="#elements" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-globe"></i>UI Elements </a>
							<ul id="elements" class="collapse list-unstyled">
									<li><a href="ui-buttons.html">Buttons</a></li> 
									<li><a href="ui-cards.html">Cards</a></li> 
									<li><a href="ui-progressbars.html">Progress Bar</a></li> 
									<li><a href="ui-timeline.html">Timeline</a></li>  
							</ul>
					</li> -->
			<!-- </ul><span class="heading">Extras</span>
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
