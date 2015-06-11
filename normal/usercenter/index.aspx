<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="manager_usercenter_index" %>

<html>
<head>
  <title></title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" type="text/css" href="../../static_admin/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../../static_admin/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../../static_admin/Css/style.css" />
    <script type="text/javascript" src="../../static_admin/Js/jquery.js"></script>
    <script type="text/javascript" src="../../static_admin/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../../static_admin/Js/bootstrap.js"></script>
    <script type="text/javascript" src="../../static_admin/Js/ckform.js"></script>
    <script type="text/javascript" src="../../static_admin/Js/common.js"></script>

  <style type="text/css">
    body {
      padding-bottom: 40px;
    }
    .sidebar-nav {
      padding: 9px 0;
    }

    @media (max-width: 980px) {
      /* Enable use of floated navbar text */
      .navbar-text.pull-right {
        float: none;
        padding-left: 5px;
        padding-right: 5px;
      }
    }


  </style>
</head>
<body>
<%
  
%>
<form id="Form1" class="form-inline definewidth m20" runat="server">
<table class="table table-bordered table-hover definewidth m10" >
  <tr>
    <td class="tableleft">用户名</td>
    <td>
        <asp:TextBox ID="username" runat="server"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td class="tableleft">邮箱</td>
    <td>
        <asp:TextBox ID="email" runat="server" ReadOnly="True"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td class="tableleft">身份</td>
    <td>
         <asp:TextBox ID="role" runat="server" ReadOnly="True"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td class="tableleft">注册时间</td>
    <td>
        <asp:TextBox ID="register_time" runat="server" ReadOnly="True"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td class="tableleft">头像</td>
    <td>
        <img src="" width="70" height="70"/><br>
    </td>
  </tr>
  <tr>
    <td class="tableleft"></td>
    <td>
        <asp:Button ID="Button1" runat="server" Text="保存"   class="btn btn-primary" 
            onclick="Button1_Click"/>
    </td>
  </tr>
</table>

</form>
<div class="inline pull-right page">
</div>
</body>
</html>

