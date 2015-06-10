<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="manager_user_index" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Mysqlserver" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8" content="" />
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
    <form id="form1" runat="server" class="form-inline definewidth m20" >
    用户名：
        <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value=""/>&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增用户</button>
    </form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>用户名</th>
        <th>邮箱</th>
        <th>身份</th>
        <th>注册时间</th>
        <th>管理操作</th>
    </tr>
    </thead>
    <%
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "select *from [user] where role='normal'";
        DataSet ds = obj.Select(sql, null);
        if (ds != null || ds.Tables.Count != 0 || ds.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string uid = ds.Tables[0].Rows[i][0].ToString();
                string username = ds.Tables[0].Rows[i][1].ToString();
                string email = ds.Tables[0].Rows[i][2].ToString();
                string role = ds.Tables[0].Rows[i][4].ToString();
                string register_time = ds.Tables[0].Rows[i][5].ToString();
                Response.Write("<tr><td>" + username + "</td>");
                Response.Write("<td>"+email+"</td>");
                Response.Write("<td>"+role+"</td>");
                Response.Write("<td>"+ register_time +"</td>");
                Response.Write("<td>" + "<a href='edit.aspx?uid=" + uid + "&username=" + username + "&email=" + email + "&role=" + role + "'>编辑</a></tr>");
            }
        }
    %>
   
</table>


<div class="inline pull-right page">
   
</div>
    
</body>
</html>
<script type="text/javascript">
    $(function () {

        $('#addnew').click(function () {

            window.location.href = "add.aspx";
        });

    });

</script>

