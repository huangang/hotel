<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>登陆</title>
</head>
<body>
<style>
    body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #eee;
    }

    .form-signin {
        max-width: 330px;
        padding: 15px;
        margin: 0 auto;
    }
    .form-signin .form-signin-heading
    {
        margin-bottom: 10px;
    }
    .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="email"] {
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }

    .form-signin input[type="text"] {
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .input-group{
        margin-bottom: 10px;
    }

</style>


<div class="container">
    <form class="form-signin" role="form" method="post" runat="server">
        <h2 class="form-signin-heading">请登陆</h2>
        <div class="input-group">
            <div class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></div>
             <asp:TextBox ID="TBemail" runat="server" class="form-control" placeholder="邮箱"  required autofocus name="email" TextMode="SingleLine"></asp:TextBox> 
        </div>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ControlToValidate="TBemail" Display="Dynamic"
         ErrorMessage="邮箱格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#FF0066" Font-Size="15px"></asp:RegularExpressionValidator>


        <div class="input-group">
            <div class="input-group-addon"><span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span></div>
             <asp:TextBox ID="TBpassword" runat="server" class="form-control" placeholder="密码"  required name="password" TextMode="Password"></asp:TextBox>
        </div>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="密码不能少于6位" Display="Dynamic" ControlToValidate="TBpassword" Font-Size="15px" ForeColor="#FF0066" ValidationExpression="\S{6,}"></asp:RegularExpressionValidator>
        <asp:Button ID="Button1" runat="server" Text="登陆"  
            class="btn btn-lg btn-primary btn-block" onclick="Button1_Click"/>
        <br>
        <a href="register.aspx">注册</a>
        <a href="index.aspx">返回首页</a>
    </form>

</div>
</body>
</html>