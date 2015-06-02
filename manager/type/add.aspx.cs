using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class manager_type_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string type_name = typename.Text;
        string type_price = price.Text;
        string type_description = description.Text;
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "insert into [type] (type_name,price,description) values ('"+type_name+"','"+type_price+"','"+type_description+"')";
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