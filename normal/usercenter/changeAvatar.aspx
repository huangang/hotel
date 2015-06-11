<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changeAvatar.aspx.cs" Inherits="normal_usercenter_changeAvatar" %>

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
<form id="Form1" class="definewidth m20"  runat="server">
  <table class="table table-bordered table-hover definewidth m10">

    <tr>
      <td class="tableleft">头像</td>
      <td>
          <asp:Image ID="pic" runat="server" Width="70px" Height="70px" />
        <br>
        <asp:FileUpload ID="pic_upload" runat="server" /><asp:Label ID="lbl_pic" runat="server" class="pic_text"></asp:Label>
      </td>
    </tr>
    <tr>
      <td class="tableleft"></td>
      <td>
          <asp:Button ID="Button1" runat="server" Text="保存"  class="btn btn-primary" 
              onclick="Button1_Click" />&nbsp;&nbsp;
        <button type="button" class="btn btn-success" name="backid" id="backid">返回</button>
      </td>
    </tr>
    <tr>
      <td class="tableleft"></td>
      <td>备注：上传的图片,大小不能超过4M！</td>
    </tr>
  </table>
</form>
</body>
</html>
<script>
    $(function () {
        $('#backid').click(function () {
            window.location.href = "index.jsp";
        });

    });
</script>

