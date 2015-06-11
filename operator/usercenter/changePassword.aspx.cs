using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class operator_usercenter_changePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string uid = Session["uid"].ToString();
        string pw = Request.Form["password"];
        byte[] result1 = Encoding.Default.GetBytes(pw);
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] output1 = md5.ComputeHash(result1);

        string npw = Request.Form["newPassword"];
        byte[] result2 = Encoding.Default.GetBytes(npw);
        byte[] output2 = md5.ComputeHash(result2);
        string sql = "update [user] set password='" + BitConverter.ToString(output2).Replace("-", "") + "' where uid = '" + uid + "' and password='" + BitConverter.ToString(output1).Replace("-", "") + "'";
        SqlServerDataBase obj = new SqlServerDataBase();
        if (obj.Update(sql, null))
        {
            Response.Write("<script>alert('修改密码成功');window.location.href=\"index.aspx\";</script>");
        }
        else
        {
            Response.Write("<script>alert('修改密码失败')</script>");
        }

    }
}