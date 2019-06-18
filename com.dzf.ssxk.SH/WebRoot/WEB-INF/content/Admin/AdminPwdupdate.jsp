<%-- <%@page import="com.dzf.ssxk.factory.Collegefactory"%>
<%@page import="com.dzf.ssxk.model.College"%>
<%@page import="com.dzf.ssxk.factory.Collegeinterface"%> --%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
<head>


<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<%-- <%
	if (request.getSession().getAttribute("user") == null) {
		response.sendRedirect("Login.jsp");
	}
%> --%>
<%@ include file="MAINNAVBAR.jsp"%>

<div class="content-inner form-cont">

	<div class="row">
		<div class="col-md-12">

			<!--***** BASIC FORM *****-->
			<div class="card form" id="form1">
				<div class="card-header">
					<h4>账户密码修改</h4>
				</div>
				<br>

				<form action="Admin/pwdupdate" method="post">
					<div class="row" style="padding:10px 20px 20px 40px;">

						<div class="col-md-6">
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;"
									class=" col-form-label">个人账号：</label>
								<div class="col-9">
									<input class="form-control" type="text"
										value="<%=ad.getAdminID() %>" readonly="readonly" id="AdminID"
										name="admin.AdminID">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;"
									class=" col-form-label">原密码：</label>
								<div class="col-9">
									<input class="form-control" type="password"
										placeholder="请输入原密码" value="" id="Oldpwd" name="Oldpwd">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-search-input" style="width: 85px;"
									class=" col-form-label">新密码:</label>
								<div class="col-9">
									<input class="form-control" type="password"
										placeholder="请输入新密码" value="" id="Newpwd" name="Newpwd">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-search-input" style="width: 85px;"
									class=" col-form-label">确认密码:</label>
								<div class="col-9">
									<input class="form-control" type="password"
										placeholder="请输入确认密码" value="" id="Newpwd_t" name="Newpwd_t">
								</div>
							</div>
							<div class="form-group row">
								<button type="submit" class="btn btn-general btn-white">保存</button>
							</div>

						</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	 $(document).ready(messageload());
			function messageload(){
        			if(${!empty error}){
        			var a="${error}";
        			
        			layer.alert('${error}', {icon: 7,time:1500});
        			}
            	}
           </script>
	</body>
</html>
