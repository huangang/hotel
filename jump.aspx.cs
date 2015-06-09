using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] != null)
        {
            string role = Session["role"].ToString();
            if (role == "manager")
            {
                Response.Redirect("manager/index.aspx");
            }
            else if(role == "operator" )
            {
                Response.Redirect("operator/index.aspx");    
            }
            else if (role == "normal")
            {
                Response.Redirect("normal/index.aspx");   
            }
            else
            {
                Response.Redirect("login.aspx");   
            }
            
        }
        else
        {
            Response.Redirect("login.aspx");
        }

    }
}