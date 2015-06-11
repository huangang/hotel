using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class normal_order_edit : System.Web.UI.Page
{
    private string uid;
    private string oid;
    private string rid;
    SqlServerDataBase obj = new SqlServerDataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        uid = Request.QueryString["uid"];
        string sql = "select username from [user] where uid=" + uid;
        string user_name = obj.Select(sql, null).Tables[0].Rows[0][0].ToString();
        username.Text = user_name;
        oid = Request.QueryString["oid"];
        rid = Request.QueryString["rid"];
        sql = "select number from [room] where rid=" + rid;
        string number = obj.Select(sql, null).Tables[0].Rows[0][0].ToString();
        room_number.Text = number;



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string order_status = Request.Form["order_status"];
        if (order_status == "finish")
        {
            string sql = "update [room] set status='empty' where rid=" + rid;
            bool b1 = obj.Update(sql, null);
            sql = "update [orders] set status='finish' where oid = " + oid;
            if (obj.Update(sql, null))
            {
                Response.Write("<script>alert('修改订单成功');window.location.href=\"index.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('修改订单失败')</script>");
            }

        }
        else
        {
            if (Request.Form["empty_room_number"] != "")
            {
                string empty_room_id = Request.Form["empty_room_number"];
                string room_status = Request.Form["room_status"];
                string sql = "update [room] set status='empty' where rid=" + rid;
                bool b1 = obj.Update(sql, null);
                sql = "update [room] set status='" + room_status + "' where rid=" + empty_room_id;
                bool b2 = obj.Update(sql, null);
                sql = "update [orders] set rid='" + empty_room_id + "' where oid = " + oid;
                if (obj.Update(sql, null))
                {
                    Response.Write("<script>alert('修改订单成功');window.location.href=\"index.aspx\";</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改订单失败')</script>");
                }

            }
        }

    }
}