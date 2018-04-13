<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询商品列表</title>
<script type="text/javascript">
	function deleteItemsAll() {
		document.itemsForm.action = "${pageContext.request.contextPath }/items/deleteItemsAll.do";
		document.itemsForm.submit();
	}
</script>
</head>
<body>
	${username },你好！！
	<a href="${pageContext.request.contextPath }/logout">退出登录</a>

	<form name="itemsForm"
		action="${pageContext.request.contextPath }/items/queryItems.do"
		method="post">
		查询条件：
		<table width="100%" border=1>
			<tr>
				<td>商品名称：<input type="text" name="items.name" /></td>
				<td>商品分类： <select name="itemsType">
						<c:forEach items="${itemsType }" var="type">
							<option value="${type.key }">${type.value }</option>
						</c:forEach>
				</select></td>
				<td><input type="submit" value="查询" /></td>
				<td><input type="button" value="批量删除"
					onclick="deleteItemsAll()" /></td>
			</tr>
		</table>
		商品列表：
		<table width="100%" border=1>
			<tr>
				<td>选择</td>
				<td>商品名称</td>
				<td>商品价格</td>
				<td>生产日期</td>
				<td>商品描述</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${itemsList }" var="item">
				<tr>
					<td><input type="checkbox" name="itemsId" value="${item.id }"></td>
					<td>${item.name }</td>
					<td>${item.price }</td>
					<td><fmt:formatDate value="${item.createtime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${item.detail }</td>

					<td><a
						href="${pageContext.request.contextPath }/items/editItems.do?id=${item.id}">修改</a></td>

				</tr>
			</c:forEach>

		</table>
	</form>
</body>

</html>