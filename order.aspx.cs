using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class order : System.Web.UI.Page
{
    private string tid;
    private string uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        uid = Request.QueryString["uid"];
        string sql = "select *from [user] where uid =" + uid;
        SqlServerDataBase obj = new SqlServerDataBase();
        DataSet ds = obj.Select(sql, null);
        string name = ds.Tables[0].Rows[0][1].ToString();
        string email = ds.Tables[0].Rows[0][2].ToString();
        tid = Request.QueryString["tid"];
        string type_name = Request.QueryString["type_name"];
        string menoy = Request.QueryString["price"];
        room_type.Text = type_name;
        price.Text = menoy;
        username.Text = name+" "+email;


    }
    protected void submit_Click(object sender, EventArgs e)
    {
        string rid = Request.Form["room_number"];
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "insert into [orders] (uid,rid,status) values('" + uid + "','" + rid + "','progress')";
        if (obj.Insert(sql, null))
        {
            sql = "update [room] set status ='checked' where rid=" + rid;
            obj.Update(sql, null);
            Response.Write("<script>alert('预定成功');window.location.href=\"index.aspx\";</script>");
        }
        else
        {
            Response.Write("<script>alert('预定失败')</script>");
        }
    }
}