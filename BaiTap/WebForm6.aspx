<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="BaiTap.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        .mar
        {
                   font-size: 24px;
           font-weight: bold;
           color: darkred;
           margin-bottom: 10px; 
           text-align:center
        }
        .trai
        {
               width: 200px;
    border: 2px solid black;
    text-align: left;
    padding: 20px;
    background-color: white;
    color:red;
    background-color:azure;

                
        }
    </style>
    <title> Quản Lý Shop</title>
</head>
<body style="background-color:wheat;">
    <form id="form1" runat="server">
        <div class="mar">
            SHOPACCABC.COM NƠI BÁN ACCOUNT-ITEMS-CÀY THUÊ-TIỀN TỆ TRONG GAME UY TÍN
        </div>
        <div>
            <div class="trai">
                <h3 style="background-color:aliceblue;">DANH MỤC QUẢN LÝ</h3>
                <asp:LinkButton runat="server" Style="text-decoration:none;">Trang chủ</asp:LinkButton>
                <br />
                <asp:LinkButton runat="server" OnClick="Item" Style="text-decoration:none;">Items</asp:LinkButton>
                <br />
                <asp:LinkButton runat="server" Style="text-decoration:none;">Account</asp:LinkButton>
                <br /><asp:LinkButton runat="server" Style="text-decoration:none;">Cày thuê</asp:LinkButton>
                <br /><asp:LinkButton runat="server" Style="text-decoration:none;">Tiền tệ trong các game</asp:LinkButton>
            </div>
        </div>
    </form>
</body>
</html>
