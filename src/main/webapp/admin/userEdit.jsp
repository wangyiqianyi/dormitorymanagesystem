<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$.messager.progress('close');
		$('#admin_user_editform').form({
			url : '${pageContext.request.contextPath}/userAction!edit.action',
			onSubmit : function() {
				$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				$.messager.progress('close');
				result = $.parseJSON(result);
				if (result.success) {
					$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					$.modalDialog.handler.dialog('close');
				} else {
					$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="admin_user_editform" method="post">
			<table class="table table-hover table-condensed">
				<tr>
					<th>编号</th>
					<td><input name="id" type="text" class="span2" value="${user.id}" readonly="readonly"></td>
					<th>登录名称</th>
					<td><input name="name" type="text" placeholder="请输入登录名称" class="easyui-validatebox span2" data-options="required:true" value="${user.name}"></td>
				</tr>
			</table>
		</form>
	</div>
</div>