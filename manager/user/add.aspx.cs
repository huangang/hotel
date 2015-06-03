using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class manager_user_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string username1 = username.Text;
        string email1 = email.Text;
        string password1 = password.Text;
        string role1 = Request.Form["role"];
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "select *from [user] where email='" + email1 + "'";
        DataSet ds = obj.Select(sql, null);
        if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
        {

            byte[] result = Encoding.Default.GetBytes(password1);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] output = md5.ComputeHash(result);
            sql = "insert into [user] (username,email,password,role) values('" + username1 + "','" + email1 + "','" + BitConverter.ToString(output).Replace("-", "") + "','"+ role1 +"')";
            if (obj.Insert(sql, null))
            {
                Response.Write("<script>alert('增加用户成功');window.location.href=\"index.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('增加用户失败')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('该用户已存在')</script>");
        }
    }
}