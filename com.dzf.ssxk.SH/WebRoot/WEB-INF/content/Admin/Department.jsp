
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
				<form action="Department/insert" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">所属分院</label>
								
								 <select class="form-control" id="colselect" name="department.college.CollegeID"
									onchange="loaddep()">

								</select> 
								<!-- <small id="emailHelp" class="form-text text-muted">.</small> -->
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">系部名称</label> <input
									type="type" class="form-control" id="DepartmentName"
									placeholder="DepartmentName" name="department.DepartmentName">
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">系部编号</label> <input type="type"
									class="form-control" id="DepartmentID"
									aria-describedby="emailHelp" placeholder="DepartmentID"
									name="department.DepartmentID">
								<!-- <small id="emailHelp" class="form-text text-muted">.</small> -->
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">备注</label> <input type="type"
									class="form-control" id="Remark" placeholder="Remark"
									name="department.Remark">
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
			<table class="table table-hover"  id="deptab">
				<thead>
					<tr class="bg-info text-white">
						<th>序号</th>
						<th>系部编号</th>
						<th>系部名称</th>
						<th>所属分院</th>
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
		$(document).ready(loadcols());
		
		function loadcols(){
			
			$.ajax({
			
				url:"College/select",
				type:"post",
				dataType:"json",
				success:function(data){
				$("#colselect").html("");
					for(var i=0;i<data.length;i++){
						$("#colselect").append("<option value='"+data[i].collegeID+"'>"+data[i].collegeName+"</option>");
					}
					loaddep();
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			});
		}
		
		 function loaddep(){
		    var id=$("#colselect").find("option:selected").val();		    
			 $.ajax({
				url:"Department/select",
				type:"post",
				dataType:"json",
				data:{"CollegeID":id},
				success:function(data){
				     var trhtml="";
				     $("#deptab tbody").html("");
				     for(var i=0;i<data.length;i++){
					    trhtml+="<tr><th scope='row'>";    
						trhtml+=i+1;
						trhtml+="</th><td>";
						trhtml+=data[i].departmentID;
						trhtml+="</td><td>";
						trhtml+=data[i].departmentName;
						trhtml+="</td><td>";
						trhtml+=$("#colselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=data[i].remark;;
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>修改</a>&nbsp;&nbsp;<a href='Department/delete?DepartmentID="
						+data[i].departmentID+ "'onclick='javascript:return del();''>删除</a></td></tr>";
					} 					
					$("#deptab tbody").append(trhtml);
					messageload();
				},
				error:function(){
					alert("分院数据请求失败！");
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
				var tb = document.getElementById("deptab");					
				$("#DepartmentID").val(tb.rows[index].cells[1].innerHTML);
				$("#DepartmentName").val(tb.rows[index].cells[2].innerHTML);
				$("#Remark").val(tb.rows[index].cells[4].innerHTML);
				$("#DepartmentID").attr("readOnly",true);
				$("#colselect").attr("readOnly",true);
				$("#mg").val("update");
			}
			
			function inputreset() {
				$("#DepartmentID").attr("readOnly", false);
				$("#colselect").attr("readOnly", false);
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

