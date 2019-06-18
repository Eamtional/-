

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
					<h3>班级信息管理</h3>
				</div>
				<br>
				<form action="Class/insert" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">所属分院</label> <select
									class="form-control" id="colselect" name="CollegeID"
									onchange="loaddep()">
								</select>
								 
								<label for="exampleInputEmail1">所属科系</label> <select
									class="form-control" id="depselect" name="DepartmentID"
									onchange="loadpro()">

								</select> 
								
								<label for="exampleInputEmail1">所属专业</label> <select
									class="form-control" id="claselect" name="classs.profession.ProfessionID"
									onchange="loadcla()">
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">班级编号</label> <input type="type"
									class="form-control" id="ClassID" aria-describedby="emailHelp"
									placeholder="ClassID" name="classs.ClassID">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="exampleInputEmail1">班级名称</label> <input type="type"
									class="form-control" id="ClassName"
									aria-describedby="emailHelp" placeholder="ClassName"
									name="classs.ClassName">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">年级名称</label> <input type="type"
									class="form-control" id="YearName" aria-describedby="emailHelp"
									placeholder="YearName" name="classs.YearName">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">备注</label> <input type="type"
									class="form-control" id="Remark" placeholder="Remark"
									name="classs.Remark">
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
						<th>所属分院</th>
						<th>所属科系</th>
						<th>所属专业</th>
						<th>年级编号</th>
						<th>年级名称</th>
						<th>班级名称</th>
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
				
				$("#depselect").html("");
					for(var i=0;i<data.length;i++){
						$("#depselect").append("<option value='"+data[i].departmentID+"'>"+data[i].departmentName+"</option>");
					}
					loadpro();
					
				},
				error:function(){
					alert("科系数据请求失败！");
				}
			});
		}
		
		function loadpro(){
			var id=$("#depselect").find("option:selected").val();
			$.ajax({
			
				url:"Profession/select",
				type:"post",
				dataType:"json",
				data:{"DepartmentID":id},
				success:function(data){
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
				url:"Class/select",
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
						trhtml+=$("#colselect").find("option:selected").text();
						trhtml+="</th><td>";
						trhtml+=$("#depselect").find("option:selected").text();
						trhtml+="</th><td>";
						trhtml+=$("#claselect").find("option:selected").text();
						trhtml+="</th><td>";
						trhtml+=data[i].classID;
						trhtml+="</td><td>";
						trhtml+=data[i].yearName;
						trhtml+="</td><td>";
						trhtml+=data[i].className;
						trhtml+="</td><td>";
						trhtml+=data[i].remark;					
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>修改</a>&nbsp;<a href='Class/delete?ClassID="
						trhtml+=data[i].classID+
						"'  onclick='javascript:return del();''>删除</a></td></tr>";
						
					} 
							
					$("#deptab tbody").append(trhtml);
					messageload();
				},
				error:function(){
					alert("班级数据请求失败！");
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
				$("#ClassID").val(tb.rows[index].cells[4].innerHTML);
				$("#ClassName").val(tb.rows[index].cells[5].innerHTML);
				$("#YearName").val(tb.rows[index].cells[6].innerHTML);
				$("#Remark").val(tb.rows[index].cells[7].innerHTML);
				$("#ClassID").attr("readOnly",true);
				$("#colselect").attr("readOnly",true);
				$("#depselect").attr("readOnly",true);
				$("#claselect").attr("readOnly",true);
			}
			
			function inputreset() {
				$("#ClassID").attr("readOnly", false);
				$("#colselect").attr("readOnly",false);
				$("#depselect").attr("readOnly",false);
				$("#claselect").attr("readOnly",false);
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
