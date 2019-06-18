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
 	if(request.getSession().getAttribute("user")==null){response.sendRedirect("Login.jsp");}
 %> --%>
<%@ include file="MAINNAVBAR.jsp"%>

<div class="content-inner form-cont">

	<div class="row">
		<div class="col-md-12">

			<!--***** BASIC FORM *****-->
			<div class="card form" id="form1">
				<div class="card-header">
					<h4>个人信息维护</h4>
				</div>
				<br>
			
				<form action="Admin/personalupdate" method="post">
					<div class="row" style="padding:10px 20px 20px 40px;">

						<div class="col-md-6">
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;"
									class=" col-form-label">个人账号：</label>
									<div class="col-9">
								<input class="form-control" type="text" value="" readonly="readonly"
										id="AdminID" name="admin.AdminID">
										</div>
							</div>
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;"
									class=" col-form-label">真实姓名：</label>
								<div class="col-9">
									<input class="form-control" type="text" value=""
										id="AdminName" name="admin.AdminName">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-search-input" style="width: 85px;"
									class=" col-form-label">操作角色:</label>
								<div class="col-9">
									<input class="form-control" type="text" value="" readonly="readonly"
										id="Role" name="admin.Role">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-search-input" style="width: 85px;"
									class=" col-form-label">备注:</label>
								<div class="col-9">
									<input class="form-control" type="text" value=""
										id="Remark" name="admin.Remark">
								</div>
							</div>
							<div class="form-group row">
								<button type="submit" class="btn btn-general btn-white">保存</button>
								<!-- <button type="submit" class="btn btn-general btn-white" onclick="resave()">重置</button> -->
							</div>

						</div>
				</form>
				
				<form class="col-md-6" action="PersonalMgr" enctype="multipart/form-data" method="post">
					
					
						<div class="form-group row">
							<label for="example-datetime-local-input" style="width:85px;"
								class=" col-form-label"></label>
							<div class="card hovercard">
								<div class="avatar">
									<img id="pic" alt="" src="adminphoto/.jpg" style="width:40mm;height: 52mm;">
								</div>
							</div>
						</div>
						<div class="form-group row">

							<div class="col-9">
								<div class="input-group image-preview">
									<input placeholder="" type="text" id="filename"
										class="form-control image-preview-filename"
										readonly="readonly"> <span class="input-group-btn">
										<div class="btn btn-default image-preview-input">
											<span class="glyphicon glyphicon-folder-open"></span> <span
												class="image-preview-input-title">打开</span> 
												<input type="file" accept=" image/jpg"
												name="picpath" onchange="ImgShowPreview(this)" />

										</div>

									</span> 
									&nbsp<input type="submit" value="上传照片" />
								</div>
							</div>
							
						
				</form>
			</div>
		</div>

	</div>
	 <div class="content-inner chart-cont">

		<!--***** CONTENT *****-->
		<div class="row">
			<%
				request.setCharacterEncoding("utf-8");
			
			%>
			<table class="table table-hover" id="coltab">
				<thead>
					<tr class="bg-info text-white">
						<th>序号</th>
						<th>用户名</th>
						<th>真实姓名</th>
						<th>密码</th>
						<th>账户类型</th>
						<th>备注</th>
						<th style="width:20%">操作</th>

					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>
		</div>
 
	</div>
</div>


</div>


	<script type="text/javascript">
	 $(document).ready(tableload());
	function tableload() {
		$.ajax({
					url : "Admin/select",
					type : "post",
					dataType : "json",
					success : function(json) {
						$("#coltab tbody").html("");
						var trhtml = "";
						for (var i = 0; i < json.length; i++) {
							trhtml += "<tr><th scope='row'>" + (i + 1)
									+ "</th>";
							trhtml += "<td>" + json[i].adminID + "</td><td>"
									+ json[i].adminName + "</td><td>"
									+ json[i].password + "</td><td>"
									+ json[i].role + "</td><td>"
									+ json[i].remark + "</td>";
							trhtml += "<td><a href='javascript:void(0);' onclick='rowselect("
									+ (i + 1) + ")'>修改</a></td></tr>";	

						}
						$("#coltab tbody").append(trhtml);
						messageload();
					},
					error : function() {
						alert("error");
					}
				});
	}
	
	
			function messageload(){
        			if(${!empty error}){
        			var a="${error}";
        			
        			layer.alert('${error}', {icon: 7,time:1500});
        			}
            	}
 
	 function rowselect(index) {
		var tb = document.getElementById("coltab");
		$("#AdminID").val(tb.rows[index].cells[1].innerHTML);
		$("#AdminName").val(tb.rows[index].cells[2].innerHTML);
		
		$("#Role").val(tb.rows[index].cells[4].innerHTML);
		$("#Remark").val(tb.rows[index].cells[5].innerHTML);
		$("#AdminID").attr("readOnly", true);
		$("#Role").attr("readOnly", true);
	} 
	
		function ImgShowPreview(source) {
			var file = source.files[0];
			if (window.FileReader) {
				var fr = new FileReader();
				console.log(fr);
				var pic = document.getElementById('pic');
				var filename = document.getElementById('filename');
				fr.onloadend = function(e) {
					pic.src = e.target.result;
				};
				fr.readAsDataURL(file);
				pic.style.display = 'block';
				filename.value = file.name;
			}
		}
		
		
	</script>
	<script>
				function del(){
					var msg="您真的确定要删除吗？\n\n请确认！";
					if(confirm(msg)==true){
							return ture;
					}else{
							return false;
					}
				
				}
		</script>
</body>
</html>
