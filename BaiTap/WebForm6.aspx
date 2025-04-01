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
    padding: 0px;
    background-color: white;
   
    background-color:azure;
    float:left;
          min-height:200px;  
       
        }
        .phai{
           border:2px solid;
            text-align:center;
            width:auto;
        min-height:200px;
       padding:0px;
       justify-content:center;
       flex:1px;
      
        } 
        .conten{
            width:auto;
        }
    </style>
    <title> Quản Lý Shop</title>
</head>
<body style="background-color:wheat;">
<link href="Css/StyleSheet1.css" rel="stylesheet" type="text/css" />   <form id="form1" runat="server">
        <header>
        <div class="mar">
            SHOPACCABC.COM NƠI BÁN ACCOUNT-ITEMS-CÀY THUÊ-TIỀN TỆ TRONG GAME UY TÍN
        </div>
            </header>
        <div class="conten" style="place-content:left;place-items:left">
            <div class="trai">
                <h3  style="background-color:aliceblue;width:100%; height: 30px; margin-left: 0px;text-align:left;padding:0px;color:red">DANH MỤC QUẢN LÝ</h3>
                <div style="padding-bottom:10px">
                <asp:LinkButton runat="server" Style="text-decoration:none;color:black;font-weight:bold;height:30px" PostBackUrl="~/WebForm1.aspx">Trang chủ</asp:LinkButton>
                </div>
                <div  style="padding-bottom:10px">
                <asp:LinkButton runat="server"  Style="text-decoration:none;color:blue;font-weight:bold;display:flow;" CommandArgument="0" OnClick="doi">Items</asp:LinkButton>
                
                </div >
               <div style="padding-bottom:10px"> <asp:LinkButton runat="server" Style="text-decoration:none;color:lightgreen;font-weight:bold" CommandArgument="1" OnClick="doi">Account</asp:LinkButton></div>
               <div style="padding-bottom:10px"><asp:LinkButton runat="server" Style="text-decoration:none;color:darkblue;font-weight:bold" CommandArgument="2" OnClick="doi"> Cày thuê</asp:LinkButton></div>
              <div style="padding-bottom:10px"><asp:LinkButton runat="server" Style="text-decoration:none;color:brown;font-weight:bold" CommandArgument="3" OnClick="doi"> Tiền tệ trong các game</asp:LinkButton></div>
            </div>
            <div class="phai">
                <asp:MultiView runat="server" ID="viewthunhat">
                    <asp:View runat="server" ID="view0">
                        <div style="display:flex;">
                        <div style="width:30%;place-items:center;place-content:center;text-align:center;padding-top:50px">
                            <asp:Label runat="server"> Mã loại sản phẩm</asp:Label>
                <asp:TextBox runat="server" CssClass="chinhbox" ID="t1">

                </asp:TextBox>
                            <asp:Label runat="server">Tên loại sản phẩm</asp:Label>
                        <asp:TextBox runat="server" CssClass="chinhbox" ID="t2"></asp:TextBox>
                        <asp:Button runat="server" Text="Thêm" CssClass="cn" ID="b1"/>
                            <asp:Button  runat="server" Text="hủy" ID="b2" CssClass="cn"/>
                            <div style="place-items:center;place-content:right;width:70%;padding-top:50px">
                                <asp:GridView ID="gri1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gri1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField ControlStyle-Width="100%" DataField="maloaisanpham" HeaderText="Mã Lọai Sản Phẩm">
                                        <ControlStyle Width="100%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tenloaisanpham" HeaderText="Tên Loại Sản Phẩm" />
                                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            </div>
                         
                            </div>
                    </asp:View>
                         <asp:View runat="server" ID="view1">
      <div style="display:flex">
          <div></div>
      </div>
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

                </asp:MultiView>
            </div>
        </div>
        <footer>
            <h3>
                Địa chỉ: ABC,ABC,ABC,ABC
                </h3>
            </footer>
              </form>
</body>
</html>
