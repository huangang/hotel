﻿<%@ WebHandler Language="C#" Class="delete" %>

using System;
using System.Web;
using Mysqlserver;

public class delete : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string table = context.Request.QueryString["table"];
        SqlServerDataBase obj = new SqlServerDataBase();
        if (table == "type")
        {
            string tid = context.Request.QueryString["tid"];
            string sql = "delete from [type] where tid=" + tid;
            if (obj.Delete(sql, null))
            {
                context.Response.Write(1);
            }
            else
            {
                context.Response.Write(0);
            }
        }
        else if (table == "room")
        {
            string rid = context.Request.QueryString["rid"];
            string sql = "delete from [room] where rid=" + rid;
            if (obj.Delete(sql, null))
            {
                context.Response.Write(1);
            }
            else
            {
                context.Response.Write(0);
            }
        }
       
    }
 
    public bool IsReusable {
        get {
            return true;
        }
    }

}