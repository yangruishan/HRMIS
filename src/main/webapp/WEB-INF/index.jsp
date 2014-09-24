<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="stripes"  uri="/stripes.tld"%>
<html>
<head>
<!--meta http-equiv="Content-Type" content="text/html; charset=gb2312" /-->
<title>格蒂电力人力资源管理系统</title> 
<style type="text/css"> 
html,body
{
  margin: 0px;
  height: 100%;
}
#outer
{
  height: 100%;
  width: 100%;
  text-align: center;
}
#inner
{
  margin: 0px auto;
  +position: absolute;
  top: 50%;
}
#loginBackground 
{
  height:600px;
  width:1000px;
  background-image:url(images/hrmsLoginForm.jpg);
  background-repeat:no-repeat;
  background-position:center center;
  margin:0px auto;
  +position:relative;
  top:-50%;
  left:-50%;
}
.loginForm
{
  margin:0px auto;
  position:relative;
  top:144px;
  left:0px;
  height:320px;
}
.userid{
  position:relative;
  top:110px;
  left:-14px;
  width:280px;
  height:30px;
  border:none;
  padding-bottom:0px;
  padding-top:0px;
  padding-left:0px;
  padding-right:0px;
  background-color: transparent
}
.password{
  position:relative;
  top:133px;
  left:-14px;
  width:280px;
  height:30px;
  border:none;
  padding-bottom:0px;
  padding-top:0px;
  padding-left:0px;
  padding-right:0px;
  background-color: transparent
}
.loginbtn{
  position:relative;
  top:160px;
  left:110px;
  width:91px;
  height:30px;
  border:none;
  padding-bottom:0px;
  padding-top:0px;
  padding-left:0px;
  padding-right:0px;
  border-image-width:0px;
  cursor:pointer;
}

</style> 
</head>

<script language="JavaScript">
function check(){
  if(document.loginForm.account.value==""){
    window.alert("请输入账号");
    return false;
  }
  if(document.loginForm.password.value==""){
    window.alert("请输入密码");
    return false;
  }
  return true;
}
function whiteBackground(element){
  element.style.backgroundColor="white";
}
function handleEvent(event){
  if(event.keyCode == 13){
    loginForm.submit();
  }  
}
</script>

<body> 
<div id="outer">
  <div id="inner">
    <div id="loginBackground">
    <stripes:form styleClass="loginForm" beanclass="com.grid.hrmis.eb.actions.OperatorActionBean" onsubmit="return check()">
      <stripes:text styleClass="operator.userid" name="account" value="" onfocus="whiteBackground(this)" tabindex="1"/><br/>
      <stripes:password styleClass="operator.password" name="password" value="" onfocus="whiteBackground(this)" onkeypress="handleEvent(event)" tabindex="2"/><br/>
      <stripes:submit styleClass="loginbtn" name="signon" value="" onclick="loginForm.submit()"/>
    </stripes:form>
    </div>
  </div>
</div>
</body> 
</html>
