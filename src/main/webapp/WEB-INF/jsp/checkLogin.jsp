<%@ page contentType="text/html; charset=gb2312" language="java" %>
<html>
<head>
<!--meta http-equiv="Content-Type" content="text/html; charset=gb2312"-->
<title>���������Դ����ϵͳ</title>
</head>
<body>
<%
if(request.getAttribute("errorNews")!=null){
  String errorNews=(String)request.getAttribute("errorNews");
  out.print("<script language=javascript>alert('"+errorNews+"');history.go(-1);</script>");
}else{
  out.print("<script language=javascript>window.location.href='mainPage.jsp';</script>");
}
%>
</body>
</html>
