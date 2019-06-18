
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
					<h3>学生信息管理</h3>
				</div>
				<br>
				<form action="Student/insert" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">所属班级</label>
								 <select class="form-control" id="colselect" name="student.classs.ClassID"
									onchange="loaddep()">

								</select> 
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">学生ID</label> <input
									type="type" class="form-control" id="StudentID"
									placeholder="StudentID" name="student.StudentID">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">学生Name</label> <input
									type="type" class="form-control" id="Name"
									placeholder="StudentName" name="student.StudentName">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">性别</label> 
								<select class="form-control" id="Sex" name="student.Sex">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
							 <div class="form-group">
								<label for="example-date-input" class=" col-form-label">生日</label>
                                    
                                <input class="form-control" type="date" value="2019-04-20" placeholder="Birth" name="student.Birthday" id="Birthday">
							</div>
							 

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">家庭住址</label> <input type="type"
									class="form-control" id="Family"
									aria-describedby="emailHelp" placeholder="Family"
									name="student.Family">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">照片</label> <input type="type"
									class="form-control" id="Photo"
									aria-describedby="emailHelp" placeholder="Photo"
									name="student.Photo">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">密码</label> <input type="type"
									class="form-control" id="Password"
									aria-describedby="emailHelp" placeholder="Password"
									name="student.Password">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">备注</label> <input type="type"
									class="form-control" id="Remark" placeholder="Remark"
									name="student.Remark">
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
						<th>所属分院 </th>
						<th>学生ID</th>
						<th>学生Name</th>
						<th>性别</th>
						<th>生日</th>
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
			/* alert("123"); */
			$.ajax({
				url:"Class/sel",
				type:"post",
				dataType:"json",
				success:function(data){
			
					$("#colselect").html("");
					for(var i=0;i<data.length;i++){
						$("#colselect").append("<option value='"+data[i].classID+"'>"+data[i].className+"</option>");
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
		   /*  alert("123"); */	    
			 $.ajax({
				url:"Student/select",
				type:"post",
				dataType:"json",
				data:{"ClassID":id},
				success:function(data){
				/* alert("123"); */
				     var trhtml="";
				     $("#deptab tbody").html("");
				     for(var i=0;i<data.length;i++){
					    trhtml+="<tr><th scope='row'>";    
						trhtml+=i+1;
						trhtml+="</th><td>";
						trhtml+=$("#colselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=data[i].studentID;
						trhtml+="</td><td>";
						trhtml+=data[i].studentName;
						trhtml+="</td><td>";
						trhtml+=data[i].sex;
						trhtml+="</td><td>";
						trhtml+=data[i].birthday;
						trhtml+="</td><td>";
						trhtml+=data[i].family;
						trhtml+="</td><td>";
						trhtml+=data[i].photo;
						trhtml+="</td><td>";
						trhtml+=data[i].password;
						trhtml+="</td><td>";
						trhtml+=data[i].remark;;
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>选择</a>&nbsp;&nbsp;<a href='Student/delete?StudentID="
						trhtml+=data[i].studentID+"'   onclick='javascript:return del();'>删除</a></td></tr>";
					} 
					$("#deptab tbody").append(trhtml);
					messageload()
				},
				error:function(){
				
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
				$("#StudentID").val(tb.rows[index].cells[2].innerHTML);
				$("#Name").val(tb.rows[index].cells[3].innerHTML);
				$("#Sex").val(tb.rows[index].cells[4].innerHTML);
				$("#Birthday").val(tb.rows[index].cells[5].innerHTML);
				$("#Photo").val(tb.rows[index].cells[7].innerHTML);
				$("#Family").val(tb.rows[index].cells[6].innerHTML);
				$("#Password").val(tb.rows[index].cells[8].innerHTML);
				$("#Remark").val(tb.rows[index].cells[9].innerHTML); 
				$("#StudentID").attr("readOnly",true);
				$("#colselect").attr("readOnly",true);
				$("#Password").attr("readOnly",true);
			}
			
			function inputreset() {
				$("#StudentID").attr("readOnly", false);
				$("#colselect").attr("readOnly",false);
				$("#Password").attr("readOnly",false);
				$("#StudentID").val("");
				$("#Name").val("");
				$("#Sex").val("");
				$("#Birthday").val("");
				$("#Photo").val("");
				$("#Family").val("");
				$("#Password").val("");
				$("#Remark").val(""); 
				
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

