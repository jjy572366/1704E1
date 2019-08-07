<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/list.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript">

	function add(){
		var param = $("form").serialize();
		$.post("add",param,function(flag){
			if(flag){
				alert("添加成功");
				location = "list";
			}else{
				alert("添加失败")
			}
		},"json")
	}
	$(function(){
		$.post("getlist",function(arr){
			for (var i = 0; i < arr.length; i++) {
				$("select").append("<option value='"+arr[i].cid+"'>"+arr[i].cname+"</option>")
			}
		})
	})
</script>
</head>
<body>
	<form>
		植物名称<input type="text" name="name"><br>
		描述<input type="text" name="ms"><br>
		类别<select name="cid">
			<option>请选择</option>
		</select><br>
		<input type="button" value="添加" onclick="add()">
	</form>
</body>
</html>