<%@ page contentType="text/html; charset=gb2312" language="java" %>
<html>
<head>
<!--meta http-equiv="Content-Type" content="text/html; charset=gb2312"-->
<title>格蒂人力资源管理系统</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/layout.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<style type="text/css">
#header_image{height:60px; width:15%; background:url("images/hrms.gif") no-repeat;}
#header_text{height:60px; width: auto; background:url("images/hrmsText.gif") no-repeat center;}
#header_right{height:60px; width:15%; }
</style>
</head>

<body>
<div id="container">
  <div id="header">
    <table width="100%">
    <tr>
    <td id="header_image"></td>
    <td id="header_text"></td>
    <td id="header_right"></td>
    </tr>
    </table>
  </div>
  <div id="menu">
    <div class="navbar navbar-inverse">
      <div class="navbar-inner">
        <div class="nabbar-container">
          <a class="brand" href="http://www.sina.com">新浪河南</a>
       
          <ul class="nav" role="menu">
            <li data-submenu-id="submenuDept" class="active"><a id="department" href="#">组织管理</a></li>
            <li data-submenu-id="submenuArchive" class="active"><a id="archive" href="#">档案管理</a></li>
            <li data-submenu-id="submenuSalary" class="active"><a id="salary" href="#">薪资管理</a></li>
            <li data-submenu-id="submenuTrain" class="active"><a id="train" href="#">培训管理</a></li>
            <li data-submenu-id="submenuRecruit" class="active"><a id="recruit" href="#">招聘管理</a></li>
            <li data-submenu-id="submenuSystem" class="active"><a id="system" href="#">系统维护</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div id="submenuDept" class="popover">
      <dl>
       <dt><a href="#">单位管理</a></dt>
       <dt><a href="#">部门管理</a></dt>
       <dt><a href="#">岗位管理</a></dt>
       <dt><a href="#">人员管理</a></dt>
      </dl>
    </div>

    <div id="submenuArchive" class="popover">
      <dl>
        <dt><a href="#">单位信息</a></dt>
        <dt><a href="#">人事档案</a></dt>
        <dt><a href="#">劳动合同</a></dt>
      </dl>
    </div>

    <div id="submenuSalary" class="popover">
      <dl>
        <dt><a href="#">薪酬计算</a></dt>
        <dt><a href="#">薪资发放</a></dt>
        <dt><a href="#">薪资统计</a></dt>
      </dl>
    </div>

    <div id="submenuTrain" class="popover">
      <dl>
        <dt><a href="#">培训计划</a></dt>
        <dt><a href="#">培训统计</a></dt>
      </dl>
    </div>

    <div id="submenuRecruit" class="popover">
      <dl>
        <dt><a href="#">招聘计划</a></dt>
        <dt><a href="#">人员入职</a></dt>
        <dt><a href="#">人员离职</a></dt>
      </dl>
    </div>

    <div id="submenuSystem" class="popover">
      <dl>
        <dt><a href="#">角色管理</a></dt>
        <dt><a href="#">权限管理</a></dt>
        <dt><a href="#">操作人员</a></dt>
        <dt><a href="#">操作日志</a></dt>
      </dl>
    </div>
  </div>

  <div id="mainContent">
    <jsp:include page="welcome.jsp"/>
    <!--div id="sidebar"></div>
    <div id="content"></div-->
  </div>

  <div id="footer"></div>

</div>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.menu-aim.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
  var $menu = $(".nav");

  $menu.menuAim({
    activate: activateSubmenu,
    deactivate: deactivateSubmenu,
    submenuSelector: "#department",//submenuSelector这个参数不知道如何使用，试过了selector="li[data-submenu-id='submenu-ygzz']","#ygzz"和"#submenu-ygzz",都没有达到预期的效果，好像一直是"*"。
    submenuDirection: "below"
  });

  function activateSubmenu(row) {
    var $row = $(row);
    submenuId = $row.data("submenuId");
    $submenu = $("#" + submenuId);
    left = $row[0].offsetLeft;
    height = $menu.outerHeight();
    obj = $row[0];
    width = obj.offsetWidth;
    popmenu = $submenu[0];

    //alert($("li[data-submenu-id='submenuDept']").html()+"||"+$(".container>h1").html());
    //alert($("#submenuDept").html());
    //alert($("#ygzz").html());

    //alert(typeof popmenu);

    if (popmenu != undefined){//处理没有下拉子菜单的情况

      count = $submenu[0].children[0].children.length;

      //alert($submenu[0].children[0]);

      // Show the submenu
      $submenu.css({
        display: "block",
        top: height + 60,
        left: 100 + left,  // main should overlay submenu,100是测试出来的值，以后要改进
        height: 10 + count * 20 + 10 ,  // 第一个10是弹出菜单上第一个菜单项与顶部的空格高度，20是测试出来的每项菜单项的高度，最后的10是最后一个菜单项与菜单底部的空格高度
        width: width - 4 //减去的4是上级菜单项两边各有2宽度的空格
      });
    }

    // Keep the currently activated row's highlighted look
    $row.find("a").addClass("maintainHover");
  }

  function deactivateSubmenu(row) {
    activeRow = null;
    var $row = $(row),
    submenuId = $row.data("submenuId"),
    $submenu = $("#" + submenuId);

    // Hide the submenu and remove the row's highlighted look
    $submenu.css("display", "none");
    $row.find("a").removeClass("maintainHover");
  }

  $(".nav li").click(function(e) {
    e.stopPropagation();
  });

  $(document).click(function() {
    // Simply hide the submenu on any click. Again, this is just a hacked
    // together menu/submenu structure to show the use of jQuery-menu-aim.
    $(".popover").css("display", "none");
    $("a.maintainHover").removeClass("maintainHover");
  });
</script>
</body>
</html>
