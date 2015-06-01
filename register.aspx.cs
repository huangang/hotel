using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.ServiceModel.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using Mysqlserver;


public partial class register : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlServerDataBase obj = new SqlServerDataBase();
        string username = TBusername.Text;
        string email = TBemail.Text;
        string password = TBpassword.Text;
        string repassword = TBrepassword.Text;
        string sql = "select *from [user] where email='"+email+"'";
        DataSet ds = obj.Select(sql,null);
        if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
        {
            
            byte[] result = Encoding.Default.GetBytes(password);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] output = md5.ComputeHash(result);
            sql = "insert into [user] (username,email,password,role) values('" + username + "','" + email + "','" + BitConverter.ToString(output).Replace("-", "") +"','normal')";
            if (obj.Insert(sql, null))
            {
                Response.Write("<script>alert('注册成功');window.location.href=\"login.aspx\";</script>");
                //Response.Redirect("login.aspx");
            }
            else
            {
                Response.Write("<script>alert('失败')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('该用户已存在')</script>");
        }
       

    }

   
}