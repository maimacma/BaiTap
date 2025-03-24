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
           text-align:center;
         
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
    float:left;
          min-height:200px;     
        }
        .phai{
           border:2px solid;
            text-align:center;
            width:auto;
        
       padding:20px;
       justify-content:center;
       flex:1px;
       min-height:200px;
        } 
        .conten{
            width:auto;
        }
    </style>
    <title> Quản Lý Shop</title>
</head>
<body style="background-color:wheat;">
    <form id="form1" runat="server">
        <div class="mar">
            SHOPACCABC.COM NƠI BÁN ACCOUNT-ITEMS-CÀY THUÊ-TIỀN TỆ TRONG GAME UY TÍN
        </div>
        <div class="conten">
            <div class="trai">
                <h3 style="background-color:aliceblue;">DANH MỤC QUẢN LÝ</h3>
                <asp:LinkButton runat="server" Style="text-decoration:none;color:black;font-weight:bold" CommandArgument="0" OnClick="doi">Trang chủ</asp:LinkButton>
                <br />
                <asp:LinkButton runat="server"  Style="text-decoration:none;color:blue;font-weight:bold" CommandArgument="1" OnClick="doi">Items</asp:LinkButton>
                <br />
                <asp:LinkButton runat="server" Style="text-decoration:none;color:lightgreen;font-weight:bold" CommandArgument="2" OnClick="doi">Account</asp:LinkButton>
                <br /><asp:LinkButton runat="server" Style="text-decoration:none;color:darkblue;font-weight:bold" CommandArgument="3" OnClick="doi">
                    Cày thuê</asp:LinkButton>
                <br /><asp:LinkButton runat="server" Style="text-decoration:none;color:brown;font-weight:bold" CommandArgument="4" OnClick="doi">
                    Tiền tệ trong các game</asp:LinkButton>
            </div>
            <div class="phai">
                <asp:MultiView runat="server" ID="viewthunhat">
                    <asp:View runat="server" ID="view0">
                        <h2>
                            TRANG CHỦ
                        </h2>
                        <a>
                            ĐÂY LÀ TRANG CHỦ

                        </a>
                    </asp:View>
                         <asp:View runat="server" ID="view1">
         <h2>
             ITEMS ĐANG HIỆN HỮU
         </h2>
         <a>
             ĐÂY LÀ MỤC ITEMS HIỆN HỮU

         </a>
     </asp:View>
                         <asp:View runat="server" ID="view2">
         <h2>
             ACCOUNT ĐANG CÓ TRONG SHOP
         </h2>
         <a>
             ĐÂY LÀ MỤC ACCOUNT ĐANG CÓ Ở TRONG SHOP

         </a>
     </asp:View>
                         <asp:View runat="server" ID="view3">
         <h2>
             CÁC LOẠI CÀY THUÊ HIỆN CÓ
         </h2>
         <a>
             TẤT CẢ CÁC LOẠI CÀY THUÊ HIỆN CÓ

         </a>
     </asp:View>
                         <asp:View runat="server" ID="view4">
         <h2>
             CÁC LOẠI TIỀN TỆ HIỆN ĐANG BÁN
         </h2>
         <a>
           ĐÂY MỤC CÁC LOẠI TIỀN TỆ HIỆN ĐANG BÁN

         </a>
     </asp:View>
                </asp:MultiView>
            </div>
        </div>
    </form>
</body>
</html>
