<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
        #Password1 {
            width: 189px;
        }
    </style>
</head>
<body> 
    <form id="form1" runat="server">
        <h1 align="center">Sign in</h1>
    <p align="center">
        

        E-mail ID</p>
        <p align="center">
        

            <asp:TextBox ID="tEmail" runat="server" Width="199px"></asp:TextBox>

    </p>
        <p align="center">
            Password</p>
        <p align="center">
            <asp:TextBox ID="tPS" runat="server" Width="198px" CausesValidation="True" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tPS" Display="Dynamic" EnableClientScript="False" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
        </p>
        <p align="center">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Log In" />
        </p>
    </form>
</body>
</html>
