using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class manager_type_edit : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string type_tid = Request.QueryString["tid"];
        string type_name = Request.QueryString["type_name"];
        string type_price = Request.QueryString["price"];
        string type_description = Request.QueryString["description"];
        tid.Text = type_tid;
        typename.Text = type_name;
        price.Text = type_price;
        description.Text = type_description;

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        string t_tid = Request.Form["tid"];
        string t_name =  Request.Form["typename"];
        string t_price =  Request.Form["price"];
        string t_description =  Request.Form["description"];
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "update [type] set type_name = '" + t_name + "',price = '" + t_price + "',description = '" + t_description + "'  where tid=" + t_tid;
        if (obj.Update(sql, null))
        {
            Response.Write("<script>alert('更新成功');window.location.href=\"index.aspx\";</script>");
        }
        else
        {
            Response.Write("<script>alert('更新失败');</script>");
        }
    }
}