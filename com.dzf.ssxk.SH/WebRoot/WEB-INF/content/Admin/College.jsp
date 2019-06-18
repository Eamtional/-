<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%-- <%@page import="com.dzf.ssxk.model.Departmnet"%> --%>


<html>
<head>


<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<%@ include file="MAINNAVBAR.jsp"%>
<div class="content-inner form-cont">

	<div class="row">
		<div class="col-md-12">

			<!--***** BASIC FORM *****-->
			<div class="card form" id="form1">
				<div class="card-header">
					<h3>系部信息管理</h3>
				</div>
				<br>
				<form action="College/insert" method="post">
					<div class="row">
						<div class="col-md-6">
							
							<div class="form-group">
								<label for="exampleInputPassword1">分院编号</label> <input
									type="type" class="form-control" id="CollegeID"
									placeholder="CollegeID" name="college.CollegeID">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">分院名称</label> <input type="type"
									class="form-control" id="CollegeName"
									aria-describedby="emailHelp" placeholder="CollegeName"
									name="college.CollegeName">
								<!-- <small id="emailHelp" class="form-text text-muted">.</small> -->
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">备注</label> <input type="type"
									class="form-control" id="Remark" placeholder="Remark"
									name="college.Remark">
							</div>
						</div> 
					</div>
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
			<table class="table table-hover"  id="coltab">
				<thead>
					<tr class="bg-info text-white">
						<th>序号</th>
						<th>分院编号</th>
						<th>分院名称</th>
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

		<script>
		$(document).ready(tableload());
	function tableload() {
			$.ajax({
					url : "College/select",
					type : "post",
					dataType : "json",
					success : function(json) {
					
						$("#coltab tbody").html("");
						var trhtml = "";
						for (var i = 0; i < json.length; i++) {
						
							trhtml += "<tr ><th scope='row'>" + (i + 1)
									+ "</th>";
							trhtml += "<td>" + json[i].collegeID + "</td><td>"
									+ json[i].collegeName + "</td><td>"
									+ json[i].remark + "</td>";
							trhtml += "<td><a href='javascript:void(0);' onclick='rowselect("
									+ (i + 1) + ")'>修改</a>&nbsp;&nbsp;";
							trhtml += "<a  href='College/delete?CollegeID="
									+ json[i].collegeID + "'  onclick='javascript:return del();' >删除</a></td></tr>";

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
				$("#CollegeID").val(tb.rows[index].cells[1].innerHTML);
				$("#CollegeName").val(tb.rows[index].cells[2].innerHTML);
				$("#Remark").val(tb.rows[index].cells[3].innerHTML);
				$("#CollegeID").attr("readOnly",true);
				
			}
			
			function inputreset() {
				$("#CollegeID").attr("readOnly", false);
			}
		</script>
</body>
</html>

