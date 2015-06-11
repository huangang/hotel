<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Mysqlserver" %>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
      <meta charset="utf-8"/>
      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hetol</title>
      <link href="css/template.css" rel="stylesheet"/>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <div id="page">
      <header id="header" class="site-header">
        <nav id="topbar" class="site-topbar visible-lg visible-md">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">Questions? Call us toll free: +1 234 4567 890</div>
              <div class="social-links col-sm-6">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>
                <a href="#"><i class="fa fa-pinterest"></i></a>
              </div>
            </div>
          </div>
        </nav>

        <nav id="navbar" class="site-navbar navbar navbar-static-top one-page-nav" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars"></i>
              </button>
              <h1 class="navbar-brand"><i class="fa fa-power-off"></i> <a href="index.aspx">Start</a></h1>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-1">
              <ul id="navigation" class="nav navbar-nav navbar-right">
                <li class="active"><a href="#header" class="current">Home</a></li>
                <%
                    if (Session["uid"] != null)
                    {
                        Response.Write("<li><a href=\"jump.aspx\" onclick=\"window.location.href='jump.aspx';\">Admin</a></li>");
                        Response.Write("<li><a href=\"exit.aspx\" onclick=\"window.location.href='exit.aspx';\">Exit</a></li>");
                    }
                    else
                    {
                        Response.Write("<li><a href=\"login.aspx\" onclick=\"window.location.href='login.aspx';\">Login</a></li>");
                        Response.Write("<li><a href='register.aspx' onclick=\"window.location.href='register.aspx';\">Register</a></li>");
                    }
                %>
                <li><a href="#room">Room</a></li>

               
              </ul>
            </div>
          </div>
        </nav>
      </header>

      <main id="main" class="site-main">
        <section class="section section-center section-cta">
          <div class="container">
            <h2 class="section-title"><span>Ready to Start?</span></h2>
            <p>ASP.net 酒店管理系统</p>
            <div class="main-action row">
              <div class="col-md-3 col-md-offset-3 col-sm-4 col-sm-offset-2"><a href="#room" class="smooth-scroll btn btn-lg btn-block btn-danger">Request Quote</a></div>
              <div class="col-md-3 col-sm-4"><a href="#room" class="smooth-scroll btn btn-lg btn-block btn-default">View Rooms</a></div>
            </div>
          </div>

        </section>     
         <section id="room" class="section section-center section-pricing">
            <div class="container">
                <h2 class="section-title"><span>Rooms Pricing</span></h2>
                <div class="pricing-table">
                    <div class="row">
                          <%

                            SqlServerDataBase obj = new SqlServerDataBase();
                            string sql = "select *from [type]";
                            DataSet ds = obj.Select(sql, null);
                            if (ds != null || ds.Tables.Count != 0 || ds.Tables[0].Rows.Count != 0)
                            {
                                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                {
                                
                                    string tid = ds.Tables[0].Rows[i][0].ToString();
                                    sql = "select count(*) from [room] where tid='" + tid +"'";
                                    string countr = obj.Select(sql, null).Tables[0].Rows[0][0].ToString();
                                    sql = "select count(*) from [room] where tid='" + tid + "' and status = 'empty'";
                                    string emptycountr = obj.Select(sql, null).Tables[0].Rows[0][0].ToString();
                                    string type_name = ds.Tables[0].Rows[i][1].ToString();
                                    string price = ds.Tables[0].Rows[i][2].ToString();
                                    string description = ds.Tables[0].Rows[i][3].ToString();
                                    Response.Write("<div class=\"col-md-3 col-sm-6\"><div class=\"panel panel-primary\"><header class=\"panel-heading\"><h1>" + type_name  + "</h1>");
                                    Response.Write("<div class=\"the-price\"> ￥"+ price +"<span class=\"subscript\">/ day</span></div></header>");
                                    Response.Write("<div class=\"panel-body\"><table class=\"table\"><tbody><tr><td>总共有"+countr +"个房间</td></tr>");
                                    Response.Write("<tr class=\"active\"><td>空房间：" + emptycountr + "个</td></tr>");
                                    Response.Write("<div class=\"panel-body\"><table class=\"table\"><tbody><tr><td>" + description + "</td></tr>");
                                    if (Session["uid"] != null)
                                    {
                                        if (emptycountr != "0")
                                        {
                                            Response.Write("</tbody></table> </div><footer class=\"panel-footer\"><a href=\"order.aspx?tid=" + tid + "&type_name=" + type_name + "&price="+price+"&uid="+ Session["uid"] +"\" class=\"btn btn-block btn-primary\">预定</a></footer></div></div>");
                                        }
                                        else
                                        {
                                            Response.Write("</tbody></table> </div><footer class=\"panel-footer\"><a href=\"#\" class=\"btn btn-block btn-primary\" disabled=\"disabled\">房间已满</a></footer></div></div>");
                                        }
                                    }
                                    else
                                    {
                                        Response.Write("</tbody></table> </div><footer class=\"panel-footer\"><a href=\"login.aspx\" class=\"btn btn-block btn-primary\">请登录后预定</a></footer></div></div>");
                                    }

                                }

                                    
                            }
   


                        %>
                    </div>
                </div>
            </div>
        </section>

      </main>

      <footer id="footer" class="site-footer">
        <div class="container">
          <div class="copyright"><p>© 2015 Company, Inc.<br /> Power by <a href="http://weixin.pupued.com">pupued</a></p></div>
        </div>
      </footer>
    </div>

    <div class="scroll-to-top" data-spy="affix" data-offset-top="200"><a href="#page" class="smooth-scroll"><i class="fa fa-arrow-up"></i></a></div>
  
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="js/jquery.singlePageNav.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
  </body>
</html>