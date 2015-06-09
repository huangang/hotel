<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="manager_order_index" %>
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
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增订单</button>
    </form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>订单号</th>
        <th>用户名</th>
        <th>用户邮箱</th>
        <th>房间号</th>
        <th>房间类型</th>
        <th>订单时间</th>
        <th>管理操作</th>
    </tr>
    </thead>
    <%
        
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "select *from [orders]";
        DataSet ds = obj.Select(sql, null);
        if (ds != null || ds.Tables.Count != 0 || ds.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string oid = ds.Tables[0].Rows[i][0].ToString();
                string uid = ds.Tables[0].Rows[i][1].ToString();
                string order_time = ds.Tables[0].Rows[i][3].ToString();
                string status = ds.Tables[0].Rows[i][4].ToString();
                string sql2 = "select username,email from [user] where uid=" + uid;
                DataSet ds2 = obj.Select(sql2, null);
                string username = ds2.Tables[0].Rows[0][0].ToString();
                string email = ds2.Tables[0].Rows[0][1].ToString();
                string rid = ds.Tables[0].Rows[i][2].ToString();
                string sql3 = "select tid,number from [room] where rid=" + rid;
                DataSet ds3 = obj.Select(sql3, null);
                string tid = ds3.Tables[0].Rows[0][0].ToString();
                string number = ds3.Tables[0].Rows[0][1].ToString();
                string sql4 = "select type_name from [type] where tid=" + tid;
                DataSet ds4 = obj.Select(sql4, null);
                string type_name = ds4.Tables[0].Rows[0][0].ToString();
                Response.Write("<tr><td>" + oid + "</td>");
                Response.Write("<td>" + username + "</td>");
                Response.Write("<td>" + email + "</td>");
                Response.Write("<td>" + number + "</td>");
                Response.Write("<td>" + type_name + "</td>");
                Response.Write("<td>" + order_time + "</td>");
                if (status == "progress")
                {
                    Response.Write("<td>" + "<a href='edit.aspx?oid=" + oid + "&uid=" + uid + "&rid=" + rid + "'>编辑</a> <a href='#' onclick='del(" + oid + ")'>删除</a>" + "</td></tr>");
                }
                else
                {
                    Response.Write("<td>已结束</td></tr>");
                }
                
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

    function del(id) {
        var xmlhttp;
        var status = "";
        try {
            xmlhttp = new ActiveXObject('Msxml2.XMLHTTP');
        } catch (e) {
            try {
                xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
            } catch (e) {
                try {
                    xmlhttp = new XMLHttpRequest();
                } catch (e) { }
            }
        }


        if (confirm("确定要删除吗？")) {

            xmlhttp.open("GET", "../../delete.ashx?table=orders&oiid=" + id, true);
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4)
                //xmlhttp.status==404 代表 没有发现该文件
                    if (xmlhttp.status == 200) {
                        //alert(xmlhttp.status);
                        status = xmlhttp.responseText;
                        if (status == 1) {
                            alert("删除成功");
                        } else {
                            alert("删除失败");
                        }
                        console.log(status);
                    } else {
                        alert("发生错误：" + xmlhttp.status);
                    }

            }
            xmlhttp.send(null);
            window.location.href = "index.aspx";

        }


    }
</script>


