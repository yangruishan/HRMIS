<%@ page contentType="text/html; charset=gb2312" language="java" %>
<html>
<head>
<!--meta http-equiv="Content-Type" content="text/html; charset=gb2312"-->
<title>���������Դ����ϵͳ</title>
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
          <a class="brand" href="http://www.sina.com">���˺���</a>
       
          <ul class="nav" role="menu">
            <li data-submenu-id="submenuDept" class="active"><a id="department" href="#">��֯����</a></li>
            <li data-submenu-id="submenuArchive" class="active"><a id="archive" href="#">��������</a></li>
            <li data-submenu-id="submenuSalary" class="active"><a id="salary" href="#">н�ʹ���</a></li>
            <li data-submenu-id="submenuTrain" class="active"><a id="train" href="#">��ѵ����</a></li>
            <li data-submenu-id="submenuRecruit" class="active"><a id="recruit" href="#">��Ƹ����</a></li>
            <li data-submenu-id="submenuSystem" class="active"><a id="system" href="#">ϵͳά��</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div id="submenuDept" class="popover">
      <dl>
       <dt><a href="#">��λ����</a></dt>
       <dt><a href="#">���Ź���</a></dt>
       <dt><a href="#">��λ����</a></dt>
       <dt><a href="#">��Ա����</a></dt>
      </dl>
    </div>

    <div id="submenuArchive" class="popover">
      <dl>
        <dt><a href="#">��λ��Ϣ</a></dt>
        <dt><a href="#">���µ���</a></dt>
        <dt><a href="#">�Ͷ���ͬ</a></dt>
      </dl>
    </div>

    <div id="submenuSalary" class="popover">
      <dl>
        <dt><a href="#">н�����</a></dt>
        <dt><a href="#">н�ʷ���</a></dt>
        <dt><a href="#">н��ͳ��</a></dt>
      </dl>
    </div>

    <div id="submenuTrain" class="popover">
      <dl>
        <dt><a href="#">��ѵ�ƻ�</a></dt>
        <dt><a href="#">��ѵͳ��</a></dt>
      </dl>
    </div>

    <div id="submenuRecruit" class="popover">
      <dl>
        <dt><a href="#">��Ƹ�ƻ�</a></dt>
        <dt><a href="#">��Ա��ְ</a></dt>
        <dt><a href="#">��Ա��ְ</a></dt>
      </dl>
    </div>

    <div id="submenuSystem" class="popover">
      <dl>
        <dt><a href="#">��ɫ����</a></dt>
        <dt><a href="#">Ȩ�޹���</a></dt>
        <dt><a href="#">������Ա</a></dt>
        <dt><a href="#">������־</a></dt>
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
    submenuSelector: "#department",//submenuSelector���������֪�����ʹ�ã��Թ���selector="li[data-submenu-id='submenu-ygzz']","#ygzz"��"#submenu-ygzz",��û�дﵽԤ�ڵ�Ч��������һֱ��"*"��
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

    if (popmenu != undefined){//����û�������Ӳ˵������

      count = $submenu[0].children[0].children.length;

      //alert($submenu[0].children[0]);

      // Show the submenu
      $submenu.css({
        display: "block",
        top: height + 60,
        left: 100 + left,  // main should overlay submenu,100�ǲ��Գ�����ֵ���Ժ�Ҫ�Ľ�
        height: 10 + count * 20 + 10 ,  // ��һ��10�ǵ����˵��ϵ�һ���˵����붥���Ŀո�߶ȣ�20�ǲ��Գ�����ÿ��˵���ĸ߶ȣ�����10�����һ���˵�����˵��ײ��Ŀո�߶�
        width: width - 4 //��ȥ��4���ϼ��˵������߸���2��ȵĿո�
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
