<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link href="StyleSheet3.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrap">
        <div id="hook"></div>
        <div class="form-data">
                <p class="p-input pos">
                    <label for="txtUserName">用户名</label>
                    <input id="txtUserName" type="text" runat="server"/>
                </p>
                <p class="p-input pos">
                    <label for="txtUserPWD">密码</label>
                    <input id="txtUserPWD" type="password" runat="server"/>
                </p>
            <div class="buttonBlock">
                <asp:Button Text="Reset" CssClass="lang-btn btn1" runat="server" id="btnReset"/>
                <asp:Button Text="Login" CssClass="lang-btn btn2" runat="server" ID="btnLogin" OnClick="btnLogin_Click"/>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

