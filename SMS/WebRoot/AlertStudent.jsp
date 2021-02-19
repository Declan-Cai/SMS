<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<title>Insert title here</title>
		<style type="text/css">
			.form-control {
				width: 300px;
				height: 30px;
				float: right;
			}
			
			select {
				width: 210px;
				height: 30px;
			}
			
			.submit {
				margin-left: 100px;
				margin-right: 30px;
			}
			
			.contain {
				width: 1000px;
				border: 1px #bbb solid;
				background-color: #eee;
				padding-top: 20px;
				border-radius: 10px;
			}
			
			label {
				display: inline-block;
				width: 100px;
				margin-right: 10px;
			}
			
			form {
				margin-left: 300px;
			}
		</style>
	</head>

	<body>
	<%!
		String id;
		String sourceId;
		String name;
		String sex;
		String birthday;
		String schoolday;
		String college;
		String major;
	%>
	<%
	
		if((String)session.getAttribute("user")==null){
			out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='Login.html'</script>");
		}
	
		request.setCharacterEncoding("UTF-8");
		id = request.getParameter("id");
		String sqlid = "SELECT * FROM stumanagementbyweb.studentinfo where id='"+id+"'";
		sourceId = id;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8&useSSL=false","root","123456");
			Statement sql = con.createStatement();
			ResultSet rs = sql.executeQuery(sqlid);
			if(rs.next()){
				name = rs.getString(2);
				sex = rs.getString(3);
				birthday = rs.getString(4);
				schoolday = rs.getString(5);
				college = rs.getString(7);
				major = rs.getString(6);
				
			}
			rs.close();
			sql.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	%>
		<div class="contain">
			<form action="DaoAlertStudent.jsp?sourceId='<%=sourceId %>'" method="post">
				<div class="form-group form-inline">
					<label for="id">学号:</label>
				<input type="text" class="form-control" id="id" name="id" value='<%=id %>' required="required">
				</div>
			<div class="form-group form-inline">
				<label for="name">姓名:</label>
					<input type="text" class="form-control" id="name" name="name" maxlength="15" value='<%=name %>' required="required">
				</div>
				<div class="form-group form-inline">
					<label for="sex">性别:</label>
					<select name="sex" id="sex">
						<%
							if(sex.equals("男")){
								out.print("<option value='男'selected='selected'>男</option>");
								out.print("<option value='女'>女</option>");
							}else{
								out.print("<option value='女'selected='selected'>女</option>");
								out.print("<option value='男'>男</option>");
							}
						%>
					</select>
				</div>
				<div class="form-group form-inline">
					<label for="birthday">出生日期:</label>
					<input type="date" class="form-control" id="birthday" name="birthday" value='<%=birthday %>' required="required">
				</div>
				<div class="form-group form-inline">
					<label for="schoolday">入学时间:</label>
					<input type="date" class="form-control" id="schoolday" name="schoolday" value='<%=schoolday %>' required="required">
				</div>
				<div class="form-group form-inline">
					<label for="college">院部:</label>
					<select name="college" id="college" class="college">
						<option selected="selected" value='<%=college %>'><%=college %></option>
					</select>
				</div>
				<div class="form-group form-inline">
					<label for="major">专业:</label>
					<select name="major" id="major" class="major">
						<option selected="selected" value='<%=major %>'><%=major %></option>
					</select>
				</div>
				<div class="form-group form-inline">
					<input type="submit" id="" name="" class="btn btn-primary submit" value='修改' /><input type="reset" class="btn btn-warning" value="重置" />
				</div>
			</form>
		</div>
	</body>
	<script type="text/javascript">
		var librarians = ['信息与通信工程学院', '外语学院', '轮机工程学院', '航运经贸学院学院', '艺术设计学院学院', '航务工程学院','港口与航运管理学院','海运学院','船舶与海洋工程学院'];
		var choice = ['---请选择---'];
		var shipOcean = ['船舶与海洋工程', '电气工程及其自动化', '能源与公里工程', '机械工程', '工业机器人', '机器人工程'];
		var sailManagement = ['海事管理', '法学', '旅游管理', '航海技术'];
		var sailOcean = ['交通运输', '物流工程', '交通管理', '物流工程'];
		var sailEngineer = ['港口航道与海岸工程', '道路桥梁与渡河工程', '工程管理', '土木工程'];
		var artDesign = ['数字媒体艺术（空间设计）', '数字媒体艺术（衍生品）'];
		var financialManagement = ['国际商务', '电子商务（跨境电商）', '财务管理', '金融学'];
		var marEng = ['轮机工程', '电子电气工程', '邮轮工程与管理', '机器人工程'];
		var foreign = ['商务英语', '商务日语'];
		var infoAndcom = ['计算机科学与技术', '软件工程', '电子商务', '电子信息工程', '通信工程'];
		
		
		var professional = new Array;
		professional[0] = choice;
		professional[1] = shipOcean;
		professional[2] = sailManagement;
		professional[3] = sailOcean;
		professional[4] = sailEngineer;
		professional[5] = artDesign;
		professional[6] = financialManagement;
		professional[7] = marEng;
		professional[8] = foreign;
		professional[9] = infoAndcom;

		function add_option(select, option) {
			var target = document.getElementById(select);
			for(var i = option.length - 1; i >= 0; i--) {
				var add_option = document.createElement("option");
				add_option.text = option[i];
				target.add(add_option, null);
				target.lastChild.setAttribute("value", option[i]);
			}

		}
		add_option("college", librarians);

		document.getElementById("college").addEventListener("change", function() {

			var selevted_college = document.getElementById("college");
			var selected_major = document.getElementById("major");

			for(var i = selected_major.length - 1; i >= 0; i--) {
				selected_major.remove(i);
			}
			var selected = selevted_college.selectedIndex;
			if(selected == 0) {
				add_option("major", professional[0]);
			} else {
				add_option("major", professional[selected]);
			}
		})
	</script>

</html>