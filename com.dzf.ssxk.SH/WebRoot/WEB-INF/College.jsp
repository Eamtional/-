<%-- <%@page import="com.dzf.ssxk.factory.Collegefactory"%>
<%@page import="com.dzf.ssxk.factory.Collegeinterface"%>
<%@page import="com.dzf.ssxk.model.College"%> --%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%-- <%@page import="com.dzf.ssxk.model.Departmnet"%> --%>


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
					<h3>系部信息管理</h3>
				</div>
				<br>
				<form action="CollegeMgr" method="post">
					<div class="row">
						<div class="col-md-6">
							
							<div class="form-group">
								<label for="exampleInputPassword1">分院编号</label> <input
									type="type" class="form-control" id="CollegeID"
									placeholder="CollegeID" name="CollegeID">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">分院名称</label> <input type="type"
									class="form-control" id="CollegeName"
									aria-describedby="emailHelp" placeholder="CollegeName"
									name="CollegeName">
								<!-- <small id="emailHelp" class="form-text text-muted">.</small> -->
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">备注</label> <input type="type"
									class="form-control" id="Remark" placeholder="Remark"
									name="Remark">
							</div>
						<!-- </div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">系部编号</label> <input type="type"
									class="form-control" id="DepartmentID"
									aria-describedby="emailHelp" placeholder="DepartmentID"
									name="DepartmentID">
								<small id="emailHelp" class="form-text text-muted">.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">备注</label> <input type="type"
									class="form-control" id="Remark" placeholder="Remark"
									name="Remark">
							</div>-->
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
			<table class="table table-hover"  id="deptab">
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
		/* $(document).ready(loadcols());
		
		function loadcols(){
			
			$.ajax({
			
				url:"CollegeMgr?mg=select",
				type:"post",
				dataType:"json",
				success:function(data){
				//alert(data);
					for(var i=0;i<data.length;i++){
						$("#colselect").append("<option value='"+data[i].collegeID+"'>"+data[i].collegeName+"</option>");
					}
					loaddep();
					//alert("123");
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			});
		}
		function loaddep(){
		    var id=$("#colselect").find("option:selected").val();		    
			 $.ajax({
				url:"DepartmentMgr?mg=select",
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
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>选择</a>&nbsp;&nbsp;<a href='DepartmentMgr?mg=delete&DepartmentID="
						trhtml+=data[i].departmentID;
						trhtml+="'>删除</a></td></tr>";
					} 					
					$("#deptab tbody").append(trhtml);
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			}); 
		} */
		
			
			function rowselect(index) {
				var tb = document.getElementById("deptab");					
				$("#CollegeID").val(tb.rows[index].cells[1].innerHTML);
				$("#CollegeName").val(tb.rows[index].cells[2].innerHTML);
				$("#Remark").val(tb.rows[index].cells[3].innerHTML);
				$("#CollegeID").attr("readOnly",true);
				$("#mg").val("update");
			}
			
			function inputreset() {
				$("#CollegeID").attr("readOnly", false);
			}
		</script>
</body>
</html>

