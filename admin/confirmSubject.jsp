<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="java.net.URLDecoder" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Context-Type" context="text/html;charset=UTF-8" />
	<title>confirmSubject</title>
</head>

<body bgcolor="f3f3f3">
	<font size="2"><b>&nbsp&nbsp&nbsp&nbsp데이터 목록</b></font><br>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("charset::"+request.getCharacterEncoding());

	String value = "";

	Cookie[] cookies = request.getCookies();
	if(cookies!= null && cookies.length > 0){
		for(int i=0; i<cookies.length; i++){
			if (cookies[i].getName().equals("addSubject")){
				value = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				System.out.print(value);
				out.println("<font size='2'>입력내용 : " + value + "</font><br><br>");
			}
		}
	}

	String[] subjectInfo = value.split("/");

	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs;

	try{  
		rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM subjects WHERE no='" + subjectInfo[0] + "';");
		while(rs.next()){
			int recordCount = rs.getInt("recordCount");
				if (recordCount != 1) {
					PreparedStatement pstmt = conn.prepareStatement("INSERT INTO subjects (no, name, year, class, credit, prof, major, time, timeT) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");  //  INSERT 질의 지닌 PreparedStatement 객체 생성
					pstmt.setString(1, subjectInfo[0]);
					pstmt.setString(2, subjectInfo[1]);
					pstmt.setString(3, subjectInfo[2]);
					pstmt.setString(4, subjectInfo[3]);
					pstmt.setString(5, subjectInfo[4]);
					pstmt.setString(6, subjectInfo[5]);
					pstmt.setString(7, subjectInfo[6]);
					pstmt.setString(8, subjectInfo[7]);
					pstmt.setString(9, subjectInfo[8]);
					pstmt.executeUpdate();  // PreparedStatement 객체의 질의 수행
					pstmt.close();
				}
		}
	}catch(Exception e){}
	out.println("<table bgcolor='e8e8e8'>");
	out.println("<tr><td align='center' width='70'><font size='2' style=font-size:12px>과목번호</font></td><td align='center' width='200'><font size='2'style=font-size:12px>과목명</font></td><td align='center' width='70'><font size='2'style=font-size:12px>학년</font></td><td align='center' width='70'><font size='2'style=font-size:12px>이수구분</font></td><td align='center' width='70'><font size='2'style=font-size:12px>학점</font></td><td align='center' width='70'><font size='2'style=font-size:12px>교수</font></td><td align='center' width='110'><font size='2'>학과</font></td><td align='center' width='70'><font size='2'style=font-size:12px>교시</font></td><td align='center' width='100'><font size='2'style=font-size:12px>관리자용시간</font></td></tr>");

	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM subjects;");  // SELECT   질의를 지닌 PreparedStatement 객체 생성

	rs = pstmt.executeQuery();  // PreparedStatement 객체의 질의 수행 (출력위한 rs객체 생성)
	String no, major, name, classify, year, prof, time, credit, timeT;
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

		out.println("<tr><td align='center'><font size='2' style=font-size:12px>" + no + "</font></td><td align='center'><font size='2' style=font-size:12px>" + name + "</font></td><td align='center'><font size='2' style=font-size:12px>" + year + "</font></td><td align='center'><font size='2' style=font-size:12px>" + classify + "</font></td><td align='center'><font size='2' style=font-size:12px>" + credit + "</font></td><td align='center'><font size='2' style=font-size:12px>" + prof + "</font></td><td align='center'><font size='2' style=font-size:12px>" + major + "</font></td><td align='center'><font size='2' style=font-size:12px>" + time + "</font></td><td align='center'><font size='2' style=font-size:12px>" + timeT + "</font></td></tr>");
	}

	rs.close();
	stmt.close();
%>


	</table>
	</body>
</html>