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
	function del(id){
		$.post("del",{id:id},function(flag){
			if(flag){
				alert("删除成功")
				location = "list";
			}else{
				alert("删除失败")
			}
		},"json")
	}
	function qx(){
		$(":checkbox").attr("checked",true);
	}
</script>
</head>
<body>
<form action="list" method="post">
名称查询 <input type="text" name="name" value="${z.name }">
		<input type="submit" value="搜索">
</form>
<a href="toadd">添加</a>
	<table>
		<tr>
			<td></td>
			<td>序号</td>
			<td>植物名称</td>
			<td>描述</td>
			<td>类别</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="l" varStatus="i">
			<tr>
				<td>
					<input type="checkbox" name="id" value="${l.id }">
				</td>
				<td>${i.index+1 }</td>
				<td>${l.name }</td>
				<td>${l.ms }</td>
				<td>${l.cname }</td>
				<td>
					<input type="button" value="删除" onclick="del(${l.id})">
					<a href="toupdate?id=${l.id }"><input type="button" value="修改"></a>
					<a href="toupdate?id=${l.id }"><input type="button" value="查看"></a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="10">
				<a href="list?page=1">首页</a>
				<a href="list?page=${page-1>0?page-1:1 }">上一页</a>
				<a href="list?page=${page+1<pages?page+1:pages }">下一页</a>
				<a href="list?page=${pages }">尾页</a>
				<button onclick="qx()">全选</button>
				<button onclick="plsc()">批量删除</button>
			</td>
		</tr>
	</table>
</body>
</html>