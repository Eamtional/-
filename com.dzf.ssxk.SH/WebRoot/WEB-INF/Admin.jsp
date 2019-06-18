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


<div class="content-inner form-cont">

	<div class="row">
		<div class="col-md-12">

			<!--***** BASIC FORM *****-->
			<div class="card form" id="form1">
				<div class="card-header">
					<h3>账户信息管理</h3>
				</div>
				<br>
				<form action="AdminMgr" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">用户名</label> <input type="type"
									class="form-control" id="AdminID"
									aria-describedby="emailHelp" placeholder="AdminID"
									name="AdminID">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">真实姓名</label> <input
									type="type" class="form-control" id="AdminName"
									placeholder="AdminName" name="AdminName">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">账户类型</label> 
								<select class="form-control" id="type" name="type">
									<option value="超级管理员">超级管理员</option>
									<option value="管理员">管理员</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputPassword1">密码</label> <input
									type="password" class="form-control" id="Password"
									placeholder="Password" name="Password">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">照片</label> <input type="type"
									class="form-control" id="Photo" placeholder="Photo"
									name="Photo">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">备注</label> <input type="type"
									class="form-control" id="Remark" placeholder="Remark"
									name="Remark">
							</div>
						</div>
					</div>
					<input type="hidden" name="mg" value="insert" id="mg">
					<button type="submit" class="btn btn-general btn-blue mr-2">提交</button>
					<button type="reset" class="btn btn-general btn-white"
						onclick="inputreset()">重置</button>
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
						<th>账户类型</th>
						<th>密码</th>
						<th>照片</th>
						<th>备注</th>
						<th>操作</th>

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
		$
				.ajax({
					url : "AdminMgr?mg=select",
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
									+ json[i].type + "</td><td>"
									+ json[i].password + "</td><td>"
									+ json[i].photo + "</td><td>"
									+ json[i].remark + "</td>";
							trhtml += "<td><a href='javascript:void(0);' onclick='rowselect("
									+ (i + 1) + ")'>选择</a>&nbsp;&nbsp;";
							trhtml += "<a  href='AdminMgr?mg=delete&AdminID="
									+ json[i].adminID + "'  onclick='javascript:return del();' >删除</a></td></tr>";

						}
						$("#coltab tbody").append(trhtml);
					},
					error : function() {
						alert("error");
					}
				});
	}

	function rowselect(index) {
		var tb = document.getElementById("coltab");
		$("#AdminID").val(tb.rows[index].cells[1].innerHTML);
		$("#AdminName").val(tb.rows[index].cells[2].innerHTML);
		$("#type").val(tb.rows[index].cells[3].innerHTML);
		$("#Password").val(tb.rows[index].cells[4].innerHTML);
		$("#Photo").val(tb.rows[index].cells[5].innerHTML);
		$("#Remark").val(tb.rows[index].cells[6].innerHTML);
		$("#AdminID").attr("readOnly", true);
		$("#mg").val("update");
	}

	function inputreset() {
		$("#AdminID").attr("readOnly", false);
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
