using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class manager_room_edit : System.Web.UI.Page
{
    private string rid;
    protected void Page_Load(object sender, EventArgs e)
    {
        rid = Request.QueryString["rid"];
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "select number from [room] where rid=" + rid;
        string number = obj.Select(sql, null).Tables[0].Rows[0][0].ToString();
        room_number.Text = number;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string roomnumber = Request.Form["room_number"];
        string roomstatus = Request.Form["room_status"];
        string room_type_id = Request.Form["type_id"];
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "update [room] set tid ='" + room_type_id + "',number='" + roomnumber + "',status='"+roomstatus+"' where rid=" + rid;
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