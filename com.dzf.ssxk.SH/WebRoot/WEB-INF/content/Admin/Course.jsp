

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

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
					<h3>课程信息管理</h3>
				</div>
				<br>
				<form action="Course/insert" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
							<label for="exampleInputEmail1">所属专业</label> <select
									class="form-control" id="claselect" name="course.profession.ProfessionID"
									onchange="loadcla()">
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">课程编号</label> <input type="text"
									class="form-control" id="CourseID" aria-describedby="emailHelp"
									placeholder="CourseID" name="course.CourseID">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">课程名称</label> <input type="text"
									class="form-control" id="CourseName"
									aria-describedby="emailHelp" placeholder="CourseName"
									name="course.CourseName">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">备注</label> <input type="text"
									class="form-control" id="Remark" placeholder="Remark"
									name="course.Remark">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">学习时间</label> <input type="text"
									class="form-control" id="StudyTime" aria-describedby="emailHelp"
									placeholder="StudyTime" name="course.StudyTime">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">学分</label> <input type="text"
									class="form-control" id="Crediy" aria-describedby="emailHelp"
									placeholder="Crediy" name="course.Crediy">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">开课时间</label> <input type="type"
									class="form-control" id="CurriculumTime" aria-describedby="emailHelp"
									placeholder="CurriculumTime" name="course.CurriculumTime">

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
			<table class="table table-hover" id="deptab">
				<thead>
					<tr class="bg-info text-white">
						<th>序号</th>
						<th>所属专业</th>
						<th>课程编号</th>
						<th>课程名称</th>
						<th>学习时间</th>
						<th>学分</th>
						<th>开课时间</th>
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
			$(document).ready(loadpro());
		
		function loadpro(){
/* 			var id=$("#depselect").find("option:selected").val();
 */			$.ajax({
			
				url:"Profession/sel",
				type:"post",
				dataType:"json",
				success:function(data){
				/* alert("123"); */
				$("#claselect").html("");
					for(var i=0;i<data.length;i++){
						$("#claselect").append("<option value='"+data[i].professionID+"'>"+data[i].professionName+"</option>");
					}
				loadcla();
					
				},
				error:function(){
					alert("专业数据请求失败！");
				}
			});
		}
		
	 	function loadcla(){
		    var id=$("#claselect").find("option:selected").val();
			 $.ajax({
				url:"Course/select",
				type:"post",
				dataType:"json",
				data:{"ProfessionID":id},
				success:function(data){
				     var trhtml="";
				     $("#deptab tbody").html("");
			    
				     for(var i=0;i<data.length;i++){
					    trhtml+="<tr  class=''><th scope='row'>";    
						trhtml+=i+1;
						trhtml+="</th><td>";
						trhtml+=$("#claselect").find("option:selected").text();
						trhtml+="</th><td>";
						trhtml+=data[i].courseID;
						trhtml+="</td><td>";
						trhtml+=data[i].courseName;
						trhtml+="</td><td>"; 
						trhtml+=data[i].studyTime;
						trhtml+="</td><td>";
						trhtml+=data[i].crediy;	
						trhtml+="</td><td>";
						trhtml+=data[i].curriculumTime;	
						trhtml+="</td><td>";
						trhtml+=data[i].remark;					
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>修改</a>&nbsp;<a href='Course/delete?CourseID="
						trhtml+=data[i].courseID+"'  onclick='javascript:return del();''>删除</a></td></tr>";
						
					} 
							
					$("#deptab tbody").append(trhtml);
					
				},
				error:function(){
					alert("专业数据请求失败！");
					messageload();
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
				$("#profession.ProfessionID").val(tb.rows[index].cells[1].innerHTML);
				$("#CourseID").val(tb.rows[index].cells[2].innerHTML);
				$("#CourseName").val(tb.rows[index].cells[3].innerHTML);
				$("#StudyTime").val(tb.rows[index].cells[4].innerHTML);
				$("#Crediy").val(tb.rows[index].cells[5].innerHTML);
				$("#CurriculumTime").val(tb.rows[index].cells[6].innerHTML);
				$("#Remark").val(tb.rows[index].cells[7].innerHTML);
				$("#CourseID").attr("readOnly",true);
				$("#claselect").attr("readOnly",true);
			}
			
			function inputreset() {
				$("#claselect").attr("readOnly", false);
				$("#CourseID").attr("readOnly",false);
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
