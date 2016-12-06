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
	var sec = 4;
	function clo(){
		cSec();
		setTimeout("wClo()", 3000); 
	}
	function wClo(){
		
		window.close();
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
<font size='2' color='676767' style="font-family:'돋움'"><span id="span" style="font-family:'돋움'"></span>초후 자동으로 창이 닫힙니다.</font>

<%
	request.setCharacterEncoding("UTF-8");


	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs;

	try{  
		rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM users WHERE id='" + request.getParameter("id") + "';");
		while(rs.next()){
			int recordCount = rs.getInt("recordCount");
				if (recordCount != 1) {
					PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (id, pw, name, year, major) VALUES (?, ?, ?, ?, ?);");  //  INSERT 질의 지닌 PreparedStatement 객체 생성
					pstmt.setString(1, request.getParameter("id"));
					pstmt.setString(2, request.getParameter("pwch"));
					pstmt.setString(3, request.getParameter("name"));
					pstmt.setString(4, request.getParameter("year"));
					pstmt.setString(5, request.getParameter("major"));

					pstmt.executeUpdate();  // PreparedStatement 객체의 질의 수행
					pstmt.close();
				}
		}
		rs.close();
		stmt.executeUpdate("CREATE TABLE " + request.getParameter("id") + " (sc char(10));");
		out.println("<table bgcolor='e8e8e8'>");
		out.println("<font size='2' style=font-family:'돋움'>가입되었습니다.</font>");
		
	}catch(Exception e)
	{
		out.println("<font size='2' style=font-family:'돋움'>중복된 아이디 입니다.</font>");
	}


	
	stmt.close();

%>

<script language="javascript">

clo();
</script>
</body>
</html>
