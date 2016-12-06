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

-->
  </script>
</head>
<body>

<%
   request.setCharacterEncoding("UTF-8");

   String value = "";

   Cookie[] cookies = request.getCookies();
   if(cookies!= null && cookies.length > 0){
      for(int i=0; i<cookies.length; i++){
         if (cookies[i].getName().equals("myID")){
            value = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
         }
      }
   }

   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();

   ResultSet rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM users WHERE id='" + value + "';");
   while(rs.next()){
      int recordCount = rs.getInt("recordCount");
         if (recordCount != 1) {
%>
<script language="javascript">
window.resizeTo("300","80");
alert("사용가능한 아이디 입니다.");
window.close();
</script>
<%      }
         else{
%>
<script language="javascript">
window.resizeTo("150","80");
alert("사용 불가능한 아이디 입니다.");
window.close();
</script>
<%      }   
   }
%>
</body>
</html>