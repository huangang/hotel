<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="manager_index" %>
<%
    if(Session["uid"]==null){
        Response.Write("<script>alert(\"请登陆\");window.location.href=\"../login.aspx\";</script>");
        if (Session["role"].ToString() != "manager" && Session["role"] == null)
        {
            Response.Write("<script>alert(\"您不是管理员\");window.location.href=\"../index.aspx\";</script>");
        }
    }
%>

<!DOCTYPE HTML>
<html>
<head>
    <title>管理员</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../static_admin/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="../static_admin/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="../static_admin/assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="header">

    <div class="dl-title">
    </div>

    <div class="dl-log"><a href="../index.aspx">返回前台</a>&nbsp;&nbsp;欢迎您，<span class="dl-log-user"><% Response.Write(Session["username"]); %></span><a href="../exit.aspx" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">个人中心</div></li>
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="../static_admin/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="../static_admin/assets/js/bui-min.js"></script>
<script type="text/javascript" src="../static_admin/assets/js/common/main-min.js"></script>
<script type="text/javascript" src="../static_admin/assets/js/config-min.js"></script>
<script>
    BUI.use('common/main', function () {
        var config = [
            { id: '1', menu: [{ text: '系统管理', items: [
                { id: '11', text: '房间管理', href: 'room/index.aspx' },
                { id: '12', text: '类型管理', href: 'type/index.aspx' },
                { id: '13', text: '用户管理', href: 'user/index.aspx' },
                { id: '14', text: '订单管理', href: 'order/index.aspx' }]
            }]
            },
            { id: '2', homePage: '21', menu: [{ text: '个人中心', items: [{ id: '21', text: '个人设置', href: 'usercenter/index.aspx' }, { id: '22', text: '修改密码', href: 'usercenter/changePassword.aspx' }, { id: '23', text: '修改头像', href: 'usercenter/changeAvatar.aspx'}]}] }

        ];
        new PageUtil.MainPage({
            modulesConfig: config
        });
    });
</script>
</body>
</html>
