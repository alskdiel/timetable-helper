<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<meta http-equiv="Context-Type" context="text/html;charset=UTF-8" />
  <title>addDB</title>
	<script language="javascript">
<!--
	function setCookie(name, value, expires) {
		document.cookie = name + "=" + encodeURI(value) + "; path=/" + ((expires == null) ? "" : "; expires=" + expires.toGMTString());
	}

	function confirm(element){
		alert(element.query.value);
		setCookie("addSubject", element.query.value, myday);
		parent.frames['confirmSubject'].location.reload();
		form.query.value="";
	}

-->
	</script>
</head>
<body>
<%

System.out.println(request.getCharacterEncoding());
%>


<SCRIPT LANGUAGE="JavaScript"> 
	var myday = new Date();
	myday.setTime(myday.getTime() +  (365 * 24 * 60 * 60 * 1000));
</script>


<form name="form" method="post">
	<table>
		<tr>
			<td colspan="2"><font size="2" style="font-family:'돋움'"><b>DB정보 입력</b>&nbsp&nbsp&nbsp&nbsp&nbsp</font><font size="1">//</font><font size="2" style="font-family:'돋움'"> 순번/과목명/학년/이수구분/학점/교수/학과/교시/관리자용시간 순으로 입력하세요.</font></td>
		</tr>
		<tr>
			<td><input type="text" name="query" size="50"></td><td><font size="2" style="font-family:'돋움'">ex)0001/IT융합SW설계/3/전선/3/한정희/정보통신공학/수5 6 7 8/25 26 27 28
</font></td>
		</tr>
		<tr>
			<td><input type="button" name="submit"  style="font-family:'돋움'" value="확인" onclick="confirm(form)" ></td>
		</tr>
	</table>
</form>
</body>
</html>
