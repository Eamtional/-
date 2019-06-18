
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
					<h3>教师信息管理</h3>
				</div>
				<br>
				<form action="Teacher/insert" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">所属分院</label>
								 <select class="form-control" id="colselect" name="teacher.college.CollegeID"
									onchange="loaddep()">
								</select> 
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">教师ID</label> <input
									type="type" class="form-control" id="TeacherID"
									placeholder="TeacherID" name="teacher.TeacherID">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">教师Name</label> <input
									type="type" class="form-control" id="TeacherName"
									placeholder="Name" name="teacher.TeacherName">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">性别</label> 
								<select class="form-control" id="Sex" name="teacher.Sex">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
							<div class="form-group">
								<label for="example-date-input" class=" col-form-label">生日</label>
                                    
                                <input class="form-control" type="date" value="2019-04-20" name="teacher.Birthday" id="Birthday">
							</div>
							
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">学历</label> <input type="type"
									class="form-control" id="Kulture"
									aria-describedby="emailHelp" placeholder="Kulture"
									name="teacher.Kulture">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">家庭住址</label> <input type="type"
									class="form-control" id="Home"
									aria-describedby="emailHelp" placeholder="Home"
									name="teacher.Home">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">照片</label> <input type="type"
									class="form-control" id="Photo"
									aria-describedby="emailHelp" placeholder="Photo"
									name="teacher.Photo">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">密码</label> <input type="type"
									class="form-control" id="Password"
									aria-describedby="emailHelp" placeholder="Password"
									name="teacher.Password">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">备注</label> <input type="type"
									class="form-control" id="Remark" placeholder="Remark"
									name="teacher.Remark">
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
		<div class="row"  style="width:120%">
			<table class="table table-hover"  id="deptab">
				<thead>
					<tr class="bg-info text-white">
						<th>序号</th>
						<th>所属分院 </th>
						<th>教师ID</th>
						<th>教师Name</th>
						<th>性别</th>
						<th>生日</th>
						<th>学历</th>
						<th>家庭住址</th>
						<th>照片</th>
						<th>密码</th>
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
				url:"Teacher/select",
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
						trhtml+=$("#colselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=data[i].teacherID;
						trhtml+="</td><td>";
						trhtml+=data[i].teacherName;
						trhtml+="</td><td>";
						trhtml+=data[i].sex;
						trhtml+="</td><td>";
						trhtml+=data[i].birthday;
						trhtml+="</td><td>";
						trhtml+=data[i].kulture;
						trhtml+="</td><td>";
						trhtml+=data[i].home;
						trhtml+="</td><td>";
						trhtml+=data[i].photo;
						trhtml+="</td><td>";
						trhtml+=data[i].password;
						trhtml+="</td><td>";
						trhtml+=data[i].remark;;
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>修改</a>&nbsp;&nbsp;<a href='Teacher/delete?TeacherID="
						trhtml+=data[i].teacherID+"'   onclick='javascript:return del();'>删除</a></td></tr>";
					} 
					$("#deptab tbody").append(trhtml);
					messageload();
				},
				error:function(){
				alert("789");
					alert("数据请求失败！");
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
				$("#TeacherID").val(tb.rows[index].cells[2].innerHTML);
				$("#TeacherName").val(tb.rows[index].cells[3].innerHTML);
				$("#Sex").val(tb.rows[index].cells[4].innerHTML);
				$("#Birthday").val(tb.rows[index].cells[5].innerHTML);
				$("#Kulture").val(tb.rows[index].cells[6].innerHTML);
				$("#Home").val(tb.rows[index].cells[7].innerHTML);
				$("#Photo").val(tb.rows[index].cells[8].innerHTML);
				$("#Password").val(tb.rows[index].cells[9].innerHTML);
				$("#Remark").val(tb.rows[index].cells[10].innerHTML); 
				$("#TeacherID").attr("readOnly",true);
				$("#Password").attr("readOnly",true);
				$("#mg").val("update");
			}
			
			function inputreset() {
				$("#TeacherID").attr("readOnly", false);
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

