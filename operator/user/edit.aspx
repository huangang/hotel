<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit.aspx.cs" Inherits="manager_user_edit" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
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
<form id="Form1" runat="server"  method="post">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">姓名</td>
        <td>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="姓名不能为空" ControlToValidate="username" Display="Dynamic" ForeColor="#FF0066"></asp:RequiredFieldValidator>
        </td>
    </tr>
   
    <tr>
        <td width="10%" class="tableleft">邮箱</td>
        <td>
             <asp:TextBox ID="email" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="邮箱不能为空" ControlToValidate="email" Display="Dynamic" ForeColor="#FF0066"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ControlToValidate="email" Display="Dynamic"
         ErrorMessage="邮箱格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#FF0066" Font-Size="15px"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">密码(若不修改密码,请留空)</td>
        <td>
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="密码不能少于6位" Display="Dynamic" ControlToValidate="password" Font-Size="15px" ForeColor="#FF0066" ValidationExpression="\S{6,}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">身份</td>
        <td>
            <select name="role">
              <option value="normal" selected="selected">normal</option>
            </select>
         </td>
    </tr>


    <tr>
        <td class="tableleft"></td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="保存" class="btn btn-primary" 
                onclick="Button1_Click" />
            &nbsp;&nbsp; <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
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
