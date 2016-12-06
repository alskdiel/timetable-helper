<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<meta http-equiv="Context-Type" context="text/html;charset=UTF-8" />
  <title>Document</title>
  <script language="javascript">
<!--
	function setCookie(name, value, expires) {
		document.cookie = name + "=" + encodeURI(value) + "; path=/" + ((expires == null) ? "" : "; expires=" + expires.toGMTString());
	}

	function delCookie() {
		setCookie("daychoice", "");
		setCookie("acachoice", "");
		setCookie("majorchoice", "");
		setCookie("board_value","");
		setCookie("pt","0");
		setCookie("reg_text","");
		location.reload()
	}
   
   function setCookie(name, value, expires) {
      document.cookie = name + "=" + encodeURI(value) + "; path=/" + ((expires == null) ? "" : "; expires=" + expires.toGMTString());
   }
   function day_confirm(element){   
      setCookie("daychoice", element.value, myday);
      parent.frames['boardList'].frames['board_right'].location.reload();
   }
   function aca_confirm(element)
   {
      setCookie("acachoice", element.value, myday);
      parent.frames['boardList'].frames['board_right'].location.reload();
   }
   function major_confirm(element)
   {
      setCookie("majorchoice", element.value, myday);
      parent.frames['boardList'].frames['board_right'].location.reload();
   }
-->
  </script>
</head>
<body>
<SCRIPT LANGUAGE="JavaScript"> 
   var myday = new Date();
   myday.setTime(myday.getTime() +  (365 * 24 * 60 * 60 * 1000));
</script>

<form name="form">
<tr><td>
<select name="day_choice" onchange="day_confirm(this)" style="font-family:'돋움'">
   <option value="all_day" selected>전체요일
   <option value="mon" >월요일
   <option value="tue" >화요일
   <option value="wed" >수요일
   <option value="thu" >목요일
   <option value="fri" >금요일
</select>
<br>
<br>
<select name="aca_choice" onchange="aca_confirm(this)" style="font-family:'돋움'">
   <option value="all_aca" selected>전체학년
   <option value="aca_1">1학년
   <option value="aca_2">2학년
   <option value="aca_3">3학년
   <option value="aca_4">4학년
</select>
<br>
<br>
<select name="major_choice" onchange="major_confirm(this)" style="font-family:'돋움'">
   <option value="all_major" selected>공통
   <option value="major_elc">전자및항공
   <option value="major_inf">정보통신공학
   <option value="major_com">컴퓨터정보공학
   <option value="major_machine">항우기학부
   <option value="major_flight">항공운항
   <option value="major_mat">항공재료
   <option value="major_bus">경영학과
   <option value="major_eng">영어
   <option value="major_tra">항공교통
   <option value="major_law">우주법
   <option value="major_trade">물류
   <option value="major_etc">교양
</select>
</form>
</body>
</html>