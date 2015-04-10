<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebHost._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="+"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="="></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="0"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="add" />
        <br />
    
    </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
