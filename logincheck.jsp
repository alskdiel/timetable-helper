<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="java.net.URLDecoder" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>logincheck</title>
  <meta http-equiv="Context-Type" context="text/html;charset=UTF-8" />
  <script language="javascript">
<!--


	
-->
  </script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = "";
	String pw = "";

	String conf = (String)session.getAttribute("log");

	if(conf == "true"){%>
		<jsp:forward page="/termP/loggedin/main.html"/>
	<%}
	else{

	Connection conn = ConnectionContext.getConnection();
	ResultSet rs;
	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM users;");  // SELECT   질의를 지닌 PreparedStatement 객체 생성

	rs = pstmt.executeQuery();  // PreparedStatement 객체의 질의 수행 (출력위한 rs객체 생성)
	
	while(rs.next()){
		if(rs.getString("id").equals(request.getParameter("id"))){
			id = rs.getString("id");
			pw = rs.getString("pw");
		}
	}

	if(id.equals("admin") && pw.equals(request.getParameter("pw"))){%>
		<jsp:forward page="/termP/admin/admin_main.html"/>
<%}
	else if(id.equals(request.getParameter("id")) && pw.equals(request.getParameter("pw"))){
		session.setAttribute("log", "true");
		session.setAttribute("login_id",request.getParameter("id"));
			%>
		<jsp:forward page="/termP/loggedin/main.html"/>
<%}
	else{ // span으로 밑에 글자 띄우기 (아이디 또는 비밀번호가 일치하지 않습니다.)
		session.setAttribute("log", "false");
		out.println("<br><br><br><br><br><br><br><br><br><br><br><br><br><br>");	
		out.println("<table align='center'><tr><td><font size='2' color='676767'>아이디 또는 비밀번호가 일치하지 않습니다.</font></td></tr>");
		out.println("<tr><td align='center'><font size='2' color='676767'>첫 페이지로 돌아갑니다.</font></td></tr></table>");
%>
<script language="javascript">
setTimeout("location.replace('index.html')", 1700);
</script>
<%}}
%>
</body>
</html>
