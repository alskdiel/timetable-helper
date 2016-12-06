<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="java.net.URLDecoder" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>Document</title>
  <meta http-equiv="Context-Type" context="text/html;charset=UTF-8" />
  <script language="javascript">
<!--
	var sec = 3;
	function clo(){
		cSec();
		setTimeout("wClo()", 2000); 
	}
	function wClo(){
		
		location.replace("/jspbook/termP/index.html")
	}
	function cSec(){
		sec -= 1;
		span.innerHTML = sec;
		setTimeout("cSec()", 1000);
	}
-->
  </script>
</head>
<body>
<br>
<table align='center'><tr><td><font size='2' color='676767'>로그아웃 되었습니다.</font></td></tr>
<tr><td align='center'><font size='2' color='676767'><span id="span"></span>초후 처음화면으로 돌아갑니다.</font></td></tr></table>

<%
	session.invalidate();
%>

<script language="javascript">

clo();
</script>
</body>
</html>
