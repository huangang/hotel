<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="manager_room_add" %>
<%@ Import Namespace="Mysqlserver" %>
<%@ Import Namespace="System.Data" %>

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
<form runat="server">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">房间号</td>
        <td>
            <asp:TextBox ID="room_number" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="房间号不能为空" ForeColor="#FF0066" ControlToValidate="room_number"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="tableleft">类型</td>
        <td>
        <select name="type_id">
            <%
                SqlServerDataBase obj = new SqlServerDataBase();
                string sql = "select *from [type]";
                DataSet ds = obj.Select(sql, null);
                if (ds != null || ds.Tables.Count != 0 || ds.Tables[0].Rows.Count != 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        string tid = ds.Tables[0].Rows[i][0].ToString();
                        string type_name = ds.Tables[0].Rows[i][1].ToString();
                       
                        Response.Write("<option value =\""+tid+"\">"+type_name+"</option>");
                 
                    }

                }
            %>
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
