using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class manager_room_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string number = room_number.Text;
        string tid = Request.Form["type_id"];
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "insert into [room] (number,tid,status) values ('" + number + "','" + tid + "','empty')";
        if (obj.Insert(sql, null))
        {
            Response.Write("<script>alert('增加成功');window.location.href=\"index.aspx\";</script>");
        }
        else
        {
            Response.Write("<script>alert('增加失败');</script>");
        }


    }
}