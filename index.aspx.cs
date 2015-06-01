using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

public partial class _Default : System.Web.UI.Page
{
    SqlServerDataBase obj = new SqlServerDataBase(); 
    protected void Page_Load(object sender, EventArgs e)
    {

        DataSet ds = obj.Select("select * from [user];", null);
        Response.Write(ds);
        if (ds == null)  
        {  
            Response.Write("false");

        } 
        else 
        {  
            Response.Write("true");
        }  


    }
}