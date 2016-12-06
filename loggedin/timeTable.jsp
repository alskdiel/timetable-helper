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
   var del_no;
   function setCookie(name, value, expires) {
      document.cookie = name + "=" + encodeURI(value) + "; path=/" + ((expires == null) ? "" : "; expires=" + expires.toGMTString());
   }
   function cBclr(element){
       element.bgColor="fff897";
   }

   function rBclr(element){
       element.bgColor="fffde8";
   }
   function del_table(kk,str)
   {
   if(confirm('선택한 테이블을 삭제하시겠습니까?')==true)
      {
      kk.delchoice.value=str;
      kk.submit();
//      alert(str);
      // setCookie("delchoice", str, myday);
      //parent.frames['timeTable'].location.reload();
      }
      else{
         return ;
      }
   }

   function my_save(str)
   {
      if(confirm('현재 시간표를 저장하시겠습니까?')==true)
      {
         //setCookie("savechoice",str,myday);
       str.save_msg.value="confirm";
       alert(str.save_msg.value);
       str.submit();
     }
      else{
         return ;
      }
   }

-->
  </script>

  <%!
   String[] subjectInfo;
   int num=0;
   int save_num=0;
   String[] stmp_timeT= new String[50];
   String[] sresult_total= new String[50];
   String[] ttmp_timeT= new String[10];
   String[] tresult_total= new String[10];
   String[] tmp_save=new String[50];
   int tnum=0;
   boolean isTime=true;
   String final_delno="ddd";
   String final_save="";
   String ssresult_total="";
   int count=0;
   boolean ischeck=false;

   String[] cresult_no = new String[50];
   String[] cresult_total= new String[50];
   String[] cresult_credit=new String[50];
   int cnum=0;
   int check=0;

  %>
</head>
<body>

<SCRIPT LANGUAGE="JavaScript"> 
   var myday = new Date();
   myday.setTime(myday.getTime() +  (365 * 24 * 60 * 60 * 1000));
   
</script>






<form name="form">
<input type="hidden" name="save_msg" value="">
<input type="hidden" name="delchoice" value="">
<table align="center" border="0" bgcolor='fffde8' width="1000" style="cursor:hand;">
<tr>
<th width="200" align="center"><span id="sugang" style="font-size:12px"></span></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">월</b></font></h1></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">화</b></font></h1></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">수</b></font></h1></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">목</b></font></h1></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">금</b></font></h1></th>
</tr>

<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 1교시</b></font></td>
<td onclick="del_table(form,'m1')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m1" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t1')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t1" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w1')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w1" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th1')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th1" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f1')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f1" style="font-size:12px"></span></td>
</tr>
  
<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 2교시</b></font></td>
<td onclick="del_table(form,'m2')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m2" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t2')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t2" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w2')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w2" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th2')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th2" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f2')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f2" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 3교시</b></font></td>
<td onclick="del_table(form,'m3')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m3" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t3')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t3" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w3')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w3" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th3')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th3" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f3')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f3" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 4교시</b></font></td>
<td onclick="del_table(form,'m4')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m4" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t4')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t4" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w4')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w4" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th4')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th4" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f4')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f4" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 5교시</b></font></td>
<td onclick="del_table(form,'m5')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m5" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t5')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t5" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w5')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w5" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th5')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th5" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f5')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f5" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 6교시</b></font></td>
<td onclick="del_table(form,'m6')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m6" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t6')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t6" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w6')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w6" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th6')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th6" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f6')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f6" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 7교시</b></font></td>
<td onclick="del_table(form,'m7')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m7" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t7')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t7" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w7')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w7" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th7')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th7" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f7')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f7" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 8교시</b></font></td>
<td onclick="del_table(form,'m8')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m8" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t8')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t8" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w8')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w8" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th8')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th8" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f8')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f8" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 야간 1교시</b></font></td>
<td onclick="del_table(form,'m9')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m9" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t9')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t9" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w9')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w9" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th9')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th9" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f9')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f9" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><font size="2"   style="font-family:'돋움'"><b> 야간 2교시</b></font></td>
<td onclick="del_table(form,'m10')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="m10" style="font-size:12px"></span></td>
<td onclick="del_table(form,'t10')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="t10" style="font-size:12px"></span></td>
<td onclick="del_table(form,'w10')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="w10" style="font-size:12px"></span></td>
<td onclick="del_table(form,'th10')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="th10" style="font-size:12px"></span></td>
<td onclick="del_table(form,'f10')" onmouseover='cBclr(this)' onmouseout='rBclr(this)' align="center"><span id="f10" style="font-size:12px"></span></td>
</tr>
<tr height="50"><td colspan="6" align="center"><input type="button" name="my_infsave" value="시간표저장" onclick="my_save(form)"></td></tr>
</table>
</form>
<%
request.setCharacterEncoding("UTF-8");

//out.print(session.getAttribute("login_id"));
if(session.getAttribute("login_id")==null)
count=0;


String result_no="";
String result_name="";
String result_prof="";
String result_timeT="";
String result_total="";
String result_credit="";
String tmp_timeT="";
//String


int i=0;int tmp_d=0; int tmp_m=0;//나머지연산



            result_no = request.getParameter("timetable_value");
         System.out.print(result_no);
//            out.println("<font size='2'>입력내용 : " + result_no + "</font><br><br>");


         
   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   PreparedStatement pstmt;
   ResultSet rs;
   rs=stmt.executeQuery("SELECT * FROM subjects where no='"+result_no+"';");
   while(rs.next())
   {
      result_name = rs.getString("name");
      result_prof = rs.getString("prof");
      result_timeT = rs.getString("timeT");
     result_credit = rs.getString("credit");
     result_total="<b>"+result_name+"<br>"+result_prof+"</b>";//과목하고 교수명




       subjectInfo=result_timeT.split(" ");//시간 쪼개기
      
       if((count+Integer.parseInt(result_credit))>21){
         
          out.println("<script language='javascript'>");
          out.println("document.getElementById('sugang').innerHTML='신청학점 : "+count+"';");
               out.println("alert('21학점초과');");
               out.println("</script>");

       }else{
         count+=Integer.parseInt(result_credit);
         out.println("<script language='javascript'>");
         out.println("document.getElementById('sugang').innerHTML='신청학점 : "+count+"';");
         out.println("</script>");

   for(int j=0; j<subjectInfo.length;j++){   
      for(i=0; i<51;i++)
      {
         if(subjectInfo[j].equals(Integer.toString(i)))
         {   
            tmp_d=(i-1)/10;
            tmp_m=(i-1)%10;
            if(tmp_d==0)
               tmp_timeT="m";
            else if(tmp_d==1)
               tmp_timeT="t";
            else if(tmp_d==2)
               tmp_timeT="w";
            else if(tmp_d==3)
               tmp_timeT="th";
            else if(tmp_d==4)
               tmp_timeT="f";
            if(tmp_m==0)
               tmp_timeT+="1";
            else if(tmp_m==1)
               tmp_timeT+="2";
            else if(tmp_m==2)
               tmp_timeT+="3";
            else if(tmp_m==3)
               tmp_timeT+="4";
            else if(tmp_m==4)
               tmp_timeT+="5";
            else if(tmp_m==5)
               tmp_timeT+="6";
            else if(tmp_m==6)
               tmp_timeT+="7";
            else if(tmp_m==7)
               tmp_timeT+="8";
            else if(tmp_m==8)
               tmp_timeT+="9";
            else if(tmp_m==9)
               tmp_timeT+="10";
            ttmp_timeT[tnum]=tmp_timeT;
            tresult_total[tnum]=result_total;

         
            tnum++;
            for(int k=0;k<num;k++){
               if(stmp_timeT[k].equals(tmp_timeT)){
                  isTime=false;
               }
            }
         }
      }
      
   }
for(int k=0;k<tnum;k++){

	for(int j=0;j<num;j++){
			if(stmp_timeT[j].equals(ttmp_timeT[k])){
				tresult_total[k]+=sresult_total[j];
				ischeck=true;
			}
	}

	if(ischeck){
				stmp_timeT[num]=ttmp_timeT[k];
               sresult_total[num]=tresult_total[k];

		ischeck=false;

	}else{
				stmp_timeT[num]=ttmp_timeT[k];
               sresult_total[num]=tresult_total[k];
            
               

	}
num++;

}
tnum=0;


   /*
            if(isTime){               //저장
               for(int k=0;k<tnum;k++){
               stmp_timeT[num]=ttmp_timeT[k];
               sresult_total[num]=tresult_total[k];
            
               num++;
               }
            cresult_credit[cnum] = result_credit;
            cresult_no[cnum] = result_no;
            cresult_total[cnum] = tresult_total[0];
            cnum++;

            tmp_save[save_num]=result_no;
            save_num++;
               tnum=0;
            }
*/
            for(int k=0;k<num;k++)
            {
               out.println("<script language='javascript'>");
               out.println("document.getElementById('"+stmp_timeT[k]+"').innerHTML='"+sresult_total[k]+"';");
               out.println("</script>");
            }

   }
   }//else
   
   
   //final_delno=request.getParameter("delchoice");
   if(request.getParameter("delchoice")==null)
      final_delno="ddd";
   else
      final_delno=request.getParameter("delchoice");

if(!final_delno.equals("ddd")){

for(int k=0;k<num;k++){
   if(final_delno.equals(stmp_timeT[k])){
      ssresult_total = sresult_total[k];
     
   }
}

final_delno="ddd";

for(int k=0;k<cnum;k++){
   if(cresult_total[k].equals(ssresult_total)){
         check = k;
         count-=Integer.parseInt(cresult_credit[k]);
   }

}




for(int k=0;k<save_num;k++){
   if(tmp_save[k].equals(cresult_no[check])){
         tmp_save[k] = tmp_save[save_num-1];
         save_num--;
   }
}


for(int k=0;k<num;k++){

   if(sresult_total[k].equals(ssresult_total)){
      
      for(int q=k;q<num-1;q++){
         sresult_total[q]=sresult_total[q+1];
         stmp_timeT[q]=stmp_timeT[q+1];
      
      }
    // count-=1;
    
      num--;
      k=-1;
     
   }
   
}



for(int k=0;k<num;k++)
            {
               out.println("<script language='javascript'>");
               out.println("document.getElementById('"+stmp_timeT[k]+"').innerHTML='"+sresult_total[k]+"';");
               out.println("document.getElementById('sugang').innerHTML='신청학점 : "+count+"';");
               out.println("</script>");
            }
}


try{
   
if(request.getParameter("save_msg").equals("confirm"))
{
   stmt.executeUpdate("delete from "+session.getAttribute("login_id")+";");
   for(i=0;i<save_num;i++)
      stmt.executeUpdate("insert into "+session.getAttribute("login_id")+" (sc) values('"+tmp_save[i]+"')");
      for(int k=0;k<num;k++)
            {
               out.println("<script language='javascript'>");
               out.println("document.getElementById('"+stmp_timeT[k]+"').innerHTML='"+sresult_total[k]+"';");
               out.println("</script>");
            }
      for(i=0;i<num;i++)
      {
         stmp_timeT[i]="";
         sresult_total[i]="";
      save_num=0;
   tmp_save[i]="";
   ttmp_timeT[i]="";
   tresult_total[i]="";
              // sresult_total[i];

         count=0;
      }
      //for(i=0)
      
}
}
catch(Exception e)
{
   //out.print(e);
}

   rs.close();
   stmt.close();

%>


</body>
</html>