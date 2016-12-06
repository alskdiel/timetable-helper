<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="java.net.URLDecoder" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.lang.String"%>
<html>
<html>
<head>
  <title>Document</title>
  <meta http-equiv="Context-Type" context="text/html;charset=UTF-8" />
  <script language="javascript">
<!--
   function reg_com(element){
      setCookie("reg_text", "on", myday);
      setTimeout("delCookie()", 1000);
      element.submit();
      element.text.value = "";
   }

   function starClicked(element, str){
      if(str == 1){
         element.s1.src = "../images/Wstar_y.jpg";
         element.s2.src = "../images/Wstar_w.jpg";
         element.s3.src = "../images/Wstar_w.jpg";
         element.s4.src = "../images/Wstar_w.jpg";
         element.s5.src = "../images/Wstar_w.jpg";
      }
      else if(str == 2){
         element.s1.src = "../images/Wstar_y.jpg";
         element.s2.src = "../images/Wstar_y.jpg";
         element.s3.src = "../images/Wstar_w.jpg";
         element.s4.src = "../images/Wstar_w.jpg";
         element.s5.src = "../images/Wstar_w.jpg";
      }
      else if(str == 3){
         element.s1.src = "../images/Wstar_y.jpg";
         element.s2.src = "../images/Wstar_y.jpg";
         element.s3.src = "../images/Wstar_y.jpg";
         element.s4.src = "../images/Wstar_w.jpg";
         element.s5.src = "../images/Wstar_w.jpg";
      }
      else if(str == 4){
         element.s1.src = "../images/Wstar_y.jpg";
         element.s2.src = "../images/Wstar_y.jpg";
         element.s3.src = "../images/Wstar_y.jpg";
         element.s4.src = "../images/Wstar_y.jpg";
         element.s5.src = "../images/Wstar_w.jpg";
      }
      else if(str == 5){
         element.s1.src = "../images/Wstar_y.jpg";
         element.s2.src = "../images/Wstar_y.jpg";
         element.s3.src = "../images/Wstar_y.jpg";
         element.s4.src = "../images/Wstar_y.jpg";
         element.s5.src = "../images/Wstar_y.jpg";
      }
      setCookie("pt", str, myday);
   }

   function delCookie() {
      setCookie("pt","0");
      setCookie("reg_text","");
      //location.reload()
   }

   function setCookie(name, value, expires) {
      document.cookie = name + "=" + encodeURI(value) + "; path=/" + ((expires == null) ? "" : "; expires=" + expires.toGMTString());
   }
-->
  </script>
</head>
<body>

<SCRIPT LANGUAGE="JavaScript"> 

   var myday = new Date();
   myday.setTime(myday.getTime() +  (365 * 24 * 60 * 60 * 1000));
   delCookie();
</script>

<form action="board.jsp" name="form">
<table>
<tr>
<td><font size='2' style=font-family:'돋움'>댓글달기</font></td>
<td width="220" align="right">
<img style="cursor:hand;" src="../images/Wstar_w.jpg" width="15" name="s1" onclick="starClicked(form, '1')">
<img style="cursor:hand;" src="../images/Wstar_w.jpg" width="15" name="s2" onclick="starClicked(form, '2')">
<img style="cursor:hand;" src="../images/Wstar_w.jpg" width="15" name="s3" onclick="starClicked(form, '3')">
<img style="cursor:hand;" src="../images/Wstar_w.jpg" width="15" name="s4" onclick="starClicked(form, '4')">
<img style="cursor:hand;" src="../images/Wstar_w.jpg" width="15" name="s5" onclick="starClicked(form, '5')">
<font size="1" style=font-family:'돋움'>&nbsp&nbsp평점주기</font>
</td>
</tr>
</table>

<textarea name="text" cols="30" rows="3" style="overflow:hidden" maxLength=25></textarea>
<img src="../images/reg_com.jpg" width="58" onclick="reg_com(form)"><br>
<font size='1'>띄어쓰기 포함 25자 이내로 입력하세요.</font>
</form>
<%
request.setCharacterEncoding("UTF-8");
String result_no="";
String result_sNo="";
String result_name="";
String result_text="";
String result_time="";
String pt="";
String result_pt="";
String user_name="";
String reg_text="";

   Cookie[] cookies = request.getCookies();
   if(cookies!= null && cookies.length > 0){
      for(int i=0; i<cookies.length; i++){
         if (cookies[i].getName().equals("board_value")){
            result_no = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
         }
         if (cookies[i].getName().equals("reg_text")){
            reg_text = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
         }
         if (cookies[i].getName().equals("pt")){
            pt = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
         }
      }
   }

   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   PreparedStatement pstmt;
   ResultSet rs;

   if(reg_text.equals("on")){
      rs=stmt.executeQuery("SELECT * FROM users where id='"+(String)session.getAttribute("login_id")+"';");
      while(rs.next()){
         user_name = rs.getString("name");
      }
      String d_tmp="";
      Date D = new Date();
      if(D.getSeconds() < 10){
         d_tmp = "0" + D.getSeconds();   // 인티저를 스트링으로
      }
      String cmt_time = Integer.toString(D.getYear()-100) + "/" + Integer.toString(D.getMonth()+1) + "/" + Integer.toString(D.getDate()) + "&nbsp&nbsp&nbsp" + D.getHours() + ":" + D.getMinutes();
      String tFororder = Integer.toString(D.getYear()-100) + "-" + Integer.toString(D.getMonth()+1) + "-" + Integer.toString(D.getDate()) + "-" + D.getHours() + "-" + D.getMinutes() + "-" + d_tmp;
      pstmt = conn.prepareStatement("INSERT INTO comments (sNo, name, text, time, pt, birth) VALUES (?, ?, ?, ?, ?, ?);");  //  INSERT 질의 지닌 PreparedStatement 객체 생성
      pstmt.setString(1, result_no);
      pstmt.setString(2, user_name);
      pstmt.setString(3, request.getParameter("text"));
      pstmt.setString(4, cmt_time);
      pstmt.setString(5, pt);
      pstmt.setString(6, tFororder);
      pstmt.executeUpdate();  // PreparedStatement 객체의 질의 수행
      pstmt.close();
   }

   rs=stmt.executeQuery("SELECT * FROM comments where sNo='"+result_no+"' order by birth desc;");
   while(rs.next()){
      result_sNo = rs.getString("sNo");
      result_name = rs.getString("name");
      result_text = rs.getString("text");
      result_time = rs.getString("time");
      result_pt = rs.getString("pt");
      int tmp =0;
      tmp = Integer.parseInt(result_pt);

      String printed_name = result_name.charAt(0) + "" + result_name.charAt(1) + "*";

      out.println("<table border='0' width='450'>");
      out.println("<tr bgcolor='eaedb4' height='33'><td colspan='2' align='center' width='100' border='0'><font size='2' style=font-family:'돋움'><b>" + printed_name + "</b></font></td><td align='center' width='100' border='0'>");
      for(int i=0; i<tmp; i++){
         out.println("<img src='../images/star_y.jpg' width='15'>");
      }
//      out.println("<td align='center' width='150'><font size='2' style=font-family:'돋움'>" + result_pt + "</font></td></tr>");
      out.println("</td><tr height='60'bgcolor='f8f9e3'><td colspan='3' align='center'><font size='2' style=font-family:'돋움'>" + result_text + "</font></td></tr>");
      out.println("<tr><td bgcolor='ffd9da' colspan='3' width='100' align='center'><font size='2' style=font-family:'돋움'>" + result_time + "</font></td></tr></table><br><br>");
   }
   rs.close();
      
   stmt.close();
   
%>

</body>
</html>
