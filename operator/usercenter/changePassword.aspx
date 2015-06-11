<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changePassword.aspx.cs" Inherits="manager_usercenter_changePassword" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
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
<form id="Form1"  class="definewidth m20" runat="server">
  <table class="table table-bordered table-hover definewidth m10">
    <tr>
      <td class="tableleft">旧密码</td>
      <td>
          <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td class="tableleft">新密码</td>
      <td>
          <asp:TextBox ID="newPassword" runat="server" TextMode="Password"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td class="tableleft"></td>
      <td>
          <asp:Button ID="Button1" runat="server" Text="保存" class="btn btn-primary" 
              onclick="Button1_Click" />&nbsp;&nbsp;
        <button type="button" class="btn btn-success" name="backid" id="backid">返回</button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<script>
    $(function () {
        $('#backid').click(function () {
            window.location.href = "index.aspx";
        });

    });
</script>


