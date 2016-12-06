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
	function cBclr(element){
		element.bgColor="8e8eff";
	}

	function rBclr(element){
		element.bgColor="e8e8e8";
	}
	
	function delCookie() {
		setCookie("daychoice", "");
		setCookie("acachoice", "");
		setCookie("majorchoice", "");
		setCookie("board_value","");
		//location.reload()
	}

	function trClick(str){
		setCookie("board_value", str, myday);
	//	alert(document.cookie);
		setCookie("reg_text","");

		parent.frames['board'].location.reload();
	//	setTimeout("delCookie()", 2000);
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
</script>

<%
	request.setCharacterEncoding("UTF-8");
	int dayForCase = 0;
	int acaForCase = 0;
	int majorForCase = 0;
	String value = "";//daychoice
	String value1="";//acachoice
	String value2="";//majorchoice
	String day_confirm="";
	String aca_confirm="";
	String major_confirm="";
   
	boolean isday = false;
	boolean isaca = false;
	boolean ismajor = false;

	Cookie[] cookies = request.getCookies();
	if(cookies!= null && cookies.length > 0){
		for(int i=0; i<cookies.length; i++){
			if (cookies[i].getName().equals("daychoice")){
				value = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			//	out.println("<font size='2'>입력내용 : " + value + "</font><br><br>");
			}
			else if(cookies[i].getName().equals("acachoice")){
				value1 = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			//	out.println("<font size='2'>입력내용 : " + value1 + "</font><br><br>");
			}
			else if(cookies[i].getName().equals("majorchoice")){
				value2 = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			//	out.println("<font size='2'>입력내용 : " + value2 + "</font><br><br>");
			}
		}
	}
   
   if(value.equals("all_day")){
		dayForCase=0;
	}
   else if(value.equals("mon")){
		dayForCase=1;
   }
   else if(value.equals("tue")){
		dayForCase=2;
   }
   else if(value.equals("wed")){
		dayForCase=3;
   }
   else if(value.equals("thu")){
		dayForCase=4;
   }
   else if(value.equals("fri")){
		dayForCase=5;
   }
	
   if(value1.equals("all_aca")){
	   acaForCase=0;
   }
   else if(value1.equals("aca_1")){
		acaForCase=1;
	}
   else if(value1.equals("aca_2")){
		acaForCase=2;
   }
   else if(value1.equals("aca_3")){
		acaForCase=3;
   }
   else if(value1.equals("aca_4")){
		acaForCase=4;
   }

   if(value2.equals("all_major")){
	   majorForCase=0;
   }
   else if(value2.equals("major_inf")){
		majorForCase=1;
	}
	else if(value2.equals("major_elc")){
		majorForCase=2;
   }
   else if(value2.equals("major_com")){
		majorForCase=3;
   }
   else if(value2.equals("major_machine")){
		majorForCase=4;
   }
   else if(value2.equals("major_flight")){
		majorForCase=5;
   }
   else if(value2.equals("major_mat")){
		majorForCase=6;
   }
   else if(value2.equals("major_bus")){
		majorForCase=7;
   }
   else if(value2.equals("major_eng")){
		majorForCase=8;
   }
   else if(value2.equals("major_tra")){
		majorForCase=9;
   }
   else if(value2.equals("major_law")){
		majorForCase=10;
   }
   else if(value2.equals("major_trade")){
		majorForCase=11;
   }
   else if(value2.equals("major_etc")){
		majorForCase=12;
   }


   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   PreparedStatement pstmt;
   ResultSet rs;

	switch(dayForCase){//daychoice
	  case 0:
		isday = true;break;
      case 1:
		day_confirm="timeT>0 AND timeT<=10";break;
      case 2:
		day_confirm="timeT>10 AND timeT<=20";break;
      case 3:
		day_confirm="timeT>20 AND timeT<=30";break;
      case 4:
		day_confirm="timeT>30 AND timeT<=40";break;
      case 5:
		day_confirm="timeT>40 AND timeT<=50";break;
      default:
		day_confirm="";break;
	}
   switch(acaForCase)//acachoice
   {
	   case 0:
			isaca = true;break;
      case 1:
			aca_confirm="year='1'";break;
      case 2:
			aca_confirm="year='2'";break;
      case 3:
			aca_confirm="year='3'";break;
      case 4:
			aca_confirm="year='4'";break;
      default:
			aca_confirm="";break;
   }

   switch(majorForCase){//majorchoice
	   case 0:
			ismajor = true; break;
      case 1:
			major_confirm="(major='정보통신공학' OR major ='항전정학부')";break;
      case 2:
			major_confirm="(major='전자및항공' OR major ='항전정학부')";break;
      case 3:
			major_confirm="(major='컴퓨터정보공학' OR major ='항전정학부')";break;
      case 4:
			major_confirm="major='항우기학부'";break;
	  case 5:
			major_confirm="major='항공운항'";break;
      case 6:
			major_confirm="major='항공재료'";break;
      case 7:
			major_confirm="major='경영학과'";break;
      case 8:
			major_confirm="major='영어'";break;
	  case 9:
			major_confirm="(major ='항공교통' OR major ='항교물법학부')";break;
      case 10:
			major_confirm="(major ='우주법' OR major ='항교물법학부')";break;
      case 11:
			major_confirm="(major ='물류' OR major='항교물법학부')";break;
		case 12:
			major_confirm="major='교양'";break;
      default:       
         break;
   }


	if(isday && isaca && ismajor){
		rs = stmt.executeQuery("SELECT * FROM subjects;" );
	}else if(!isday && isaca && ismajor){
		rs = stmt.executeQuery("SELECT * FROM subjects where "+day_confirm+";");
	}else if(isday && !isaca && ismajor){
		rs = stmt.executeQuery("SELECT * FROM subjects where "+aca_confirm+";");
	}else if(isday && isaca && !ismajor){
		rs = stmt.executeQuery("SELECT * FROM subjects where "+major_confirm+";");
	}else if(!isday && !isaca && ismajor){
		rs = stmt.executeQuery("SELECT * FROM subjects where "+day_confirm+" AND "+aca_confirm+";");
	}else if(!isday && isaca && !ismajor){
		rs = stmt.executeQuery("SELECT * FROM subjects where "+day_confirm+" AND "+major_confirm+";");
	}else if(isday && !isaca && !ismajor){
		rs = stmt.executeQuery("SELECT * FROM subjects where "+aca_confirm+" AND "+major_confirm+";");
	}else{
		rs = stmt.executeQuery("SELECT * FROM subjects where "+day_confirm+" AND "+aca_confirm+" AND "+major_confirm+";");
	}
   //PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM subjects where timeT>0 AND timeT<=10;");  // SELECT   질의를 지닌 PreparedStatement 객체 생성

   //rs = pstmt.executeQuery();  // PreparedStatement 객체의 질의 수행 (출력위한 rs객체 생성)
	String no, major, name, classify, year, prof, time, credit, timeT;
	out.println("<table bgcolor='e8e8e8'>");
	out.println("<tr><td align='center' width='70'><font size='2' style=font-family:'돋움'>과목번호</font></td>");
	out.println("<td align='center' width='200'><font size='2' style=font-family:'돋움'>과목명</font></td>");
	out.println("<td align='center' width='70'><font size='2' style=font-family:'돋움'>학년</font></td>");
	out.println("<td align='center' width='70'><font size='2' style=font-family:'돋움'>이수구분</font></td>");
	out.println("<td align='center' width='70'><font size='2' style=font-family:'돋움'>학점</font></td>");
	out.println("<td align='center' width='130'><font size='2' style=font-family:'돋움'>교수</font></td>");
	out.println("<td align='center' width='110'><font size='2' style=font-family:'돋움'>학과</font></td>");
	out.println("<td align='center' width='130'><font size='2' style=font-family:'돋움'>교시</font></td></tr>");
//	out.println("<td align='center' width='100'><font size='2'>관리자용시간</font></td></tr>");

   
	while(rs.next()){
		no = rs.getString("no");
		name = rs.getString("name");
		year = rs.getString("year");
		classify = rs.getString("class");
		credit = rs.getString("credit");
		prof = rs.getString("prof");
		major = rs.getString("major");
		time = rs.getString("time");
		timeT = rs.getString("timeT");

		out.println("<tr onmouseover='cBclr(this)' onmouseout='rBclr(this)'><td align='center'><font size='2' style=font-family:'돋움'>"+ no + "</font></a></td>");
		out.println("<td align='center'><a name=" + no + " onclick='trClick(this.name)'style='cursor:hand;'><font size='2' style=font-family:'돋움'>" + name + "</font></td>");
		out.println("<td align='center'><font size='2' style=font-family:'돋움'>" + year + "</font></td>");
		out.println("<td align='center'><font size='2' style=font-family:'돋움'>" + classify + "</font></td>");
		out.println("<td align='center'><font size='2' style=font-family:'돋움'>" + credit + "</font></td>");
		out.println("<td align='center' width='130'><font size='2' style=font-family:'돋움'>" + prof + "</font></td>");
		out.println("<td align='center'><font size='2' style=font-family:'돋움'>" + major + "</font></td>");
		out.println("<td align='center'' width='130'><font size='2' style=font-family:'돋움'>" + time + "</font></td><tr>");
	//	out.println("<td align='center'><font size='2'>" + timeT + "</font></td></tr>");
	}

	out.print("</table>");
	rs.close();
	stmt.close();
%>
</body>
</html>