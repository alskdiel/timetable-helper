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
   function aa(str)
   {
      str.search_hidden.value=str.id_for_search.value;
      alert("dd");
      str.submit();
   }
-->
</script>


 <%!
   String[] f_subjectInfo;//------>d
   int f_num=0;//------>
   //String
   String[] f_stmp_timeT= new String[1000];//------>
   String[] f_sresult_total= new String[500];//------>
   String[] f_ttmp_timeT= new String[300];//------>
   String[] f_tresult_total= new String[300];//------>
   String[] f_tmp_save=new String[500];//------>
   int f_tnum=0;//------>
   String f_ssresult_total="";//------>
   int f_count=0;//------>
  %>



</head>
<body >

<SCRIPT LANGUAGE="JavaScript"> 
   var myday = new Date();
   myday.setTime(myday.getTime() +  (365 * 24 * 60 * 60 * 1000));
   
</script>
<form form="form">
<br><br><br><br>
<b><h2><font size="2" style="font-family:'돋움'">회원 아이디 입력 </font><br><input type="text" name="id_for_search" height="70"maxlength=10>
<input onclick="aa(form)"type="button" name="search_id" value="찾기" style="font-family:'돋움'"></h2></b><input type="hidden" name="search_hidden" value="">
<br><br>
<table align="center" border="0" bgcolor='fffde8' width="1000">
<tr>
<th width="200" align="center"><span id="sugang"></span></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">월</b></font></h1></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">화</b></font></h1></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">수</b></font></h1></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">목</b></font></h1></th><th width="200"><h1><b><font size="2" style="font-family:'돋움'">금</b></font></h1></th>
</tr>
<tr width="200" height="40">
<td align="center"><b><font size="2"   style="font-family:'돋움'">1교시</font> </b></td>
<td align="center"><span id="m1"  style="font-size:12px"></span></td>
<td align="center"><span id="t1"  style="font-size:12px"></span></td>
<td align="center"><span id="w1" style="font-size:12px"></span></td>
<td align="center"><span id="th1" style="font-size:12px"></span></td>
<td align="center"><span id="f1" style="font-size:12px"></span></td>
</tr>
  
<tr width="200" height="40">
<td align="center"><b><font size="2"  style="font-family:'돋움'"> 2교시</font> </b></td>
<td align="center"><span id="m2" style="font-size:12px"></span></td>
<td align="center"><span id="t2" style="font-size:12px"></span></td>
<td align="center"><span id="w2" style="font-size:12px"></span></td>
<td align="center"><span id="th2" style="font-size:12px"></span></td>
<td align="center"><span id="f2" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><b><font size="2"  style="font-family:'돋움'"> 3교시</font> </b></td>
<td align="center"><span id="m3" style="font-size:12px"></span></td>
<td align="center"><span id="t3" style="font-size:12px"></span></td>
<td align="center"><span id="w3" style="font-size:12px"></span></td>
<td align="center"><span id="th3" style="font-size:12px"></span></td>
<td align="center"><span id="f3" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><b><font size="2" style="font-family:'돋움'"> 4교시</font> </b></td>
<td align="center"><span id="m4" style="font-size:12px"></span></td>
<td align="center"><span id="t4" style="font-size:12px"></span></td>
<td align="center"><span id="w4" style="font-size:12px"></span></td>
<td align="center"><span id="th4" style="font-size:12px"></span></td>
<td align="center"><span id="f4" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><b><font size="2" style="font-family:'돋움'"> 5교시</font> </b></td>
<td align="center"><span id="m5" style="font-size:12px"></span></td>
<td align="center"><span id="t5" style="font-size:12px"></span></td>
<td align="center"><span id="w5" style="font-size:12px"></span></td>
<td align="center"><span id="th5" style="font-size:12px"></span></td>
<td align="center"><span id="f5" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><b><font size="2" style="font-family:'돋움'"> 6교시</font> </b></td>
<td align="center"><span id="m6" style="font-size:12px"></span></td>
<td align="center"><span id="t6" style="font-size:12px"></span></td>
<td align="center"><span id="w6" style="font-size:12px"></span></td>
<td align="center"><span id="th6" style="font-size:12px"></span></td>
<td align="center"><span id="f6" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><b><font size="2" style="font-family:'돋움'"> 7교시</font> </b></td>
<td align="center"><span id="m7" style="font-size:12px"></span></td>
<td align="center"><span id="t7" style="font-size:12px"></span></td>
<td align="center"><span id="w7" style="font-size:12px"></span></td>
<td align="center"><span id="th7" style="font-size:12px"></span></td>
<td align="center"><span id="f7" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><b><font size="2" style="font-family:'돋움'"> 8교시</font> </b></td>
<td align="center"><span id="m8" style="font-size:12px"></span></td>
<td align="center"><span id="t8" style="font-size:12px"></span></td>
<td align="center"><span id="w8" style="font-size:12px"></span></td>
<td align="center"><span id="th8" style="font-size:12px"></span></td>
<td align="center"><span id="f8" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><b><font size="2" style="font-family:'돋움'"> 야간 1교시</font> </b></td>
<td align="center"><span id="m9" style="font-size:12px"></span></td>
<td align="center"><span id="t9" style="font-size:12px"></span></td>
<td align="center"><span id="w9" style="font-size:12px"></span></td>
<td align="center"><span id="th9" style="font-size:12px"></span></td>
<td align="center"><span id="f9" style="font-size:12px"></span></td>
</tr>

<tr width="200" height="40">
<td align="center"><b><font size="2" style="font-family:'돋움'"> 야간 2교시</font> </b></td>
<td align="center"><span id="m10" style="font-size:12px"></span></td>
<td align="center"><span id="t10"  style="font-size:12px"></span></td>
<td align="center"><span id="w10"  style="font-size:12px"></span></td>
<td align="center"><span id="th10"  style="font-size:12px"></span></td>
<td align="center"><span id="f10" style="font-size:12px"></span></td>
</tr>

</table>
</form>

</body>

<%

String default_id;
String change_id;
String result_name="";
String result_prof="";
String result_timeT="";
String result_credit="";
Boolean f_ch=new Boolean(false);
String f_tmp_timeT="";
String f_result_total="";
//int num=0;
String[] store_resource=new String[30];
int i=0;int tmp_d=0; int tmp_m=0;
int tmp_i=0;
   //int tnum=0;

   default_id=(String)session.getAttribute("login_id");//로그인 아이디
   change_id=(request.getParameter("search_hidden"));//위에서 입력아이디
   
   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   PreparedStatement pstmt;
   ResultSet rs;
     try{
       if(request.getParameter("search_hidden")==null)//default로 자신의 저장 시간표
      {
         rs=stmt.executeQuery("SELECT * FROM "+session.getAttribute("login_id")+";");
         while(rs.next())
         {
           store_resource[i] = rs.getString("sc");
           i++;
         }
//      out.print(default_id+"1번");
      }
 
      else//검색시 다른 사람의 저장 시간표
      {
      rs=stmt.executeQuery("select *from "+change_id+";");      
      while(rs.next())
         {
           store_resource[i] = rs.getString("sc");
           i++;
         }
 //     out.print(default_id+"2번");
      }
   }
   catch(Exception e)
   {
      out.print(e);
      out.print("없는아이디");
      f_ch=true;//없는 아이디 판단 기준
   }
   


try{
 while(store_resource[tmp_i]!=null&&f_ch==false){
   rs=stmt.executeQuery("SELECT * FROM subjects where no='"+store_resource[tmp_i]+"';");
   while(rs.next())
   {
      result_name = rs.getString("name");
      result_prof = rs.getString("prof");
      result_timeT = rs.getString("timeT");
     result_credit = rs.getString("credit");
     f_result_total="<b>"+result_name+"<br>"+result_prof+"</b>";
    f_subjectInfo=result_timeT.split(" ");
   
    tmp_i++;
 //     out.print("subject개수 : "+f_subjectInfo.length);

      for(int j=0; j<f_subjectInfo.length;j++){   
         for(i=0; i<50;i++)
            {
                if(f_subjectInfo[j].equals(Integer.toString(i)))
                {   
                  tmp_d=(i-1)/10;
                  tmp_m=(i-1)%10;
                  if(tmp_d==0)
                     f_tmp_timeT="m";
                  else if(tmp_d==1)
                     f_tmp_timeT="t";
                  else if(tmp_d==2)
                     f_tmp_timeT="w";
                  else if(tmp_d==3)
                     f_tmp_timeT="th";
                  else if(tmp_d==4)
                     f_tmp_timeT="f";
                  if(tmp_m==0)
                     f_tmp_timeT+="1";
                  else if(tmp_m==1)
                     f_tmp_timeT+="2";
                  else if(tmp_m==2)
                     f_tmp_timeT+="3";
                  else if(tmp_m==3)
                     f_tmp_timeT+="4";
                  else if(tmp_m==4)
                     f_tmp_timeT+="5";
                  else if(tmp_m==5)
                     f_tmp_timeT+="6";
                  else if(tmp_m==6)
                     f_tmp_timeT+="7";
                  else if(tmp_m==7)
                     f_tmp_timeT+="8";
                  else if(tmp_m==8)
                     f_tmp_timeT+="9";
                  else if(tmp_m==9)
                     f_tmp_timeT+="10";
                  f_ttmp_timeT[f_tnum]=f_tmp_timeT;
                  f_tresult_total[f_tnum]=f_result_total;
                  f_tnum++;
                }
          }   
      }
   }
}}
catch(Exception e)
{
 //  out.print(e);
}
if(f_ch==false){
   for(int k=0;k<f_tnum;k++){
               f_stmp_timeT[f_num]=f_ttmp_timeT[k];
               f_sresult_total[f_num]=f_tresult_total[k];
            
               f_num++;
               }f_tnum=0;

   for(int k=0;k<f_num;k++)
            {
               out.println("<script language='javascript'>");
               out.println("document.getElementById('"+f_stmp_timeT[k]+"').innerHTML='"+f_sresult_total[k]+"';");
               out.println("</script>");
            }f_num=0;





   }



%>

</html>