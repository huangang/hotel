using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class manager_usercenter_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string uid = Session["uid"].ToString();
        string sql = "select *from [user] where uid = " + uid;
        SqlServerDataBase obj = new SqlServerDataBase();
        DataSet ds = obj.Select(sql, null);
        if (ds != null || ds.Tables.Count != 0 || ds.Tables[0].Rows.Count != 0)
        {
            string username2 = ds.Tables[0].Rows[0][1].ToString();
            string email2 = ds.Tables[0].Rows[0][2].ToString();
            string role2 = ds.Tables[0].Rows[0][4].ToString();
            string register_time2 = ds.Tables[0].Rows[0][5].ToString();
            username.Text = username2;
            email.Text = email2;
            role.Text = role2;
            register_time.Text = register_time2;

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string uid = Session["uid"].ToString();
        string name = Request.Form["username"];
        string sql = "update [user] set username='" + name + "' where uid = " + uid;
        SqlServerDataBase obj = new SqlServerDataBase();
        if (obj.Update(sql, null))
        {
            Response.Write("<script>alert('修改昵称成功');window.location.href=\"index.aspx\";</script>");
        }
        else
        {
            Response.Write("<script>alert('修改昵称失败')</script>");
        }
    }
}