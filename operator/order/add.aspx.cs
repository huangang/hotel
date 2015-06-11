using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class operator_order_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string uid = Request.Form["uid"];
        string rid = Request.Form["rid"];
        string status = Request.Form["status"];
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "insert into [orders] (uid,rid,status) values('" + uid + "','" + rid + "','progress')";
        if (obj.Insert(sql, null))
        {
            sql = "update [room] set status ='"+status+"' where rid="+rid;
            obj.Update(sql, null);
            Response.Write("<script>alert('增加订单成功');window.location.href=\"index.aspx\";</script>");
        }
        else
        {
            Response.Write("<script>alert('增加订单失败')</script>");
        }
    }
}