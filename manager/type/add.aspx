<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="manager_type_add" %>

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
<form runat="server"  method="post">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">类型名</td>
        <td>
            <asp:TextBox ID="typename" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="类型名不能为空" ControlToValidate="typename" Display="Dynamic" ForeColor="#FF0066"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="tableleft">价格</td>
        <td>
            <asp:TextBox ID="price" runat="server"></asp:TextBox>￥
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="价格不能为空" ControlToValidate="price" Display="Dynamic" ForeColor="#FF0066"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="价格只能为数字" ControlToValidate="price" ValidationExpression="\d+" Display="Dynamic" ForeColor="#FF0066"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="tableleft">描述</td>
        <td>
            <asp:TextBox ID="description" runat="server" TextMode="MultiLine"></asp:TextBox>
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
