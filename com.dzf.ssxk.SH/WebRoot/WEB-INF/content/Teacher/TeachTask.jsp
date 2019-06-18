
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%-- <%@page import="com.dzf.ssxk.model.Departmnet"%> --%>


<html>
<head>


<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<%@ include file="head.jsp"%>
<div class="content-inner form-cont">

	<div class="row">
		<div class="col-md-12">

			<!--***** BASIC FORM *****-->
			<div class="card form" id="form1">
				<div class="card-header">
					<h3>开课系信息管理</h3>
				</div>
				<br>
				<form action="" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">所属专业</label>
								
								 <select class="form-control" id="colselect" name="ProfessionID"
									onchange="loaddep()">

								</select> 
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">课程名称</label> <input
									type="type" class="form-control" id="couselect"
									placeholder="CourseName" name="teachTask.course.CourseName">
							</div>

						</div>
					<%-- 	<div class="col-md-6">
							<div class="form-group">
								 <select class="form-control"  id="Curricula" name="teachTask.Curricula">
								 <option class="form-control" value="<%=util.getTime() %>" onclick="readOnly"><%=util.getTime() %></option>
							
								</select> 
								<label for="exampleInputPassword1">开课时间</label>
								
							 <select class="form-control"  id="Curricula" name="teachTask.Curricula">
								 <option class="form-control" value="<%=util.getTime() %>" onclick="readOnly"><%=util.getTime() %></option>
							
								</select> 
						</div> --%>
					<input type="hidden" id="TeacherID" name="TeacherID" value="<%=te.getTeacherID() %>" onclick="readOnly">
					<input type="hidden" id="TeacherName" name="TeacherName" value="<%=te.getTeacherName() %>" onclick="readOnly">
					<!-- <button type="submit" class="btn btn-general btn-blue mr-2">提交</button>
					<button type="reset" class="btn btn-general btn-white"
						onclick="inputreset()">重置</button> -->
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
						<th>专业名称</th>
						<th>课程编号</th>
						<th>课程名称</th>
						<th>课长</th>
						<th>学分</th>
						<th>开课时间</th>
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
				url:"Profession/sel",
				type:"post",
				dataType:"json",
				success:function(data){
				$("#colselect").html("");
					for(var i=0;i<data.length;i++){
						$("#colselect").append("<option value='"+data[i].professionID+"'>"+data[i].professionName+"</option>");
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
		    var ID=$("#Curricula").find("option:selected").val()		    
			 $.ajax({
				url:"Course/select",
				type:"post",
				dataType:"json",
				data:{"ProfessionID":id,
					
				},
				success:function(data){
				alert(ID);
				     var trhtml="";
				     $("#deptab tbody").html("");
				     for(var i=0;i<data.length;i++){
					    trhtml+="<tr><th scope='row'>";    
						trhtml+=i+1;
						trhtml+="</td><td>";
						trhtml+=$("#colselect").find("option:selected").text();
						trhtml+="</th><td>";
						trhtml+=data[i].courseID;
						trhtml+="</td><td>";
						trhtml+=data[i].courseName;
						trhtml+="</td><td>";
						trhtml+=data[i].studyTime;
						trhtml+="</td><td>";
						trhtml+=data[i].crediy;
						trhtml+="</td><td>";
						trhtml+=$("#Curricula").find("option:selected").val();
						trhtml+="</td><td><a href='TeachTask/insert?CourseID="
						trhtml+=data[i].courseID;
						trhtml+="&TeacherID=" 
						trhtml+=$("#TeacherID").val();
						
						trhtml+="'>开课</a></td></tr>";
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

