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

	function update(){
		var param = $("form").serialize();
		$.post("update",param,function(flag){
			if(flag){
				alert("修改成功");
				location = "list";
			}else{
				alert("修改失败");
			}
		},"json")
	}
	$(function(){
		$.post("getlist",function(arr){
			for (var i = 0; i < arr.length; i++) {
				$("select").append("<option value='"+arr[i].cid+"'>"+arr[i].cname+"</option>")
			}
			var cid  =$("#cid").val();
			$("#byid").find("option[value='"+cid+"']").prop("selected",true);
		})
	})
</script>
</head>
<body>
	<form>		
			<input type="hidden" id="cid" value="${zw.cid }">
			<input type="hidden" name="id" value="${zw.id }">
		植物名称<input type="text" name="name" value="${zw.name }"><br>
		描述<input type=text" name="ms" value="${zw.ms }"><br>
		类别<select name="cid" id="byid">
			<option>请选择</option>
		</select><br>
		<input type="button" value="修改" onclick="update()">
	</form>
</body>
</html>