<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="StudentManagementSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .login-box {
            width: 350px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }

        h2 {
            text-align: center;
        }

        .input-box {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            font-size: 16px;
        }

        .message {
            display: block;
            color: red;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="login-box">

        <h2>Admin Login</h2>

        <asp:TextBox ID="txtUsername"
            runat="server"
            CssClass="input-box"
            Placeholder="Username">
        </asp:TextBox>

        <asp:TextBox ID="txtPassword"
            runat="server"
            CssClass="input-box"
            TextMode="Password"
            Placeholder="Password">
        </asp:TextBox>

        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="login-button"
            OnClick="btnLogin_Click" />

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

    </div>

</form>

</body>
</html>