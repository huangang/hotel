using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class operator_user_edit : System.Web.UI.Page
{
    private string uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        uid = Request.QueryString["uid"];
        string username1 = Request.QueryString["username"];
        string email1 = Request.QueryString["email"];
        username.Text = username1;
        email.Text = email1;


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string username2 = Request.Form["username"];
        string email2 = Request.Form["email"];
        string role2 = Request.Form["role"];
        string sql;
        if (Request.Form["password"] == "")
        {
            sql = "update [user] set username='" + username2 + "',email='" + email2 + "',role='" + role2 + "' where uid=" + uid;
        }
        else
        {
            string password2 = Request.Form["password"];
            byte[] result = Encoding.Default.GetBytes(password2);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] output = md5.ComputeHash(result);
            sql = "update [user] set username='" + username2 + "',email='" + email2 + "',role='" + role2 + "',password='" + BitConverter.ToString(output).Replace("-", "") + " where uid=" + uid;
        }
        SqlServerDataBase obj = new SqlServerDataBase();
        if (obj.Insert(sql, null))
        {
            Response.Write("<script>alert('修改用户成功');window.location.href=\"index.aspx\";</script>");
        }
        else
        {
            Response.Write("<script>alert('修改用户失败')</script>");
        }
    }
}