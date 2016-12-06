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
	function chkClic(element, cb){

		if(cb.checked){
				element.strs.value += cb.name + " ";
//				alert(element.strs.value);
		}
		else{
			var tmps = element.strs.value.split(" ");
			for(var i=0; i<tmps.length; i++){
				if(tmps[i] == cb.name){
//					alert("tmps[i] : " + tmps[i]);
//					alert("i : "+i);
					tmps[i] = " ";
				}
				element.strs.value = tmps.join(" ");
			}
		}
	}

	function btnClic(element){
		element.chk.value="true";
		element.submit();
	}

-->
  </script>
</head>
<body>
<form name="form">
<input type="hidden" name="chk">
<input type="hidden" name="strs">
<%
//	out.println(request.getParameter("chk"+"<br>"));

	boolean chk;
	
	if(request.getParameter("chk") == null){
		chk = false;
	}
	else{
		chk = true;
	}


	if(chk)
	{
		String[] strs = request.getParameter("strs").split(" ");
		   
		Connection connT = ConnectionContext.getConnection();
		Statement stmtT = connT.createStatement();

		for(int i=0; i<strs.length; i++){
//			out.println(strs[i]+"<br>");
			stmtT.executeUpdate("DELETE FROM users WHERE id='" + strs[i] + "';");
		}
		stmtT.close();
		out.println("<font size='2' style=font-family:'돋움'><b>삭제되었습니다.</b></font><br>");
	}


	request.setCharacterEncoding("UTF-8");


	String Aname_confirm = request.getParameter("name");
	String aca_confirm = request.getParameter("year");
	String major_confirm = request.getParameter("major");

	String Aaca_confirm;
	String Amajor_confirm;


	if(Aname_confirm == null){
		Aname_confirm = "";
	}
	else{
		Aname_confirm = Aname_confirm;
	}

	if(aca_confirm == null){
		Aaca_confirm = "전체학년";
	}
	else{
		Aaca_confirm = aca_confirm;
	}

	if(major_confirm == null){
		Amajor_confirm = "공통";
	}
	else{
		Amajor_confirm = major_confirm;
	}

   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   ResultSet rs;
	out.println("<table bgcolor='f9faeb' width='600'>");


try{
	
	String tmp="";
		
	if(Aname_confirm != "" && !(Aaca_confirm.equals("전체학년")) && !(Amajor_confirm.equals("공통"))){
		tmp = "where name='" + Aname_confirm + "' AND year ='" + Aaca_confirm +"' AND major='" + Amajor_confirm + "';";
	}
	else if(Aname_confirm == "" &&  !(Aaca_confirm.equals("전체학년")) && !(Amajor_confirm.equals("공통"))){
		tmp = "where year='" + Aaca_confirm +"' AND major = '" + Amajor_confirm + "';"; 
	}
	else if(Aname_confirm != "" &&  Aaca_confirm.equals("전체학년") && !(Amajor_confirm.equals("공통"))){
		tmp = "where name='" + Aname_confirm +"' AND major = '" + Amajor_confirm + "';";
	}
	else if(Aname_confirm == "" &&  Aaca_confirm.equals("전체학년") && !(Amajor_confirm.equals("공통"))){
		tmp = "where major='" + Amajor_confirm + "';";
	}

	else if(Aname_confirm != "" &&  !(Aaca_confirm.equals("전체학년")) && Amajor_confirm.equals("공통")){
		tmp = "where name='" + Aname_confirm +"' AND year = '" + Aaca_confirm + "';";
	}
	else if(Aname_confirm == "" &&  !(Aaca_confirm.equals("전체학년")) && Amajor_confirm.equals("공통")){
		tmp = "where year='" + Aaca_confirm + "';";
	}
	else if(Aname_confirm != "" &&  Aaca_confirm.equals("전체학년") && Amajor_confirm.equals("공통")){
		tmp = "where name='" + Aname_confirm + "';";
	}
	else{// if(Aname_confirm == null &&  Aaca_confirm.equals("전체학년") && Amajor_confirm.equals("공통")){
		tmp = "";
	}


	rs = stmt.executeQuery("SELECT * FROM users " + tmp);

	out.println("<tr><td align='center' width='30'><font size='2' style=font-family:'돋움'>선택</font></td>");
	out.println("<td align='center' width='70'><font size='2' style=font-family:'돋움'>ID</font></td>");
	out.println("<td align='center' width='200'><font size='2' style=font-family:'돋움'>이름</font></td>");
	out.println("<td align='center' width='70'><font size='2' style=font-family:'돋움'>학년</font></td>");
	out.println("<td align='center'><font size='2' style=font-family:'돋움'>전공</font></td></tr>");

	String id, name, year, major;

	while(rs.next()){
		id = rs.getString("id");
		name = rs.getString("name");
		year = rs.getString("year");
		major = rs.getString("major");

		out.println("<tr><td align='center' width='20'><input type='checkbox' name='" + id + "' onclick='chkClic(form, this)'></td>");
		out.println("<td align='center'><font size='2' style=font-family:'돋움'>"+ id + "</font></a></td>");
		out.println("<td align='center'><a name=" + name + " onclick='trClick(this.name)'style='cursor:hand;'><font size='2' style=font-family:'돋움'>" + name + "</font></td>");
		out.println("<td align='center'><font size='2' style=font-family:'돋움'>" + year + "</font></td>");
		out.println("<td align='center'><font size='2' style=font-family:'돋움'>" + major + "</font></td><tr>");
	}

	out.print("</table>");

	rs.close();
	}catch(Exception e){ out.println("22"); 
	}
	stmt.close();
%>

<br><input type="button" value="삭제" onclick="btnClic(form)" style="font-family:'돋움'">
</body>
</html>
