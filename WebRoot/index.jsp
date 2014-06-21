<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>DWR</title>
<script type="text/javascript" src="${basePath}jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${basePath}dwr/engine.js"></script>
<script type="text/javascript" src="${basePath}dwr/interface/messagePush.js"></script>
</head>
<body>
	<table border="0">
		<tr>
			<td><input id="content" type="text" /></td>
			<td><input id="send" type="button" value="send" /></td>
		</tr>
	</table>
	<script type="text/javascript">
		$("#send").click(function() {
			var content = $("#content").val();
			messagePush.send(content);
		});
	</script>
</body>
</html>
